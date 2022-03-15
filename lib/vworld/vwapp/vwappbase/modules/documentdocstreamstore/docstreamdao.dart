import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/docstream.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/document.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/documentdocstreamstore/documentdocstreamstore.dart';
import 'dart:convert';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/sqlitedb/documentdatabaseprovider.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/util/cryptoutil/cryptoutil.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/util/stringutil.dart';

class DocstreamDao {
  static final dbProvider = DocumentDatabaseProvider.dbProvider;

  static Future<List<DocStream>> queryRecord({
    required String where,
    required List<dynamic> whereArgs,
    List<String>? columns,
    int offset: 0,
    int limit: 100,
    String? orderBy,
  }) async {
    List<DocStream> returnValue = <DocStream>[];

    try {
      if (whereArgs.length > 0 && whereArgs.elementAt(0) == null) {
        print("null argument catched");
      } else {
        List<Map<String, dynamic>> result;
        final db = await DocstreamDao.dbProvider.database;

        if (columns != null) {
          result = await db!.query(DocumentDatabaseProvider.docstreamTable,
              columns: columns,
              where: where,
              limit: limit,
              offset: offset,
              whereArgs: whereArgs,
              orderBy: orderBy);
        } else {
          result = await db!.query(DocumentDatabaseProvider.docstreamTable,
              where: where,
              limit: limit,
              offset: offset,
              whereArgs: whereArgs,
              orderBy: orderBy);
        }

        returnValue = result.isNotEmpty
            ? result.map((item) => DocStream.fromJson(item)).toList()
            : <DocStream>[];
      }
    } catch (error) {
      print(
          "Error catched on DocstreamDao.queryRecord(String where,List<String> whereArgs); Error=" +
              error.toString());
    }

    return returnValue;
  }

  static Future<DocStream?> getDocstreamByDocumentId(
      {required documentId}) async {
    DocStream? returnValue;
    try {
      String where = ' ' + Document.id_CCFN + ' = ? ';

      List<dynamic> whereArgs = <dynamic>[documentId];

      List<DocStream> docStreamList =
          await DocstreamDao.queryRecord(where: where, whereArgs: whereArgs);

      if (docStreamList.length > 0) {
        returnValue = docStreamList.elementAt(0);
      }
    } catch (error) {}

    return returnValue;
  }



  static Future<int> insertRecord(DocStream docStream) async {
    int result = 0;
    try {
      final Database? db = await DocstreamDao.dbProvider.database;
      Map<String, dynamic> recordInJson = docStream.toJson();
      result = await db!
          .insert(DocumentDatabaseProvider.docstreamTable, recordInJson);
    } catch (error) {
      print(
          "Error catched on DocstreamDao::insertRecord(DocStream docStream); Error Message=" +
              error.toString());
    }

    return result;
  }

  static Future<int> updateRecord(DocStream docStream) async {
    var result = 0;

    try {
      final Database? db = await DocstreamDao.dbProvider.database;

      result = await db!.update(
          DocumentDatabaseProvider.docstreamTable, docStream.toJson(),
          where: ' ${DocStream.id_CCFN}=? ', whereArgs: [docStream.id]);
    } catch (err) {
      print('error on updating' + err.toString());
    }
    return result;
  }

  static Future<int> deleteRecord(String docStreamId) async {
    int result = 0;

    try {
      final Database? db = await DocstreamDao.dbProvider.database;

      result = await db!.delete(DocumentDatabaseProvider.docstreamTable,
          where: 'docstream_id=?', whereArgs: <String>[docStreamId]);
    } catch (err) {
      print('error on updating' + err.toString());
    }
    return result;
  }

  static Future<int> disableStream(String? docstreamId) async {
    int returnValue = 0;
    try {
      final DocStream? docStreamCurrentRecord =
          await DocumentDocStreamStore.getDocstreamById(id: docstreamId);

      if (docStreamCurrentRecord != null) {
        docStreamCurrentRecord.streamstatusId = "0";
        docStreamCurrentRecord.prevDocumentId =
            docStreamCurrentRecord.document!.id;

        docStreamCurrentRecord.prevDocumentDocumenttypeId =
            docStreamCurrentRecord.document!.documenttypeId;
        docStreamCurrentRecord.document!.id = Uuid().v4();
        docStreamCurrentRecord.document!.documenttypeId =
            Document.deletedDocumenttypeId;

        docStreamCurrentRecord.document!.documentstatusId = "0";
        returnValue = await DocstreamDao.updateRecord(docStreamCurrentRecord);
      }
    } catch (error) {
      print("Error catched on DocumentDocStreamStore.disableStream: " +
          error.toString());
    }

    return returnValue;
  }

  static Future<int> createNewDownsyncDocStream(DocStream docStream) async {
    //do not call directly instead use sync Document or syncDocumentInDocstream
    int result = 0;

    try {
      result = await DocstreamDao.insertRecord(docStream);
    } catch (err) {
      print(
          "Error catched on DocstreamDao::createNewRecord(DocStream docStream)=" +
              err.toString());
    }
    print(
        'Result Create New Record docStream:${docStream.id} ${docStream.document!.documenttypeId} ${result}');
    return result;
  }

  static Future<int> createNewDocStream(DocStream docStream) async {
    //do not call directly instead use sync Document or syncDocumentInDocstream
    int result = 0;

    try {
      /*
      if (docStream.serverStreamId == null ||
          docStream.serverStreamId.length == 0) {
        docStream.serverStreamId = Uuid().v4();
      }*/

      //docStream.document.jsonHashBycreator = CryptoUtil.getMd5(docStream.document.json);

      docStream.document!.refreshCreatorJsonSignature();
      //final db = await DocstreamDao.dbProvider.database;

      docStream.jsonDocument = json.encode(docStream.document!.toJson());
      docStream.jsonDocumentMd5 = CryptoUtil.getMd5(docStream.jsonDocument!);

      docStream.upsynctoken = DocStream.invalidUpsyncToken_FieldValue;
      docStream.servertoken = DocStream.invalidServerToken_FieldValue;

      if (docStream.created == null) {
        docStream.created = StringUtil.toMySqlFormat(DateTime.now());
      }

      docStream.lastupdate = StringUtil.toMySqlFormat(DateTime.now());

      result = await DocstreamDao.insertRecord(docStream);
    } catch (err) {
      print(
          "Error catched on DocstreamDao::createNewRecord(DocStream docStream)=" +
              err.toString());
    }
    print(
        'Result Create New Record docStream:${docStream.id} ${docStream.document!.documenttypeId} ${result}');
    return result;
  }
}

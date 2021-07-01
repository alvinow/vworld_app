import 'dart:async';
import 'dart:typed_data';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vworld_app/vworld/vwapp/vwappbase/appstaticparam.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/loginresponse.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/docstream.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/document.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/documentsearchparambyfields.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/downsyncdocstreamrequest.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/filedocumentlink.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/upsyncdocstreamresponse.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/upsynctoken.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/util/cryptoutil/cryptoutil.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/util/stringutil.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/util/userrespository.dart';
import 'dart:io';
import 'docstreamdao.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' as Io;
import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as path;

class DocumentDocStreamStore {
  static Future<List<DocStream >> getUnuploadedDocstream(
      {int offset: 0, int limit: 10000}) async {
    List<DocStream> returnValue = List<DocStream>();
    try {



      returnValue = await DocstreamDao.queryRecord(
          where: Document.isLocalClientOnly_CCFN +
              " = ? AND " +
              DocStream.servertoken_CCFN +
              ' = ? AND ${DocStream.streamstatusId_CCFN}=? ORDER BY docstream_lastupdate ',
          offset: offset,
          limit: limit,
          whereArgs: <dynamic>[
            0,
            DocStream.invalidServerToken_FieldValue,
            "1"
          ]);
    } catch (error) {
      print("Error catched on DocumentDocStreamStore.getUnuploadedDocstream: " +
          error.toString());
    }
    return returnValue;
  }

  static Future<bool> createDirectoryIfNotExists(String path) async {
    bool returnValue = false;
    try {
      bool isDirectoryExists = await Directory(path).exists();

      if (isDirectoryExists == false) {
        var myDir = await Directory(path).create(recursive: true);
        returnValue = true;
      } else {
        returnValue = true;
      }
    } catch (error) {
      print(
          "Error catched on FileManagerDocStreamBloc.mapEventToState ${error.toString()}");
    }
    return returnValue;
  }

  static DocumentSearchParamByFields
  getDocumentSearchParamByFieldOfFileDocumentLink() {
    DocumentSearchParamByFields returnValue = DocumentSearchParamByFields(
        title: 'DocumentType Group',
        requiredSearchFieldList: List<DocumentSearchField>(),
        optionalSearchFieldList: List<DocumentSearchField>(),
        documentOrderFieldList: List<DocumentOrderField>());

    DocumentSearchField documentSearchField = DocumentSearchField(
        isActive: true,
        isHidden: true,
        displayCaption: 'Document Type Id',
        fieldName: Document.documenttypeId_CCFN,
        queryValue: Document.fileDocumentLinkDocumenttypeId,
        equalityOperator: '=');

    returnValue.requiredSearchFieldList.add(documentSearchField);

    WhereQuerySetParam whereQuerySetParam = returnValue.getQuerySetParam();

    String debugWhereQuery = WhereQuerySetParam.toolsGetSqlWhereQuery(
        whereQuerySetParam.query, whereQuerySetParam.valueList);

    print(
        "getDocumentSearchParamByFieldOfFileDocumentLink: " + debugWhereQuery);

    return returnValue;
  }

  static Future<void> processDownsyncBinary(DocStream currentDocStream) async {
    try {
      if (currentDocStream.document.documenttypeId ==
          Document.fileDocumentLinkDocumenttypeId) {
        if (currentDocStream.document.binaryUploadBase64 != null) {
          Uint8List bytes =
          base64Decode(currentDocStream.document.binaryUploadBase64);

          String clientBinaryMd5 = md5.convert(bytes).toString();

          if (clientBinaryMd5 == currentDocStream.document.binaryUploadMd5) {
            FileDocumentBinary fileDocumentBinary = FileDocumentBinary.fromJson(
                json.decode(currentDocStream.document.json));

            //String basename =  path.basename(fileDocumentBinary.sourceFileInfo.fileNameFullpath);

            //String dirname = path.dirname(fileDocumentBinary.sourceFileInfo.fileNameFullpath);

            Directory appSavingDir =
            await UserRepository .getAppSavingDirectory();

            //String binaryFilePathDir= path.join(appDocDir.path,"binaryfile");

            bool isDirexists =
            await DocumentDocStreamStore.createDirectoryIfNotExists(
                appSavingDir.path);

            if (isDirexists == true) {
              String currentFilename = currentDocStream.document.id;

              String currentFilenameFullpath =
              path.join(appSavingDir.path, currentFilename);

              final File currentFile = await File(currentFilenameFullpath);

              bool isFileExists = await currentFile.exists();

              if (isFileExists == false) {
                await Io.File(currentFilenameFullpath).writeAsBytes(bytes);
              }
            }
          }
        }
      }
      if (currentDocStream.document.binaryUploadBase64 != null) {
        currentDocStream.document.binaryUploadBase64 = null;
      }
    } catch (error) {
      print(
          "Error catched on static Future<bool> downsyncBinary(DocStream docStream);ErrorMessage=${error.toString()}");
    }
  }

  static Future<DocStream> getDocstreamById({@required String id}) async {
    DocStream returnValue;

    try {
      String where = '  ${DocStream.id_CCFN}  = ? ';

      List<dynamic> whereArgs = <dynamic>[id];

      List<DocStream> docStreamList =
      await DocstreamDao.queryRecord(where: where, whereArgs: whereArgs);

      if (docStreamList.length > 0) {
        returnValue = docStreamList.elementAt(0);
      }
    } catch (error) {}

    return returnValue;
  }

  static Future<List<DocStream>> getDocstreamsByRefId(
      {@required String refId}) async {
    List<DocStream> returnValue = List<DocStream>();
    try {
      DocumentSearchField documentSearchFieldRefId = DocumentSearchField(
          isActive: true,
          isHidden: true,
          displayCaption: 'untitled',
          fieldName: Document.refId_CCFN,
          queryValue: refId,
          equalityOperator: '=');

      DocumentSearchField documentSearchFieldStreamstatusId =
      DocumentSearchField(
          isActive: true,
          isHidden: true,
          displayCaption: 'untitled',
          fieldName: DocStream.streamstatusId_CCFN,
          queryValue: '1',
          equalityOperator: '=');

      DocumentSearchField documentSearchFieldDocumentstatusId =
      DocumentSearchField(
          isActive: true,
          isHidden: true,
          displayCaption: 'untitled',
          fieldName: Document.documentstatusId_CCFN,
          queryValue: '1',
          equalityOperator: '=');

      DocumentOrderField documentOrderField1 = DocumentOrderField(
          isActive: true,
          displayCaption: 'Numerical Order',
          fieldName: Document.created_CCFN);

      DocumentSearchParamByFields documentSearchParamByField =
      DocumentSearchParamByFields(
        title: 'untitled',
        searchGeneralKeyword: null,
      );

      documentSearchParamByField.requiredSearchFieldList
          .add(documentSearchFieldRefId);
      documentSearchParamByField.requiredSearchFieldList
          .add(documentSearchFieldStreamstatusId);
      documentSearchParamByField.requiredSearchFieldList
          .add(documentSearchFieldDocumentstatusId);
      documentSearchParamByField.documentOrderFieldList
          .add(documentOrderField1);

      returnValue =
      await DocumentDocStreamStore.getDocStreamBySearchParamByField(
          documentSearchParamByField);
    } catch (Error) {}
    return returnValue;
  }

  static Future<int> downsyncDocumentInDoctsream(DocStream docStream) async {
    int returnValue = 0;

    try {
      DocStream existingRecord = await getDocstreamById(id: docStream.id);

      DocStream existingRecordByDocumentId =
      await DocstreamDao.getDocstreamByDocumentId(
          documentId: docStream.document.id);

      if (existingRecord != null) {
        if (existingRecord.jsonDocumentMd5 != docStream.jsonDocumentMd5 ||
            existingRecord.servertoken == '<INVALID_SERVER_TOKEN>') {
          await DocstreamDao.updateRecord(docStream);
        } else {
          //do nothing
        }
      } else {
        if (existingRecordByDocumentId != null) {
          await DocstreamDao.disableStream(existingRecordByDocumentId.id);
        }

        await DocstreamDao.createNewDownsyncDocStream(docStream);
      }
      existingRecord = null;
      existingRecordByDocumentId = null;
    } catch (error) {
      print(
          "Error catched on static Future<int> syncRecord(DocStream docStream) async; ErrorMessage=" +
              error.toString());
    }

    return returnValue;
  }

  static Future<int> syncDocumentInDoctsream(DocStream docStream) async {
    int returnValue = 0;

    try {
      DocStream existingRecord = await getDocstreamById(id: docStream.id);

      DocStream existingRecordByDocumentId =
      await DocstreamDao.getDocstreamByDocumentId(
          documentId: docStream.document.id);

      if (existingRecordByDocumentId == null) {
        if (existingRecord != null) {
          if (existingRecord.jsonDocumentMd5 != docStream.jsonDocumentMd5) {
            await DocstreamDao.updateRecord(docStream);
          }
        } else {
          await DocstreamDao.createNewDocStream(docStream);
        }
      } else {
        if (existingRecordByDocumentId.jsonDocumentMd5 ==
            docStream.jsonDocumentMd5) {
        } else {
          if (existingRecord != null) {
            if (existingRecord.jsonDocumentMd5 != docStream.jsonDocumentMd5) {
              await DocstreamDao.updateRecord(docStream);
            }
          } else {
            await DocstreamDao.createNewDocStream(docStream);
          }
        }
      }
      existingRecord = null;
      existingRecordByDocumentId = null;
    } catch (error) {
      print(
          "Error catched on static Future<int> syncRecord(DocStream docStream) async; ErrorMessage=" +
              error.toString());
    }

    return returnValue;
  }

  static Future<int> getCountUnuploadedDocstream() async {
    int returnValue = 0;
    try {
      final List<DocStream> unuploadedDocstreamList =
      await DocumentDocStreamStore.getUnuploadedDocstream();

      returnValue = unuploadedDocstreamList.length;
    } catch (error) {
      print(
          "Error catched on DocumentDocStreamStore.getCountUnuploadedDocstream: " +
              error.toString());
    }
    return returnValue;
  }

  static Future<List<DocStream>> getResponseQuotionerByUserloginId(
      {@required String userloginId}) async {
    List<DocStream> returnValue = List<DocStream>();
    try {
      returnValue = await DocstreamDao.queryRecord(
          where: Document.ownerUserloginId_CCFN +
              ' = ? AND ${DocStream.streamstatusId_CCFN}=? ORDER BY docstream_lastupdate ',
          whereArgs: <dynamic>[userloginId, "1"]);
    } catch (error) {
      print("Error catched on DocumentDocStreamStore.getUnuploadedDocstream: " +
          error.toString());
    }
    return returnValue;
  }

  static Future<int> syncDocument(Document document) async {
    int returnValue = 0;
    try {
      LoginResponse loginResponse =
      await UserRepository.getLoginResponseFromDevice();

      document.creatorLoginsessionId = loginResponse.loginsessionId;

      String created = Document.DateTimeNowUtcMySQLFormat();

      DocStream docStream =
      await DocstreamDao.getDocstreamByDocumentId(documentId: document.id);

      if (docStream != null) {
        await DocstreamDao.disableStream(docStream.id);
        document.created = docStream.created;
      }

      if (document.created == null) {
        document.created = StringUtil.toMySqlFormat(DateTime.now());
      }

      document.lastupdate = StringUtil.toMySqlFormat(DateTime.now());

      docStream = DocStream.fromDocument(
          document: document,
          streamstatusId: "1",
          created: created,
          loginResponse: loginResponse);

      returnValue = await DocstreamDao.createNewDocStream(docStream);
    } catch (error) {
      print(
          "Error catched in static Future<int> DocumentDocStreamStore.syncDocument(Document document); Error message=" +
              error.toString());
    }
    return returnValue;
  }

  static Future<int> deleteDocumentById({@required String documentId}) async {
    //deleting means set documentstatusId=0
    int returnValue = 0;
    try {
      //set document status id to 0

      DocStream docStream =
      await DocstreamDao.getDocstreamByDocumentId(documentId: documentId);

      if (docStream != null) {
        await DocstreamDao.disableStream(docStream.id);
        docStream.document.documentstatusId = '0';
        returnValue = await DocstreamDao.createNewDocStream(docStream);
      }
    } catch (error) {
      print(
          "Error occured on static Future<int> deleteDocument; Error Message=" +
              error.toString());
    }

    return returnValue;
  }

  static Future<List<Document>> getDocumentsByRefId(
      {@required String refId}) async {
    List<Document> returnValue = List<Document>();
    try {
      List<DocStream> documentDocStreamList =
      await DocumentDocStreamStore.getDocstreamsByRefId(refId: refId);

      for (int la = 0; la < documentDocStreamList.length; la++) {
        returnValue.add(documentDocStreamList.elementAt(la).document);
      }
    } catch (error) {}

    return returnValue;
  }

  static Future<Document> getDocumentById({@required String documentId}) async {
    Document returnValue;
    try {
      DocStream documentDocStream =
      await DocstreamDao.getDocstreamByDocumentId(documentId: documentId);

      //returnValue = Document.fromDocStream(documentDocStream);
      returnValue = documentDocStream.document;
    } catch (error) {}

    return returnValue;
  }

  static List<Document> getDocumentsFromDocstreams(List<DocStream> docstream) {
    List<Document> returnValue = List<Document>();
    for (int la = 0; la < docstream.length; la++) {
      Document currentDocument = docstream.elementAt(la).document;

      if (currentDocument != null) {
        returnValue.add(currentDocument);
      }
    }
    return returnValue;
  }



  static Future<List<DocStream>> getDocStreamsForMd5SumBySearchParamByField(
      DocumentSearchParamByFields documentSearchParamByField,{List<String> columns}) async {
    List<DocStream> returnValue = List<DocStream>();

    WhereQuerySetParam querySetParam =
    documentSearchParamByField.getQuerySetParam();

    if (querySetParam != null) {
      String where = querySetParam.query;
      List<dynamic> whereArgs = querySetParam.valueList;

      //String orderByParam = documentSearchParamByField.getOrderParam();

      //String testWhereQuery= WhereQuerySetParam.toolsGetSqlWhereQuery(where,whereArgs);

      returnValue = await DocstreamDao.queryRecord(
          where: where,
          columns: columns,
          whereArgs: whereArgs,
          offset: 0,
          limit: 1000000,
          orderBy: DocStream.jsonDocumentMd5_CCFN);
    } else {
      //zero result
    }

    return returnValue;
  }

  static Future<String> getDocumentMd5SumBySearchParamByField(
      DocumentSearchParamByFields documentSearchParamByField) async {
    String returnValue;



    List<DocStream> docStreamList =
    await DocumentDocStreamStore.getDocStreamsForMd5SumBySearchParamByField(
        documentSearchParamByField,columns: <String> [DocStream.id_CCFN,DocStream.jsonDocumentMd5_CCFN,Document.id_CCFN,Document.ownerUserloginId_CCFN,Document.creatorLoginsessionId_CCFN]);

    if (docStreamList.length > 0) {
      String jsondocumentMd5Sum;
      if (docStreamList.length > 0) {
        for (int la = 0; la < docStreamList.length; la++) {
          DocStream currentDocstream = docStreamList.elementAt(la);

          if (jsondocumentMd5Sum == null) {
            jsondocumentMd5Sum = currentDocstream.jsonDocumentMd5;
          } else {
            jsondocumentMd5Sum =
                jsondocumentMd5Sum + ',' + currentDocstream.jsonDocumentMd5;
          }
        }
        returnValue = CryptoUtil.getMd5(jsondocumentMd5Sum);
      }
    } else {
      //zero result
    }

    return returnValue;
  }



  static Future<List<Document>> getDocumentsBySearchParamByField(
      DocumentSearchParamByFields documentSearchParamByField, {
        List<String> columns,
        int offset: 0,
        int limit: 100,
      }) async {
    List<DocStream> docstreams =
    await DocumentDocStreamStore.getDocStreamBySearchParamByField(
        documentSearchParamByField,
        columns:columns,
        offset: offset,
        limit: limit);

    List<Document> returnValue =
    DocumentDocStreamStore.getDocumentsFromDocstreams(docstreams);

    return returnValue;
  }

  static Future<List<DocStream>> getDocStreamBySearchParamByField(
      DocumentSearchParamByFields documentSearchParamByField, {
        List<String> columns,
        int offset: 0,
        int limit: 100,
      }) async {
    List<DocStream> returnValue = List<DocStream>();
    try {
      WhereQuerySetParam querySetParam =
      documentSearchParamByField.getQuerySetParam();

      if (querySetParam != null) {
        String where = querySetParam.query;
        List<dynamic> whereArgs = querySetParam.valueList;

        String orderByParam = documentSearchParamByField.getOrderParam();

        String testWhereQuery =
        WhereQuerySetParam.toolsGetSqlWhereQuery(where, whereArgs);

        List<DocStream> docStreamList = await DocstreamDao.queryRecord(
            columns: columns,
            where: where,
            whereArgs: whereArgs,
            offset: offset,
            limit: limit,
            orderBy: orderByParam);

        if (docStreamList.length > 0) {
          returnValue = docStreamList;
        }
      } else {
        //zero result
      }
    } catch (error) {
      print(
          "Error catched on DocumentDocStreamStore.getInstancesBySearchParamByField: ErrorMessage=${error.toString()}");
    }

    return returnValue;
  }

  static Future<void> tokenizingDocstreams(
      String loginsessionId, List<DocStream> docstreamList) async {
    try {
      int requestTokenCount = 0;

      List<DocStream> untokenizedList = List<DocStream>();

      for (int lc = 0; lc < docstreamList.length; lc++) {
        DocStream currentDocStream = docstreamList.elementAt(lc);

        if (currentDocStream.upsynctoken == '<INVALID_UPSYNC_TOKEN>') {
          requestTokenCount++;
          untokenizedList.add(currentDocStream);
        }
      }

      if (untokenizedList.length > 0) {
        List<UpsyncToken > tokenList =
        await DocumentDocStreamStore.requestUpsyncToken(
            loginsessionId, untokenizedList);
        untokenizedList.clear();

        for (int la = 0; la < tokenList.length; la++) {
          UpsyncToken currentUpsyncToken = tokenList.elementAt(la);

          DocStream currentDocstream =
          await DocumentDocStreamStore.getDocstreamById(
              id: currentUpsyncToken.docstreamId);

          currentDocstream.upsynctoken = currentUpsyncToken.token;

          DocstreamDao.updateRecord(currentDocstream);
          currentDocstream = null;
        }
        tokenList.clear();
      }
    } catch (error) {
      print(
          "Error catched on DocumentDocStramStore.preUploadProcessingFileDocumentList: " +
              error.toString());
    }
  }

  static List<UpsyncToken> createUpsyncTokenFromDocStreams(
      String loginsessionId, List<DocStream> docStreamList) {
    List<UpsyncToken> returnValue = List<UpsyncToken>();
    try {
      for (int la = 0; la < docStreamList.length; la++) {
        DocStream currentElement = docStreamList.elementAt(la);

        UpsyncToken currentObject = UpsyncToken(
            token: null,
            loginsessionId: loginsessionId,
            docstreamId: currentElement.id,
            jsonDocumentMd5: currentElement.jsonDocumentMd5);

        returnValue.add(currentObject);
      }
    } catch (error) {}

    return returnValue;
  }

  static Document createMemoryDocumentsByEncodedJson(
      String encodedJson, String documenttypeId) {
    String refid = Uuid().v4();
    String refIdMd5 = CryptoUtil.getMd5(refid);

    Document returnValue = Document(
        id: Uuid().v4(),
        refId: refid,
        refIdMd5: refIdMd5,
        created: StringUtil.toMySqlFormat(DateTime.now()),
        documentstatusId: "1",
        documenttypeId: documenttypeId,
        json: encodedJson,
        ownerUserloginId: null,
        jsonHashBycreator: null,
        ownerGroupId: null,
        lastupdate: StringUtil.toMySqlFormat(DateTime.now()),
        isLocalClientOnly: null);

    return returnValue;
  }

  static List<Document> createUpsyncTokenDocumentFromDocstreams(
      String loginsessionId, List<DocStream> docStreamList) {
    List<Document> returnValue = List<Document>();
    try {
      for (int la = 0; la < docStreamList.length; la++) {
        DocStream currentElement = docStreamList.elementAt(la);

        UpsyncToken currentObject = UpsyncToken(
            token: null,
            loginsessionId: loginsessionId,
            docstreamId: currentElement.id,
            jsonDocumentMd5: currentElement.jsonDocumentMd5);

        Document currentDocument = Document(
            id: Uuid().v4(),
            refId: Uuid().v4(),
            refIdMd5: null,
            created: StringUtil.toMySqlFormat(DateTime.now()),
            documentstatusId: "1",
            documenttypeId: Document.upsyncTokenDocumenttypeId,
            json: json.encode(currentObject.toJson()),
            ownerUserloginId: null,
            jsonHashBycreator: null,
            ownerGroupId: null,
            lastupdate: StringUtil.toMySqlFormat(DateTime.now()),
            isLocalClientOnly: null);

        returnValue.add(currentDocument);
      }
    } catch (error) {}

    return returnValue;
  }

  static Future<List<UpsyncToken>> requestUpsyncToken(
      String loginsessionId, List<DocStream> docStreamList) async {
    List<UpsyncToken> returnValue = List<UpsyncToken>();
    try {
      List<Document> upsyncTokenRequestList =
      DocumentDocStreamStore.createUpsyncTokenDocumentFromDocstreams(
          loginsessionId, docStreamList);

      ApiProc7Request request = ApiProc7Request(
          loginsessionId: loginsessionId,
          sessionRequestId: Uuid().v4(),
          frameworkId: AppStaticParam.getFrameworkId(),
          root: "UpsyncToken",
          debugLevel: 1,
          subRequests: <ApiProc7SubRequest>[
            ApiProc7SubRequest(
                requestName: "RequestUpsyncToken",
                sessionSubRequestId: Uuid().v4(),
                documents: upsyncTokenRequestList,
                docstreams: List<DocStream>())
          ]);

      dynamic bodyRequest = request.toJson();
      request = null;

      List<int> compressedBody =
      gzip.encode(json.encode(bodyRequest).codeUnits);
      Map<String, String> headers = {
        "Content-Encoding": "gzip",
        "Content-Type": "application/json; charset=UTF-8",
        'Charset': 'utf-8'
      };



      final response = await http.Client()
          .post(
        Uri.http(AppStaticParam.syncUrl, ""),
        headers: headers,
        body: compressedBody,
      )
          .timeout(const Duration(seconds: 1800));

      //final String testResponseFull = response.body.trim();
      //final String testResponse = response.body.trim().substring(0, 1);

      List<int> gzipDecodedData=GZipCodec().decode(response.bodyBytes);



      final String unzipresponseBody =  utf8.decode(gzipDecodedData, allowMalformed: true); ;


      if (response.statusCode == 200 &&
          unzipresponseBody.trim().substring(0, 1) == "{") {
        final dynamic dynJsonBody = json.decode(unzipresponseBody);

        final ApiProc7RequestResponse apiProc7RequestResponse =
        ApiProc7RequestResponse.fromJson(dynJsonBody);

        if (apiProc7RequestResponse.success == true) {
          for (int la = 0;
          la < apiProc7RequestResponse.subRequestResponses.length;
          la++) {
            ApiProc7SubRequestResponse currentSubRequestResponse =
            apiProc7RequestResponse.subRequestResponses.elementAt(la);

            for (int lb = 0;
            lb < currentSubRequestResponse.documents.length;
            lb++) {
              Document currentDocument =
              currentSubRequestResponse.documents.elementAt(lb);

              UpsyncToken currentUpsyncToken =
              UpsyncToken.fromJson(json.decode(currentDocument.json));

              returnValue.add(currentUpsyncToken);
            }
          }
        }
      }
    } catch (error) {
      print(
          "Error catched on requestUpsyncToken : ErroeMessage=${error.toString()}");
    }
    return returnValue;
  }

  static Future<bool> upsyncDocStream() async {
    bool returnValue = false;

    try {
      print('Upsync Document initiated');

      //final List<dynamic> whereArgs = <dynamic>[0, "0", "1"];

      List<DocStream> willtokenizedDocstreamList =
      await DocumentDocStreamStore.getUnuploadedDocstream();

      if(willtokenizedDocstreamList.length==0)
      {
        returnValue = true;
        return returnValue;
      }

      final LoginResponse loginResponse =
      await UserRepository.getLoginResponseFromDevice();

      final String loginsessionId = loginResponse.loginsessionId;

      await DocumentDocStreamStore.tokenizingDocstreams(
          loginsessionId, willtokenizedDocstreamList);

      willtokenizedDocstreamList.clear();

      List<DocStream> aftertokenizedDocstreamList =
      await getUnuploadedDocstream();

      List<DocStream> docstreamList = List<DocStream>();

      for (int la = 0; la < aftertokenizedDocstreamList.length; la++) {
        DocStream currentElement = aftertokenizedDocstreamList.elementAt(la);

        if (!(currentElement.upsynctoken == null) &&
            currentElement.upsynctoken != '<INVALID_UPSYNC_TOKEN>') {
          docstreamList.add(currentElement);
        }
      }

      print(docstreamList.length.toString() + " document will be upsync");

      //final List<Map<String, dynamic>> docStreamListJson =DocStream.docStreamListToJson(docstreamList);

      //addd binary for filetype 'file_document_link'

      for (int ld = 0; ld < docstreamList.length; ld++) {
        DocStream currentDocStream = docstreamList.elementAt(ld);

        if (currentDocStream.document.documenttypeId == 'file_document_link') {
          FileDocumentBinary fileDocumentBinary = FileDocumentBinary.fromJson(
              json.decode(currentDocStream.document.json));
          try {
            final bytes = await Io.File(
                fileDocumentBinary.sourceFileInfo.fileNameFullpath)
                .readAsBytes();

            currentDocStream.document.binaryUploadBase64 = base64.encode(bytes);
            currentDocStream.document.binaryUploadMd5 =
                md5.convert(bytes).toString();
          } catch (error) {
            print(
                "Error While Reading FileDocumentBinary; ErrorMessage=${error.toString()}");
          }
        }
      }

      if (docstreamList.length > 0) {
        ApiProc7Request request = ApiProc7Request(
            loginsessionId: loginsessionId,
            sessionRequestId: Uuid().v4(),
            frameworkId: AppStaticParam.getFrameworkId(),
            root: "UpsyncDocstream",
            debugLevel: 1,
            subRequests: <ApiProc7SubRequest>[
              ApiProc7SubRequest(
                  requestName: "SyncRecord",
                  sessionSubRequestId: Uuid().v4(),
                  documents: List<Document>(),
                  docstreams: docstreamList)
            ]);

        dynamic bodyRequest = request.toJson();
        request = null;

        List<int> compressedBody =
        gzip.encode(json.encode(bodyRequest).codeUnits);
        Map<String, String> headers = {
          "Content-Encoding": "gzip",
          "Content-Type": "application/json; charset=UTF-8",
          'Charset': 'utf-8'
        };

        final response = await http.Client()
            .post(Uri.http(AppStaticParam.syncUrl, "") ,
            headers: headers, body: compressedBody)
            .timeout(const Duration(seconds: 300));


        List<int> gzipDecodedData=GZipCodec().decode(response.bodyBytes);



        final String unzipresponseBody =  utf8.decode(gzipDecodedData, allowMalformed: true); ;

        // final String testResponse = response.body.trim().substring(0, 1);

        //final String testResponse2 = response.body.trim();

        if (response.statusCode == 200 &&
            unzipresponseBody.trim().substring(0, 1) == "{") {
          dynamic responseBody = json.decode(unzipresponseBody);

          final ApiProc7RequestResponse apiProc7RequestResponse =
          ApiProc7RequestResponse.fromJson(responseBody);

          if (apiProc7RequestResponse.success == true) {
            //returnValue = apiProc7RequestResponse.subRequestResponses.length;

            for (int la = 0;
            la < apiProc7RequestResponse.subRequestResponses.length;
            la++) {
              ApiProc7SubRequestResponse currentElement =
              apiProc7RequestResponse.subRequestResponses.elementAt(la);

              for (int lb = 0; lb < currentElement.docstreams.length; lb++) {
                DocStream currentDocstream =
                currentElement.docstreams.elementAt(lb);
                int lresult =
                await DocumentDocStreamStore.downsyncDocumentInDoctsream(
                    currentDocstream);
              }
            }
          }
          returnValue =true;
        } else {
          throw Exception('error fetching posts');
        }
      }
    } catch (error) {
      print("Error catched in upsyncDocument()=" + error.toString());
    }
    return returnValue;
  }



  static Future<bool> downsyncDocStream(
      DocumentSearchParamByFields documentSearchParamByField) async {
    bool returnValue = false;

    List<DocumentSearchField> savedOptionalSearchFieldList =
    List<DocumentSearchField>();

    savedOptionalSearchFieldList
        .addAll(documentSearchParamByField.optionalSearchFieldList);

    try {
      documentSearchParamByField.optionalSearchFieldList.clear();

      if (documentSearchParamByField.getQuerySetParam().query != null) {
        String whereSql = WhereQuerySetParam.toolsGetSqlWhereQuery(
            documentSearchParamByField.getQuerySetParam().query,
            documentSearchParamByField.getQuerySetParam().valueList);

        /*
        List<DocStream> localDocstreams = await DocumentDocStreamStore
            .getDocStreamsForMd5SumBySearchParamByField(
                documentSearchParamByField);

         */

        List<DocStream> localDocstreams = await DocumentDocStreamStore.getDocStreamsForMd5SumBySearchParamByField(documentSearchParamByField,columns: <String> [DocStream.id_CCFN,DocStream.jsonDocumentMd5_CCFN,Document.id_CCFN,Document.ownerUserloginId_CCFN,Document.creatorLoginsessionId_CCFN]);


        final String localDocstreamMd5 =
        await DocumentDocStreamStore.getDocumentMd5SumBySearchParamByField(
            documentSearchParamByField);

        List<UpsyncToken> localUpsynctoken = List<UpsyncToken>();

        for (int la = 0; la < localDocstreams.length; la++) {
          DocStream currentDocstream = localDocstreams.elementAt(la);

          UpsyncToken currentUpsynToken =
          UpsyncToken.fromDocStream(currentDocstream);

          localUpsynctoken.add(currentUpsynToken);
        }
        localDocstreams.clear();
        localDocstreams = null;

        DownsyncDocStreamRequest downsyncDocStreamRequest =
        DownsyncDocStreamRequest(
            whereSql: whereSql,
            localDocstreamMd5: localDocstreamMd5,
            localDocStreams: localUpsynctoken);

        final LoginResponse loginResponse =
        await UserRepository.getLoginResponseFromDevice();

        final String loginsessionId = loginResponse.loginsessionId;

        Document documentDownsyncDocStreamRequest =
        DocumentDocStreamStore.createMemoryDocumentsByEncodedJson(
            json.encode(downsyncDocStreamRequest.toJson()),
            Document.documenttypeIdDownsyncDocstreamRequest);

        List<Document> documentsSubRequest = List<Document>();

        documentsSubRequest.add(documentDownsyncDocStreamRequest);

        ApiProc7Request request = ApiProc7Request(
            loginsessionId: loginsessionId,
            sessionRequestId: Uuid().v4(),
            frameworkId: AppStaticParam.getFrameworkId(),
            root: "DownsyncDocstream",
            debugLevel: 1,
            subRequests: <ApiProc7SubRequest>[
              ApiProc7SubRequest(
                  requestName: "SyncRecord",
                  sessionSubRequestId: Uuid().v4(),
                  documents: documentsSubRequest,
                  docstreams: List<DocStream>())
            ]);

        dynamic bodyRequest = request.toJson();
        localUpsynctoken.clear();
        request = null;

        List<int> compressedBody =
        gzip.encode(json.encode(bodyRequest).codeUnits);
        Map<String, String> headers = {
          "Content-Encoding": "gzip",
          "Content-Type": "application/json; charset=UTF-8",
          'Charset': 'utf-8'
        };

        final response = await http.Client()
            .post( Uri.http(AppStaticParam.syncUrl,"")  ,
            headers: headers, body: compressedBody)
            .timeout(const Duration(seconds: 500));

        //final List<int> unzipresponseBody= gzip.decode(response.bodyBytes);

        List<int> gzipDecodedData=GZipCodec().decode(response.bodyBytes);



        final String unzipresponseBody =  utf8.decode(gzipDecodedData, allowMalformed: true); ;

        //final String testResponse = response.body.trim().substring(0, 1);

        if (response.statusCode == 200 &&
            unzipresponseBody.trim().substring(0, 1) == "{") {
          dynamic jsonBody = json.decode( unzipresponseBody);

          final ApiProc7RequestResponse apiProc7RequestResponse =
          ApiProc7RequestResponse.fromJson(jsonBody);

          if (apiProc7RequestResponse.success == true) {
            for (int la = 0;
            la < apiProc7RequestResponse.subRequestResponses.length;
            la++) {
              ApiProc7SubRequestResponse currentApiProc7SubRequestResponse =
              apiProc7RequestResponse.subRequestResponses.elementAt(la);
              for (int lb = 0;
              lb < currentApiProc7SubRequestResponse.docstreams.length;
              lb++) {
                DocStream currentDocStream =
                currentApiProc7SubRequestResponse.docstreams.elementAt(lb);

                await DocumentDocStreamStore.processDownsyncBinary(
                    currentDocStream);

                await DocumentDocStreamStore.downsyncDocumentInDoctsream(
                    currentDocStream);
              }
            }
          }
          print('Dowsnync DocStream Finished');
          returnValue = true;
          returnValue = true;
        }
      } else {
        //do nothing , invalid DocumentSearchParamBField
      }

    } catch (error) {}

    documentSearchParamByField.optionalSearchFieldList
        .addAll(savedOptionalSearchFieldList);

    return returnValue;
  }
}

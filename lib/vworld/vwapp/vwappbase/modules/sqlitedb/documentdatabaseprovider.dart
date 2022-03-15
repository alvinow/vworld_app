import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/docstream.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/document.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/errorlog/errorlog.dart';


class DocumentDatabaseProvider {
  static final DocumentDatabaseProvider dbProvider = DocumentDatabaseProvider();
  static final docstreamTable = 'docstream';
  static final docrefTable = 'docref';
  static final docrefTableTemporary = 'docref_temporary';
  static final fileuploadTable = 'fileupload';

  static final databaseVersion = 1;
  static final databaseName = "clientproc7";

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //"ReactiveTodo.db is our database instance name
    String path = join(documentsDirectory.path, databaseName);

    var database = await openDatabase(path,
        version: databaseVersion, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  }

  //This is optional, and only used for changing DB schema migrations
  void onUpgrade(Database database, int oldVersion, int newVersion) {
    print("On UpgradeDb called");
    if (newVersion > oldVersion) {}
  }


  static String getSqlScript_CreateTable_Docstream() {
    final String returnValue = "CREATE TABLE " +
        DocumentDatabaseProvider.docstreamTable +
        " (" +
        DocStream.id_CCFN +
        " TEXT NOT NULL PRIMARY KEY," +
        DocStream.jsonDocument_CCFN+
        " TEXT NOT NULL," +
        DocStream.jsonDocumentMd5_CCFN+
        " TEXT NOT NULL," +
        DocStream.created_CCFN +
        " TEXT NOT NULL," +
        DocStream.upsynctoken_CCFN +
        " TEXT NOT NULL," +
        DocStream.servertoken_CCFN +
        " TEXT NOT NULL," +
        DocStream.lastupdate_CCFN +
        " TEXT NOT NULL," +
        DocStream.parentDocstreamId_CCFN +
        " TEXT DEFAULT NULL," +
        DocStream.prevDocumentId_CCFN +
        " TEXT DEFAULT NULL," +
        DocStream.prevDocumentDocumenttypeId_CCFN +
        " TEXT DEFAULT NULL," +
        DocStream.streamstatusId_CCFN +
        " TEXT NOT NULL," +
        DocStream.hashBycreator_CCFN +
        " TEXT NOT NULL," +
        DocStream.hashByserver_CCFN +
        " TEXT NOT NULL," +
        DocStream.hashDocumentBycreator_CCFN +
        " TEXT NOT NULL," +
        DocStream.hashDocumentByserver_CCFN +
        " TEXT DEFAULT NULL," +
        DocStream.creatorLoginsessionId_CCFN +
        " TEXT NOT NULL," +
        DocStream.serverStreamId_CCFN +
        " TEXT DEFAULT NULL," +
        Document.id_CCFN +
        " TEXT NOT NULL," +
        Document.refIdMd5_CCFN +
        " TEXT DEFAULT NULL ," +
        Document.refId_CCFN +
        " TEXT DEFAULT NULL ," +
        Document.created_CCFN +
        " TEXT NOT NULL," +
        Document.documentstatusId_CCFN +
        " TEXT NOT NULL," +
        Document.documenttypeId_CCFN +
        " TEXT NOT NULL," +
        Document.json_CCFN +
        " TEXT DEFAULT NULL," +
        Document.creatorLoginsessionId_CCFN +
        " TEXT DEFAULT NULL ," +
        Document.binaryfileId_CCFN +
        " TEXT DEFAULT NULL," +
        Document.binaryUploadBase64_CCFN +
        " TEXT DEFAULT NULL," +
        Document.binaryUploadMd5_CCFN +
        " TEXT DEFAULT NULL," +
        Document.ownerUserloginId_CCFN +
        " TEXT DEFAULT NULL," +
        Document.jsonHashBycreator_CCFN +
        " TEXT DEFAULT NULL," +
        Document.jsonHashByserver_CCFN +
        " TEXT DEFAULT NULL," +
        Document.ownerGroupId_CCFN +
        " TEXT DEFAULT NULL," +
        Document.lastupdate_CCFN +
        " TEXT DEFAULT NULL," +
        Document.isLocalClientOnly_CCFN +
        " INTEGER DEFAULT NULL," +
        Document.tag1_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag2_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag3_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag4_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag5_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag6_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag7_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag8_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag9_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag10_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag11_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag12_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag13_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag14_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag15_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag16_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag17_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag18_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag19_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag20_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag21_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag22_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag23_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag24_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag25_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag26_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag27_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag28_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag29_CCFN +
        " TEXT DEFAULT NULL," +
        Document.tag30_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag1_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag2_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag3_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag4_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag5_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag6_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag7_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag8_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag9_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag10_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag11_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag12_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag13_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag14_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag15_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag16_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag17_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag18_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag19_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag20_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag21_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag22_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag23_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag24_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag25_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag26_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag27_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag28_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag29_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyTag30_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyLongTag1_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyLongTag2_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyLongTag3_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyLongTag4_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyLongTag5_CCFN +
        " TEXT DEFAULT NULL," +
        Document.longtag1_CCFN +
        " text DEFAULT NULL," +
        Document.longtag2_CCFN +
        " text DEFAULT NULL," +
        Document.longtag3_CCFN +
        " text DEFAULT NULL," +
        Document.longtag4_CCFN +
        " text DEFAULT NULL," +
        Document.longtag5_CCFN +
        " text DEFAULT NULL," +
        Document.keyNumerictag1_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyNumerictag2_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyNumerictag3_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyNumerictag4_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyNumerictag5_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyNumerictag6_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyNumerictag7_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyNumerictag8_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyNumerictag9_CCFN +
        " TEXT DEFAULT NULL," +
        Document.keyNumerictag10_CCFN +
        " TEXT DEFAULT NULL," +
        Document.numerictag1_CCFN +
        " REAL DEFAULT NULL," +
        Document.numerictag2_CCFN +
        " REAL DEFAULT NULL," +
        Document.numerictag3_CCFN +
        " REAL DEFAULT NULL," +
        Document.numerictag4_CCFN +
        " REAL DEFAULT NULL," +
        Document.numerictag5_CCFN +
        " REAL DEFAULT NULL," +
        Document.numerictag6_CCFN +
        " REAL DEFAULT NULL," +
        Document.numerictag7_CCFN +
        " REAL DEFAULT NULL," +
        Document.numerictag8_CCFN +
        " REAL DEFAULT NULL," +
        Document.numerictag9_CCFN +
        " REAL DEFAULT NULL," +
        Document.numerictag10_CCFN +
        " REAL DEFAULT NULL," +
        "   CONSTRAINT key1_unique UNIQUE (" +
        Document.id_CCFN +
        ")); "+
        "CREATE INDEX idx_ref_id ON ${DocumentDatabaseProvider.docstreamTable}(${Document.refId_CCFN});"+
        "CREATE INDEX idx_docstream_json_document_md5 ON ${DocumentDatabaseProvider.docstreamTable}(${DocStream.jsonDocumentMd5_CCFN});"
    ;
    return returnValue;
  }

  void initDB(Database database, int version) async {
    try {
      print("Create DB on local device");

      final String sqlscriptDocstream =
      DocumentDatabaseProvider.getSqlScript_CreateTable_Docstream();
      await database.execute(sqlscriptDocstream);

      print(sqlscriptDocstream);

    } catch (error) {
      print(json.encode(ErrorLog (
          catchedLocation: "DocumentDatabaseProvider.initDB()",
          errorMessage: error.toString())
          .toJson()));
    }
  }
}

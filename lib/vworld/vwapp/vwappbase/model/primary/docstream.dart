//import 'package:flutter_app_flowproc/cryptoutil/cryptoutil.dart';

//import '../document.dart';
//import '../loginresponse.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/loginresponse.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/debugdocstream.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/document.dart';
import 'dart:convert';

import 'package:vworld_app/vworld/vwapp/vwappbase/util/cryptoutil/cryptoutil.dart';
//import 'debugdocstream.dart';

class DocStream {
  DocStream(
      {required this.id,
        required this.jsonDocument,
        required this.jsonDocumentMd5,
        required this.created,
        this.upsynctoken:'<INVALID_UPSYNC_TOKEN>',
        this.servertoken:'<INVALID_SERVER_TOKEN>',
        required this.lastupdate,
        this.parentDocstreamId,
        this.prevDocumentId,
        this.prevDocumentDocumenttypeId,
        this.hashBycreator,
        this.hashByserver,
        required this.streamstatusId,
        required this.creatorLoginsessionId,
        required this.hashDocumentBycreator,
        this.hashDocumentByserver,
        this.document,
        this.debugDocstream,
        this.serverStreamId
      });

  static String invalidUpsyncToken='<INVALID_UPSYNC_TOKEN>';
  static String invalidServerToken='<INVALID_SERVER_TOKEN>';

  String? hashBycreator;
  String? hashByserver; //below this is  hashed docstream field
  String? id;
  //docstream_json_document, docstream_json_document_md5

  String? jsonDocument;
  String? jsonDocumentMd5;

  String? created;

  String? upsynctoken;
  String? servertoken;
  String? lastupdate;
  String? parentDocstreamId;
  String? prevDocumentId;
  String? prevDocumentDocumenttypeId;
  String? streamstatusId; //stream status 0 mean abandoned
  String? creatorLoginsessionId;
  String? hashDocumentBycreator;
  String? hashDocumentByserver; //below this is hashed document field
  String? serverStreamId;


  Document? document;
  DebugDocstream? debugDocstream;

  //field value
  static final String invalidServerToken_FieldValue='<INVALID_SERVER_TOKEN>';
  static final String invalidUpsyncToken_FieldValue='<INVALID_UPSYNC_TOKEN>';


  static final String id_CCFN = "docstream_id";
  static final String jsonDocument_CCFN='docstream_json_document';
  static final String jsonDocumentMd5_CCFN='docstream_json_document_md5';
  static final String created_CCFN = "docstream_created";
  static final String upsynctoken_CCFN="docstream_upsynctoken";
  static final String servertoken_CCFN="docstream_servertoken";
  static final String lastupdate_CCFN = "docstream_lastupdate";
  static final String parentDocstreamId_CCFN="docstream_parent_docstream_id";
  static final String prevDocumentId_CCFN = "docstream_prev_document_id";
  static final String prevDocumentDocumenttypeId_CCFN =
      "docstream_prev_document_documenttype_id";
  static final String streamstatusId_CCFN = "docstream_streamstatus_id";
  static final String creatorLoginsessionId_CCFN =
      "docstream_creator_loginsession_id";
  static final String hashBycreator_CCFN = "docstream_hash_bycreator";
  static final String hashByserver_CCFN = "docstream_hash_byserver";
  static final String hashDocumentBycreator_CCFN =
      "docstream_hash_document_bycreator";
  static final String hashDocumentByserver_CCFN =
      "docstream_hash_document_byserver";
  static final String serverStreamId_CCFN="docstream_server_stream_id";

  static final String debugDocstream_CCFN='debug';

  void refreshDocumentSignature(){
    this.jsonDocument=json.encode(this.document!.toJson());
    this.jsonDocumentMd5=CryptoUtil.getMd5(this.jsonDocument!);
  }

  static List<Map<String, dynamic>> docStreamListToJson(
      List<DocStream> docstream) {
    List<Map<String, dynamic>> returnValue = <Map<String, dynamic>>[];

    for (int lcounter = 0; lcounter < docstream.length; lcounter++) {
      DocStream currentItem = docstream.elementAt(lcounter);

      returnValue.add(currentItem.toJson());
    }

    return returnValue;
  }

  factory DocStream.fromDocument({
    required Document document,
    required LoginResponse loginResponse,
    String streamstatusId = "0",
    String? created,
    String prevDocumentId = "",
    String prevDocumentDocumenttypeId = "",
  }) =>
      DocStream(
          hashBycreator: "0",
          hashByserver: "0",
          id: Uuid().v4(),
          jsonDocument: json.encode(document.toJson()) ,
          jsonDocumentMd5: CryptoUtil.getMd5(json.encode(document.toJson())),
          created:
          created == null ? Document.DateTimeNowUtcMySQLFormat() : created,
          lastupdate: Document.DateTimeNowUtcMySQLFormat(),
          prevDocumentId: prevDocumentId,
          prevDocumentDocumenttypeId: prevDocumentDocumenttypeId,
          streamstatusId: streamstatusId,
          creatorLoginsessionId: loginResponse.loginsessionId,
          hashDocumentBycreator: json.encode(document.toJson()),
          hashDocumentByserver: "0",
          document: document);

  factory DocStream.fromJson(Map<String, dynamic> data) => DocStream(
      hashBycreator: data[DocStream.hashBycreator_CCFN],
      hashByserver: data[DocStream.hashByserver_CCFN],
      id: data[DocStream.id_CCFN],
      jsonDocument:  data[DocStream.jsonDocument_CCFN],
      jsonDocumentMd5: data[DocStream.jsonDocumentMd5_CCFN],
      created: data[DocStream.created_CCFN],
      upsynctoken: data[DocStream.upsynctoken_CCFN],
      servertoken: data[DocStream.servertoken_CCFN],
      lastupdate: data[DocStream.lastupdate_CCFN],
      prevDocumentId: data[DocStream.prevDocumentId_CCFN],
      parentDocstreamId: data[DocStream.parentDocstreamId_CCFN],
      prevDocumentDocumenttypeId:
      data[DocStream.prevDocumentDocumenttypeId_CCFN],
      streamstatusId: data[DocStream.streamstatusId_CCFN],
      creatorLoginsessionId: data[DocStream.creatorLoginsessionId_CCFN],
      hashDocumentBycreator: data[DocStream.hashDocumentBycreator_CCFN],
      hashDocumentByserver: data[DocStream.hashDocumentByserver_CCFN],
      serverStreamId: data[DocStream.serverStreamId_CCFN],
      document: data[DocStream.jsonDocument_CCFN]==null? Document.fromJson(data) : Document.fromJsonWithBinaryField(json.decode(data[DocStream.jsonDocument_CCFN]),docStreamdata: data),
      debugDocstream:data[DocStream.debugDocstream_CCFN]==null? null :  DebugDocstream.fromJson(data[DocStream.debugDocstream_CCFN]));

  Map<String, dynamic> toJsonHashedField() => {
    DocStream.id_CCFN: this.id,
    DocStream.jsonDocument_CCFN: this.jsonDocument,
    DocStream.jsonDocumentMd5_CCFN: this.jsonDocumentMd5,
    DocStream.created_CCFN: this.created,
    DocStream.upsynctoken_CCFN: this.upsynctoken,
    DocStream.servertoken_CCFN: this.servertoken,
    DocStream.lastupdate_CCFN: this.lastupdate,
    DocStream.prevDocumentId_CCFN: this.prevDocumentId,
    DocStream.parentDocstreamId_CCFN: this.parentDocstreamId,
    DocStream.prevDocumentDocumenttypeId_CCFN:
    this.prevDocumentDocumenttypeId,
    DocStream.creatorLoginsessionId_CCFN: this.creatorLoginsessionId,
    DocStream.streamstatusId_CCFN: this.streamstatusId,
    DocStream.hashDocumentBycreator_CCFN: CryptoUtil.getMd5(this.document!.json!),
    DocStream.hashDocumentByserver_CCFN: this.hashDocumentByserver,
    DocStream.serverStreamId_CCFN:this.serverStreamId,
    Document.documenttypeId_CCFN: this.document!.documenttypeId,
    Document.id_CCFN: this.document!.id,
    Document.refId_CCFN: this.document!.refId,
    Document.refIdMd5_CCFN: this.document!.refIdMd5,
    Document.documentstatusId_CCFN: this.document!.documentstatusId,
    Document.json_CCFN: this.document!.json,
    Document.creatorLoginsessionId_CCFN:
    this.document!.creatorLoginsessionId,
    Document.binaryfileId_CCFN: this.document!.binaryfileId,
    Document.binaryUploadBase64_CCFN: this.document!.binaryUploadBase64,
    Document.binaryUploadMd5_CCFN: this.document!.binaryUploadMd5,
    Document.created_CCFN: this.document!.created,
    Document.lastupdate_CCFN: this.document!.lastupdate,
    Document.isLocalClientOnly_CCFN: this.document!.isLocalClientOnly,
    Document.ownerUserloginId_CCFN: this.document!.ownerUserloginId,
    Document.ownerGroupId_CCFN: this.document!.ownerGroupId,
    Document.jsonHashBycreator_CCFN: this.document!.jsonHashBycreator,
    Document.jsonHashByserver_CCFN: this.document!.jsonHashByserver,
    Document.tag1_CCFN: this.document!.tag1,
    Document.tag2_CCFN: this.document!.tag2,
    Document.tag3_CCFN: this.document!.tag3,
    Document.tag4_CCFN: this.document!.tag4,
    Document.tag5_CCFN: this.document!.tag5,
    Document.tag6_CCFN: this.document!.tag6,
    Document.tag7_CCFN: this.document!.tag7,
    Document.tag8_CCFN: this.document!.tag8,
    Document.tag9_CCFN: this.document!.tag9,
    Document.tag10_CCFN: this.document!.tag10,
    Document.tag11_CCFN: this.document!.tag11,
    Document.tag12_CCFN: this.document!.tag12,
    Document.tag13_CCFN: this.document!.tag13,
    Document.tag14_CCFN: this.document!.tag14,
    Document.tag15_CCFN: this.document!.tag15,
    Document.tag16_CCFN: this.document!.tag16,
    Document.tag17_CCFN: this.document!.tag17,
    Document.tag18_CCFN: this.document!.tag18,
    Document.tag19_CCFN: this.document!.tag19,
    Document.tag20_CCFN: this.document!.tag20,
    Document.tag21_CCFN: this.document!.tag21,
    Document.tag22_CCFN: this.document!.tag22,
    Document.tag23_CCFN: this.document!.tag23,
    Document.tag24_CCFN: this.document!.tag24,
    Document.tag25_CCFN: this.document!.tag25,
    Document.tag26_CCFN: this.document!.tag26,
    Document.tag27_CCFN: this.document!.tag27,
    Document.tag28_CCFN: this.document!.tag28,
    Document.tag29_CCFN: this.document!.tag29,
    Document.tag30_CCFN: this.document!.tag30,
    Document.keyTag1_CCFN: this.document!.keyTag1,
    Document.keyTag2_CCFN: this.document!.keyTag2,
    Document.keyTag3_CCFN: this.document!.keyTag3,
    Document.keyTag4_CCFN: this.document!.keyTag4,
    Document.keyTag5_CCFN: this.document!.keyTag5,
    Document.keyTag6_CCFN: this.document!.keyTag6,
    Document.keyTag7_CCFN: this.document!.keyTag7,
    Document.keyTag8_CCFN: this.document!.keyTag8,
    Document.keyTag9_CCFN: this.document!.keyTag9,
    Document.keyTag10_CCFN: this.document!.keyTag10,
    Document.keyTag11_CCFN: this.document!.keyTag11,
    Document.keyTag12_CCFN: this.document!.keyTag12,
    Document.keyTag13_CCFN: this.document!.keyTag13,
    Document.keyTag14_CCFN: this.document!.keyTag14,
    Document.keyTag15_CCFN: this.document!.keyTag15,
    Document.keyTag16_CCFN: this.document!.keyTag16,
    Document.keyTag17_CCFN: this.document!.keyTag17,
    Document.keyTag18_CCFN: this.document!.keyTag18,
    Document.keyTag19_CCFN: this.document!.keyTag19,
    Document.keyTag20_CCFN: this.document!.keyTag20,
    Document.keyTag21_CCFN: this.document!.keyTag21,
    Document.keyTag22_CCFN: this.document!.keyTag22,
    Document.keyTag23_CCFN: this.document!.keyTag23,
    Document.keyTag24_CCFN: this.document!.keyTag24,
    Document.keyTag25_CCFN: this.document!.keyTag25,
    Document.keyTag26_CCFN: this.document!.keyTag26,
    Document.keyTag27_CCFN: this.document!.keyTag27,
    Document.keyTag28_CCFN: this.document!.keyTag28,
    Document.keyTag29_CCFN: this.document!.keyTag29,
    Document.keyTag30_CCFN: this.document!.keyTag30,
    Document.keyLongTag1_CCFN: this.document!.keyLongTag1,
    Document.keyLongTag2_CCFN: this.document!.keyLongTag2,
    Document.keyLongTag3_CCFN: this.document!.keyLongTag3,
    Document.keyLongTag4_CCFN: this.document!.keyLongTag4,
    Document.keyLongTag5_CCFN: this.document!.keyLongTag5,
    Document.longtag1_CCFN: this.document!.longtag1,
    Document.longtag2_CCFN: this.document!.longtag2,
    Document.longtag3_CCFN: this.document!.longtag3,
    Document.longtag4_CCFN: this.document!.longtag4,
    Document.longtag5_CCFN: this.document!.longtag5,
    Document.keyNumerictag1_CCFN: this.document!.keyNumerictag1,
    Document.keyNumerictag2_CCFN: this.document!.keyNumerictag2,
    Document.keyNumerictag3_CCFN: this.document!.keyNumerictag3,
    Document.keyNumerictag4_CCFN: this.document!.keyNumerictag4,
    Document.keyNumerictag5_CCFN: this.document!.keyNumerictag5,
    Document.keyNumerictag6_CCFN: this.document!.keyNumerictag6,
    Document.keyNumerictag7_CCFN: this.document!.keyNumerictag7,
    Document.keyNumerictag8_CCFN: this.document!.keyNumerictag8,
    Document.keyNumerictag9_CCFN: this.document!.keyNumerictag9,
    Document.keyNumerictag10_CCFN: this.document!.keyNumerictag10,
    Document.numerictag1_CCFN: this.document!.numerictag1,
    Document.numerictag2_CCFN: this.document!.numerictag2,
    Document.numerictag3_CCFN: this.document!.numerictag3,
    Document.numerictag4_CCFN: this.document!.numerictag4,
    Document.numerictag5_CCFN: this.document!.numerictag5,
    Document.numerictag6_CCFN: this.document!.numerictag6,
    Document.numerictag7_CCFN: this.document!.numerictag7,
    Document.numerictag8_CCFN: this.document!.numerictag8,
    Document.numerictag9_CCFN: this.document!.numerictag9,
    Document.numerictag10_CCFN: this.document!.numerictag10,
  };

  Map<String, dynamic> toJson() {
    Map<String, dynamic> returnValue = this.toJsonHashedField();

    try {
      returnValue[DocStream.hashBycreator_CCFN] = this.hashBycreator;
      returnValue[DocStream.hashByserver_CCFN] = this.hashByserver;
    } catch (error) {
      print('Error catched on DocStream.toJson(): ErrorMessage=${error.toString()}');
    }

    return returnValue;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/util/cryptoutil/cryptoutil.dart';

enum OpenDocumentMode { omCreate, omEdit, omReadonly }

abstract class DocumentModel {
  String documenttypeId = 'DocumentModel';

  static final String documenttypeId_CCFN = 'documenttypeId';

  String getDocumenttypeId() {
    return this.documenttypeId;
  }

/*
  static int getInteger(var value, int defaultValue) {
    int returnValue = defaultValue;

    try {
      returnValue = value;
    } catch (error) {
      print(error.toString());
    }
    return returnValue;
  }*/
}

class Document extends DocumentModel {


  Document({


    @required this.id,
    @required this.refId,
    @required this.refIdMd5,
    @required this.created,
    @required this.documentstatusId,
    @required this.documenttypeId: 'Document',
    @required this.json,
    @required this.creatorLoginsessionId,
    this.binaryfileId,
    this.binaryUploadBase64,
    this.binaryUploadMd5,
    @required this.ownerUserloginId,
    @required this.jsonHashBycreator: "0",
    this.jsonHashByserver: "0",
    @required this.ownerGroupId,
    @required this.lastupdate,
    @required this.isLocalClientOnly:0,
    this.tag1,
    this.tag2,
    this.tag3,
    this.tag4,
    this.tag5,
    this.tag6,
    this.tag7,
    this.tag8,
    this.tag9,
    this.tag10,
    this.tag11,
    this.tag12,
    this.tag13,
    this.tag14,
    this.tag15,
    this.tag16,
    this.tag17,
    this.tag18,
    this.tag19,
    this.tag20,
    this.tag21,
    this.tag22,
    this.tag23,
    this.tag24,
    this.tag25,
    this.tag26,
    this.tag27,
    this.tag28,
    this.tag29,
    this.tag30,
    this.keyTag1,
    this.keyTag2,
    this.keyTag3,
    this.keyTag4,
    this.keyTag5,
    this.keyTag6,
    this.keyTag7,
    this.keyTag8,
    this.keyTag9,
    this.keyTag10,
    this.keyTag11,
    this.keyTag12,
    this.keyTag13,
    this.keyTag14,
    this.keyTag15,
    this.keyTag16,
    this.keyTag17,
    this.keyTag18,
    this.keyTag19,
    this.keyTag20,
    this.keyTag21,
    this.keyTag22,
    this.keyTag23,
    this.keyTag24,
    this.keyTag25,
    this.keyTag26,
    this.keyTag27,
    this.keyTag28,
    this.keyTag29,
    this.keyTag30,
    this.longtag1,
    this.longtag2,
    this.longtag3,
    this.longtag4,
    this.longtag5,
    this.keyLongTag1,
    this.keyLongTag2,
    this.keyLongTag3,
    this.keyLongTag4,
    this.keyLongTag5,
    this.keyNumerictag1,
    this.keyNumerictag2,
    this.keyNumerictag3,
    this.keyNumerictag4,
    this.keyNumerictag5,
    this.keyNumerictag6,
    this.keyNumerictag7,
    this.keyNumerictag8,
    this.keyNumerictag9,
    this.keyNumerictag10,
    this.numerictag1,
    this.numerictag2,
    this.numerictag3,
    this.numerictag4,
    this.numerictag5,
    this.numerictag6,
    this.numerictag7,
    this.numerictag8,
    this.numerictag9,
    this.numerictag10,
  });


  String id;
  String refId;
  String refIdMd5;
  String created;
  String documentstatusId;
  @override
  String documenttypeId;
  String json;
  String creatorLoginsessionId;
  String binaryfileId;
  String binaryUploadBase64;
  String binaryUploadMd5;
  String ownerUserloginId;
  String jsonHashBycreator;
  String jsonHashByserver;
  String ownerGroupId;
  String lastupdate;
  int isLocalClientOnly;
  String tag1;
  String tag2;
  String tag3;
  String tag4;
  String tag5;
  String tag6;
  String tag7;
  String tag8;
  String tag9;
  String tag10;
  String tag11;
  String tag12;
  String tag13;
  String tag14;
  String tag15;
  String tag16;
  String tag17;
  String tag18;
  String tag19;
  String tag20;
  String tag21;
  String tag22;
  String tag23;
  String tag24;
  String tag25;
  String tag26;
  String tag27;
  String tag28;
  String tag29;
  String tag30;

  String keyTag1;
  String keyTag2;
  String keyTag3;
  String keyTag4;
  String keyTag5;
  String keyTag6;
  String keyTag7;
  String keyTag8;
  String keyTag9;
  String keyTag10;
  String keyTag11;
  String keyTag12;
  String keyTag13;
  String keyTag14;
  String keyTag15;
  String keyTag16;
  String keyTag17;
  String keyTag18;
  String keyTag19;
  String keyTag20;
  String keyTag21;
  String keyTag22;
  String keyTag23;
  String keyTag24;
  String keyTag25;
  String keyTag26;
  String keyTag27;
  String keyTag28;
  String keyTag29;
  String keyTag30;

  String longtag1;
  String longtag2;
  String longtag3;
  String longtag4;
  String longtag5;

  String keyLongTag1;
  String keyLongTag2;
  String keyLongTag3;
  String keyLongTag4;
  String keyLongTag5;

  String keyNumerictag1;
  String keyNumerictag2;
  String keyNumerictag3;
  String keyNumerictag4;
  String keyNumerictag5;
  String keyNumerictag6;
  String keyNumerictag7;
  String keyNumerictag8;
  String keyNumerictag9;
  String keyNumerictag10;

  double numerictag1;
  double numerictag2;
  double numerictag3;
  double numerictag4;
  double numerictag5;
  double numerictag6;
  double numerictag7;
  double numerictag8;
  double numerictag9;
  double numerictag10;

  /*
  flat_spmdetail_websas2020:
  tag: kdsatker,
  tag2: nospp,
  tag3: thang,
  tag4: tgspp
  tag5: nospm
  tag6: tgspm
  tag7: nosp2d
  tag8: tgsp2d
  tag9: kdakun
  tag10: totnilmak
  tag11: nilmak
  tag12 : status spm : spp, spm, sp2d
  tag13 sifspm: UP TUP GUP LS Nihil PTUP
  tag14: status kontrak
  tag15: kdgiat
  tag16: nmgiat
  tag17: kdoutput
  tag18:nmoutput
  tag19: kdsoutput
  tag20:ursoutput
  tag21: kdkmpnen
  tag22:urkmpnen
  tag23: kdskmpnen
  tag24:urskmpnen
  tag25: npsifspm
  tag26: nokontrak
  tag27: noksah
   */



  static final String id_CCFN = 'id';
  static final String refId_CCFN = 'ref_id';
  static final String refIdMd5_CCFN = 'ref_id_md5';
  static final String created_CCFN = 'created';

  static final String documentstatusId_CCFN = 'documentstatus_id';
  static final String documenttypeId_CCFN = 'documenttype_id';
  static final String json_CCFN = 'json';
  static final String creatorLoginsessionId_CCFN = 'creator_loginsession_id';
  static final String binaryfileId_CCFN = 'binaryfile_id';
  static final String binaryUploadBase64_CCFN='binary_upload_base64';
  static final String binaryUploadMd5_CCFN='binary_upload_md5';
  static final String ownerUserloginId_CCFN = 'owner_userlogin_id';
  static final String jsonHashBycreator_CCFN = 'json_hash_bycreator';
  static final String jsonHashByserver_CCFN = 'json_hash_byserver';
  static final String ownerGroupId_CCFN = 'owner_group_id';
  static final String lastupdate_CCFN = 'lastupdate';
  static final String isLocalClientOnly_CCFN='is_local_client_only';
  static final String tag1_CCFN = 'tag1';
  static final String tag2_CCFN = 'tag2';
  static final String tag3_CCFN = 'tag3';
  static final String tag4_CCFN = 'tag4';
  static final String tag5_CCFN = 'tag5';
  static final String tag6_CCFN = 'tag6';
  static final String tag7_CCFN = 'tag7';
  static final String tag8_CCFN = 'tag8';
  static final String tag9_CCFN = 'tag9';
  static final String tag10_CCFN = 'tag10';
  static final String tag11_CCFN = 'tag11';
  static final String tag12_CCFN = 'tag12';
  static final String tag13_CCFN = 'tag13';
  static final String tag14_CCFN = 'tag14';
  static final String tag15_CCFN = 'tag15';
  static final String tag16_CCFN = 'tag16';
  static final String tag17_CCFN = 'tag17';
  static final String tag18_CCFN = 'tag18';
  static final String tag19_CCFN = 'tag19';
  static final String tag20_CCFN = 'tag20';
  static final String tag21_CCFN = 'tag21';
  static final String tag22_CCFN = 'tag22';
  static final String tag23_CCFN = 'tag23';
  static final String tag24_CCFN = 'tag24';
  static final String tag25_CCFN = 'tag25';
  static final String tag26_CCFN = 'tag26';
  static final String tag27_CCFN = 'tag27';
  static final String tag28_CCFN = 'tag28';
  static final String tag29_CCFN = 'tag29';
  static final String tag30_CCFN = 'tag30';

  static final String keyTag1_CCFN = 'keyTag1';
  static final String keyTag2_CCFN = 'keyTag2';
  static final String keyTag3_CCFN = 'keyTag3';
  static final String keyTag4_CCFN = 'keyTag4';
  static final String keyTag5_CCFN = 'keyTag5';
  static final String keyTag6_CCFN = 'keyTag6';
  static final String keyTag7_CCFN = 'keyTag7';
  static final String keyTag8_CCFN = 'keyTag8';
  static final String keyTag9_CCFN = 'keyTag9';
  static final String keyTag10_CCFN = 'keyTag10';
  static final String keyTag11_CCFN = 'keyTag11';
  static final String keyTag12_CCFN = 'keyTag12';
  static final String keyTag13_CCFN = 'keyTag13';
  static final String keyTag14_CCFN = 'keyTag14';
  static final String keyTag15_CCFN = 'keyTag15';
  static final String keyTag16_CCFN = 'keyTag16';
  static final String keyTag17_CCFN = 'keyTag17';
  static final String keyTag18_CCFN = 'keyTag18';
  static final String keyTag19_CCFN = 'keyTag19';
  static final String keyTag20_CCFN = 'keyTag20';
  static final String keyTag21_CCFN = 'keyTag21';
  static final String keyTag22_CCFN = 'keyTag22';
  static final String keyTag23_CCFN = 'keyTag23';
  static final String keyTag24_CCFN = 'keyTag24';
  static final String keyTag25_CCFN = 'keyTag25';
  static final String keyTag26_CCFN = 'keyTag26';
  static final String keyTag27_CCFN = 'keyTag27';
  static final String keyTag28_CCFN = 'keyTag28';
  static final String keyTag29_CCFN = 'keyTag29';
  static final String keyTag30_CCFN = 'keyTag30';

  static final String longtag1_CCFN = 'longtag1';
  static final String longtag2_CCFN = 'longtag2';
  static final String longtag3_CCFN = 'longtag3';
  static final String longtag4_CCFN = 'longtag4';
  static final String longtag5_CCFN = 'longtag5';

  static final String keyLongTag1_CCFN = 'key_longtag1';
  static final String keyLongTag2_CCFN = 'key_longtag2';
  static final String keyLongTag3_CCFN = 'key_longtag3';
  static final String keyLongTag4_CCFN = 'key_longtag4';
  static final String keyLongTag5_CCFN = 'key_longtag5';

  static final String keyNumerictag1_CCFN = 'key_numerictag1';
  static final String keyNumerictag2_CCFN = 'key_numerictag2';
  static final String keyNumerictag3_CCFN = 'key_numerictag3';
  static final String keyNumerictag4_CCFN = 'key_numerictag4';
  static final String keyNumerictag5_CCFN = 'key_numerictag5';
  static final String keyNumerictag6_CCFN = 'key_numerictag6';
  static final String keyNumerictag7_CCFN = 'key_numerictag7';
  static final String keyNumerictag8_CCFN = 'key_numerictag8';
  static final String keyNumerictag9_CCFN = 'key_numerictag9';
  static final String keyNumerictag10_CCFN = 'key_numerictag10';

  static final String numerictag1_CCFN = 'numerictag1';
  static final String numerictag2_CCFN = 'numerictag2';
  static final String numerictag3_CCFN = 'numerictag3';
  static final String numerictag4_CCFN = 'numerictag4';
  static final String numerictag5_CCFN = 'numerictag5';
  static final String numerictag6_CCFN = 'numerictag6';
  static final String numerictag7_CCFN = 'numerictag7';
  static final String numerictag8_CCFN = 'numerictag8';
  static final String numerictag9_CCFN = 'numerictag9';
  static final String numerictag10_CCFN = 'numerictag10';



  //begin POT
  static final String documenttypeIdPotOrganization="documenttype_id_pot_organization";
  static final String documenttypeIdPotArticleTransaction="documenttype_id_pot_article_transaction";
  static final String documenttypeIdPotArticleSellPrice="documenttype_id_pot_article_sell_price";
  static final String documenttypeIdPotArticle="documenttype_id_pot_article";
  //end POT

  static final String documenttypeIdDownsyncDocstreamRequest='documenttype_downsync_docstream_request';

  static final String documenttypeIdUpsynctoken="documenttype_id_upsynctoken";

  static final String afformDocumenttypeId="afform_documenttype_id";

  static final String folderDocumenttypeId = "folder";
  static final String userfolderstackDocumenttypeId = "userfolderstack";
  //static final String flatSpmdetailWebsas2020DocumenttypeId =      "flat_spmdetail_websas2020";
  //static final String flatSpminduklWebsas2020DocumenttypeId =      "flat_spminduk_websas2020";
  //static final String baseSpmIndukSas="spminduk";
  static final String spmInduk2020='spminduk_2020';

  static final String upsyncTokenDocumenttypeId='upsync_token_documenttype_id';

  static final String spiUserloginDocumenttypeId = 'spi_userlogin';
  //static final String spmFiledocumenttype='spm_filedocumenttype';
  static final String spmFiledocumenttype = '2020_spm_filedocumenttype';

  static final String fileDocumentLinkDocumenttypeId="file_document_link";
  static final String localfileDocumentLinkDocumenttypeId="local_file_document_link";
  //static final String fileAttachmentDocumenttypeId="file_attachment";
  //static final String linkFileAttachmentDocumenttypeId="link_file_attachment";
  //static final String localLinkFileAttachmentDocumenttypeId="local_link_file_attachment";
  //static final String metadata2020FileSpmAttachment="metadata_2020_spm_file_attachment";

  static final String linkFiledocumenttypegroup = '2020_link_filedocumenttypegroup';

  static final String quotionerDocumenttypeId = "quotioner";
  static final String dentalPatientDemographicDocumenttypeId =
      'DentalPatientDemographic';

  static final String panitiaMeetingDocumenttypeId='panitia_meeting_documenttype_id';
  static final String spmValidatorDocumenttypeId = 'formdata_formspmvalidator';
  static final String userprofileDocumenttypeId = 'userprofile_spmvalidator';
  static final String penugasanSatker2019DocumenttypeId =
      'penugasan_satker_2019';
  static final String periochartVersion1 = 'periochart_version_1';

  static final String editModeCaption = "Modus Baca & Tulis";
  static final String readOnlyModeCaption = "Modus Baca Saja";
  static final String defaultSpiUserGroupId = 'spivalidator';
  static final String deletedDocumenttypeId = 'deleted_document';

  static final String periochartBernV1DocumenttypeId = 'periochart_bern_v1';

  //goodstoreApp
  static final String goodsGoodsstoreAppDocumenttypeId = "goodsGoodsstoreAppDocumenttypeId";
  static final String transactionGoodsstoreAppDocumenttypeId = "transactionGoodsstoreAppDocumenttypeId";


  //vworld_app -- documenttype_id #begin

  static final String actorDocumenttypeId='meetingmanager_2021_actor_documenttype_id';
  static final String meetingDocumenttypeId='meetingmanager_2021_meeting_document_type_id';
  static final String organizationDocumenttypeId='meetingmanager_2021_organization_documenttype_id';
  static final String personDocumenttypeId='meetingmanager_2021_person_documenttype_id';

  //vworld_app -- documenttype_id #end

  static  String getSpmIndukDocumenttypeId({@required String thang, @required String kdsatker}){
    String returnValue=Document.spmInduk2020+"_"+kdsatker;

    return returnValue;
  }

  void refreshCreatorJsonSignature(){
    try {
      this.jsonHashBycreator = CryptoUtil.getMd5(this.json.toString());
    }
    catch(error){
      print("Error catched on refreshCreatorJsonSignature; ErrorMessage=${error.toString()}");
    }
  }

  Map<String, dynamic> toJson() => {

    Document.documenttypeId_CCFN: this.documenttypeId,
    Document.id_CCFN: this.id,
    Document.refId_CCFN: this.refId,
    Document.refIdMd5_CCFN: this.refIdMd5,
    Document.documentstatusId_CCFN: this.documentstatusId,
    Document.json_CCFN: this.json,
    Document.creatorLoginsessionId_CCFN: this.creatorLoginsessionId,
    Document.binaryfileId_CCFN: this.binaryfileId,
    Document.binaryUploadBase64_CCFN: this.binaryUploadBase64,
    Document.binaryUploadMd5_CCFN: this.binaryUploadMd5,
    Document.created_CCFN: this.created,
    Document.isLocalClientOnly_CCFN: this.isLocalClientOnly,
    Document.lastupdate_CCFN: this.lastupdate,
    Document.ownerUserloginId_CCFN: this.ownerUserloginId,
    Document.ownerGroupId_CCFN: this.ownerGroupId,
    Document.jsonHashBycreator_CCFN: this.jsonHashBycreator,
    Document.jsonHashByserver_CCFN: this.jsonHashByserver,
    Document.tag1_CCFN: this.tag1,
    Document.tag2_CCFN: this.tag2,
    Document.tag3_CCFN: this.tag3,
    Document.tag4_CCFN: this.tag4,
    Document.tag5_CCFN: this.tag5,
    Document.tag6_CCFN: this.tag6,
    Document.tag7_CCFN: this.tag7,
    Document.tag8_CCFN: this.tag8,
    Document.tag9_CCFN: this.tag9,
    Document.tag10_CCFN: this.tag10,
    Document.tag11_CCFN: this.tag11,
    Document.tag12_CCFN: this.tag12,
    Document.tag13_CCFN: this.tag13,
    Document.tag14_CCFN: this.tag14,
    Document.tag15_CCFN: this.tag15,
    Document.tag16_CCFN: this.tag16,
    Document.tag17_CCFN: this.tag17,
    Document.tag18_CCFN: this.tag18,
    Document.tag19_CCFN: this.tag19,
    Document.tag20_CCFN: this.tag20,
    Document.tag21_CCFN: this.tag21,
    Document.tag22_CCFN: this.tag22,
    Document.tag23_CCFN: this.tag23,
    Document.tag24_CCFN: this.tag24,
    Document.tag25_CCFN: this.tag25,
    Document.tag26_CCFN: this.tag26,
    Document.tag27_CCFN: this.tag27,
    Document.tag28_CCFN: this.tag28,
    Document.tag29_CCFN: this.tag29,
    Document.tag30_CCFN: this.tag30,
    Document.keyTag1_CCFN: this.keyTag1,
    Document.keyTag2_CCFN: this.keyTag2,
    Document.keyTag3_CCFN: this.keyTag3,
    Document.keyTag4_CCFN: this.keyTag4,
    Document.keyTag5_CCFN: this.keyTag5,
    Document.keyTag6_CCFN: this.keyTag6,
    Document.keyTag7_CCFN: this.keyTag7,
    Document.keyTag8_CCFN: this.keyTag8,
    Document.keyTag9_CCFN: this.keyTag9,
    Document.keyTag10_CCFN: this.keyTag10,
    Document.keyTag11_CCFN: this.keyTag11,
    Document.keyTag12_CCFN: this.keyTag12,
    Document.keyTag13_CCFN: this.keyTag13,
    Document.keyTag14_CCFN: this.keyTag14,
    Document.keyTag15_CCFN: this.keyTag15,
    Document.keyTag16_CCFN: this.keyTag16,
    Document.keyTag17_CCFN: this.keyTag17,
    Document.keyTag18_CCFN: this.keyTag18,
    Document.keyTag19_CCFN: this.keyTag19,
    Document.keyTag20_CCFN: this.keyTag20,
    Document.keyTag21_CCFN: this.keyTag21,
    Document.keyTag22_CCFN: this.keyTag22,
    Document.keyTag23_CCFN: this.keyTag23,
    Document.keyTag24_CCFN: this.keyTag24,
    Document.keyTag25_CCFN: this.keyTag25,
    Document.keyTag26_CCFN: this.keyTag26,
    Document.keyTag27_CCFN: this.keyTag27,
    Document.keyTag28_CCFN: this.keyTag28,
    Document.keyTag29_CCFN: this.keyTag29,
    Document.keyTag30_CCFN: this.keyTag30,
    Document.keyLongTag1_CCFN: this.keyLongTag1,
    Document.keyLongTag2_CCFN: this.keyLongTag2,
    Document.keyLongTag3_CCFN: this.keyLongTag3,
    Document.keyLongTag4_CCFN: this.keyLongTag4,
    Document.keyLongTag5_CCFN: this.keyLongTag5,
    Document.longtag1_CCFN: this.longtag1,
    Document.longtag2_CCFN: this.longtag2,
    Document.longtag3_CCFN: this.longtag3,
    Document.longtag4_CCFN: this.longtag4,
    Document.longtag5_CCFN: this.longtag5,
    Document.keyNumerictag1_CCFN: this.keyNumerictag1,
    Document.keyNumerictag2_CCFN: this.keyNumerictag2,
    Document.keyNumerictag3_CCFN: this.keyNumerictag3,
    Document.keyNumerictag4_CCFN: this.keyNumerictag4,
    Document.keyNumerictag5_CCFN: this.keyNumerictag5,
    Document.keyNumerictag6_CCFN: this.keyNumerictag6,
    Document.keyNumerictag7_CCFN: this.keyNumerictag7,
    Document.keyNumerictag8_CCFN: this.keyNumerictag8,
    Document.keyNumerictag9_CCFN: this.keyNumerictag9,
    Document.keyNumerictag10_CCFN: this.keyNumerictag10,
    Document.numerictag1_CCFN: this.numerictag1,
    Document.numerictag2_CCFN: this.numerictag2,
    Document.numerictag3_CCFN: this.numerictag3,
    Document.numerictag4_CCFN: this.numerictag4,
    Document.numerictag5_CCFN: this.numerictag5,
    Document.numerictag6_CCFN: this.numerictag6,
    Document.numerictag7_CCFN: this.numerictag7,
    Document.numerictag8_CCFN: this.numerictag8,
    Document.numerictag9_CCFN: this.numerictag9,
    Document.numerictag10_CCFN: this.numerictag10,
  };


  factory Document.fromJsonWithBinaryField(Map<String, dynamic> data,{Map<String, dynamic> docStreamdata})=>Document(
    id: data[Document.id_CCFN],
    refId: data[Document.refId_CCFN],
    refIdMd5: data[Document.refIdMd5_CCFN],
    created: data[Document.created_CCFN],
    documentstatusId: data[Document.documentstatusId_CCFN],
    documenttypeId: data[Document.documenttypeId_CCFN],
    json: data[Document.json_CCFN],
    creatorLoginsessionId: data[Document.creatorLoginsessionId_CCFN],
    binaryfileId: data[Document.binaryfileId_CCFN],
    binaryUploadBase64: docStreamdata==null? null:docStreamdata[Document.binaryUploadBase64_CCFN],
    binaryUploadMd5: docStreamdata==null? null:docStreamdata[Document.binaryUploadMd5_CCFN],
    ownerUserloginId: data[Document.ownerUserloginId_CCFN],
    jsonHashBycreator: data[Document.jsonHashBycreator_CCFN],
    jsonHashByserver: data[Document.jsonHashByserver_CCFN],
    ownerGroupId: data[Document.ownerGroupId_CCFN],
    lastupdate: data[Document.lastupdate_CCFN],
    isLocalClientOnly:  data[Document.isLocalClientOnly_CCFN]==null?0: data[Document.isLocalClientOnly_CCFN] is int? data[Document.isLocalClientOnly_CCFN]: int.tryParse(data[Document.isLocalClientOnly_CCFN])==null?0:int.tryParse(data[Document.isLocalClientOnly_CCFN]),
    tag1: data[Document.tag1_CCFN],
    tag2: data[Document.tag2_CCFN],
    tag3: data[Document.tag3_CCFN],
    tag4: data[Document.tag4_CCFN],
    tag5: data[Document.tag5_CCFN],
    tag6: data[Document.tag6_CCFN],
    tag7: data[Document.tag7_CCFN],
    tag8: data[Document.tag8_CCFN],
    tag9: data[Document.tag9_CCFN],
    tag10: data[Document.tag10_CCFN],
    tag11: data[Document.tag11_CCFN],
    tag12: data[Document.tag12_CCFN],
    tag13: data[Document.tag13_CCFN],
    tag14: data[Document.tag14_CCFN],
    tag15: data[Document.tag15_CCFN],
    tag16: data[Document.tag16_CCFN],
    tag17: data[Document.tag17_CCFN],
    tag18: data[Document.tag18_CCFN],
    tag19: data[Document.tag19_CCFN],
    tag20: data[Document.tag20_CCFN],
    tag21: data[Document.tag21_CCFN],
    tag22: data[Document.tag22_CCFN],
    tag23: data[Document.tag23_CCFN],
    tag24: data[Document.tag24_CCFN],
    tag25: data[Document.tag25_CCFN],
    tag26: data[Document.tag26_CCFN],
    tag27: data[Document.tag27_CCFN],
    tag28: data[Document.tag28_CCFN],
    tag29: data[Document.tag29_CCFN],
    tag30: data[Document.tag30_CCFN],
    keyTag1: data[Document.keyTag1_CCFN],
    keyTag2: data[Document.keyTag2_CCFN],
    keyTag3: data[Document.keyTag3_CCFN],
    keyTag4: data[Document.keyTag4_CCFN],
    keyTag5: data[Document.keyTag5_CCFN],
    keyTag6: data[Document.keyTag6_CCFN],
    keyTag7: data[Document.keyTag7_CCFN],
    keyTag8: data[Document.keyTag8_CCFN],
    keyTag9: data[Document.keyTag9_CCFN],
    keyTag10: data[Document.keyTag10_CCFN],
    keyTag11: data[Document.keyTag11_CCFN],
    keyTag12: data[Document.keyTag12_CCFN],
    keyTag13: data[Document.keyTag13_CCFN],
    keyTag14: data[Document.keyTag14_CCFN],
    keyTag15: data[Document.keyTag15_CCFN],
    keyTag16: data[Document.keyTag16_CCFN],
    keyTag17: data[Document.keyTag17_CCFN],
    keyTag18: data[Document.keyTag18_CCFN],
    keyTag19: data[Document.keyTag19_CCFN],
    keyTag20: data[Document.keyTag20_CCFN],
    keyTag21: data[Document.keyTag21_CCFN],
    keyTag22: data[Document.keyTag22_CCFN],
    keyTag23: data[Document.keyTag23_CCFN],
    keyTag24: data[Document.keyTag24_CCFN],
    keyTag25: data[Document.keyTag25_CCFN],
    keyTag26: data[Document.keyTag26_CCFN],
    keyTag27: data[Document.keyTag27_CCFN],
    keyTag28: data[Document.keyTag28_CCFN],
    keyTag29: data[Document.keyTag29_CCFN],
    keyTag30: data[Document.keyTag30_CCFN],
    longtag1: data[Document.longtag1_CCFN],
    longtag2: data[Document.longtag2_CCFN],
    longtag3: data[Document.longtag3_CCFN],
    longtag4: data[Document.longtag4_CCFN],
    longtag5: data[Document.longtag5_CCFN],
    keyLongTag1: data[Document.keyLongTag1_CCFN],
    keyLongTag2: data[Document.keyLongTag2_CCFN],
    keyLongTag3: data[Document.keyLongTag3_CCFN],
    keyLongTag4: data[Document.keyLongTag4_CCFN],
    keyLongTag5: data[Document.keyLongTag5_CCFN],
    keyNumerictag1: data[Document.keyNumerictag1_CCFN],
    keyNumerictag2: data[Document.keyNumerictag2_CCFN],
    keyNumerictag3: data[Document.keyNumerictag3_CCFN],
    keyNumerictag4: data[Document.keyNumerictag4_CCFN],
    keyNumerictag5: data[Document.keyNumerictag5_CCFN],
    keyNumerictag6: data[Document.keyNumerictag6_CCFN],
    keyNumerictag7: data[Document.keyNumerictag7_CCFN],
    keyNumerictag8: data[Document.keyNumerictag8_CCFN],
    keyNumerictag9: data[Document.keyNumerictag9_CCFN],
    keyNumerictag10: data[Document.keyNumerictag10_CCFN],
    numerictag1:
    double.tryParse(data[Document.numerictag1_CCFN].toString()),
    numerictag2:
    double.tryParse(data[Document.numerictag2_CCFN].toString()),
    numerictag3:
    double.tryParse(data[Document.numerictag3_CCFN].toString()),
    numerictag4:
    double.tryParse(data[Document.numerictag4_CCFN].toString()),
    numerictag5:
    double.tryParse(data[Document.numerictag5_CCFN].toString()),
    numerictag6:
    double.tryParse(data[Document.numerictag6_CCFN].toString()),
    numerictag7:
    double.tryParse(data[Document.numerictag7_CCFN].toString()),
    numerictag8:
    double.tryParse(data[Document.numerictag8_CCFN].toString()),
    numerictag9:
    double.tryParse(data[Document.numerictag9_CCFN].toString()),
    numerictag10:
    double.tryParse(data[Document.numerictag10_CCFN].toString()),
  );

  factory Document.fromJson(Map<String, dynamic> data) => Document.fromJsonWithBinaryField(data);
  /*
  factory Document.fromDocStream(DocStream docStream) => Document(
        id: docStream.document.id,
        refId: ,
        created: docStream.document.created,
        documentstatusId: docStream.document.documentstatusId,
        documenttypeId: docStream.document.documenttypeId,
        json: docStream.document.json,
        creatorLoginsessionId: docStream.document.creatorLoginsessionId,
        binaryfileId: docStream.document.binaryfileId,
        ownerUserloginId: docStream.document.ownerUserloginId,
        jsonHashBycreator: docStream.document.jsonHashBycreator,
        jsonHashByserver: docStream.document.jsonHashByserver,
        lastupdate: docStream.created,
        ownerGroupId: docStream.document.ownerGroupId,
      );*/

  static String DateTimeNowUtcMySQLFormat() {
    final String now =
    DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now().toUtc());

    return now;
  }
}

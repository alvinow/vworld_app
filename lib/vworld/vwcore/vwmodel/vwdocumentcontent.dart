abstract class VwDocumentContent {

  VwDocumentContent();

  static final String documenttypeIdUnknown = 'documenttypeId_Unknown';
  static final String documenttypeIdVwApiRequestPackage =
      'documenttypeId_VwApiRequestPackage';
  static final String documenttypeIdPcSingleTeethProperties =
      'documenttypeId_PcSingleTeethProperties';
  static final String documenttypeIdPcSingleTeethLingualProperties =
      'documenttypeId_PcSingleTeethLingualProperties';
  static final String documenttypeIdPcSingleTeethBuccalProperties =
      'documenttypeId_PcSingleTeethBuccalProperties';
  static final  String documenttypeIdPcProperties =
      'documenttypeId_PcProperties';

  String getDocumenttypeId();


  //factory VwDocumentContent.fromJson(Map<String, dynamic> json) => _$VwDocumentContentFromJson(json);

  //Map<String, dynamic> toJson() => _$VwDocumentContentToJson(this);

  String? documenttypeId;
}

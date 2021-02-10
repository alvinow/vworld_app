import 'package:vworld_app/vworld/vwcore/vwjsonable/vwjsonable.dart';

abstract class VwDocumentContent extends VwJsonizer {
  static final String documenttypeIdUnknown = 'documenttypeId_Unknown';
  static final String documenttypeIdVwApiRequestPackage =
      'documenttypeId_VwApiRequestPackage';
  static final String documenttypeIdPcSingleTeethProperties =
      'documenttypeId_PcSingleTeethProperties';
  static final String documenttypeIdPcSingleTeethLingualProperties =
      'documenttypeId_PcSingleTeethLingualProperties';
  static final String documenttypeIdPcSingleTeethBuccalProperties =
      'documenttypeId_PcSingleTeethBuccalProperties';
  static final String documenttypeIdPcProperties =
      'documenttypeId_PcProperties';

  String getDocumenttypeId();
}

import 'package:vworld_app/vworld/vwcore/vwapi/vwapirequest.dart';
import 'package:vworld_app/vworld/vwcore/vwmodel/vwdocumentcontent.dart';

class VwApiRequestPackage{
  String loginsessionId;
  String apkId;
  List<VwApiRequest> requestList;

  static final String loginsessionIdCCFN = 'loginsessionId';
  static final String apkIdCCFN = 'apkId';
  static final String requestListCCFN = 'requestList';


  String getDocumenttypeId() {
    return VwDocumentContent.documenttypeIdVwApiRequestPackage;
  }


  Map<String, dynamic> toJson() {
    return {
      VwApiRequestPackage.loginsessionIdCCFN: this.loginsessionId,
      VwApiRequestPackage.apkIdCCFN: this.apkId
    };
  }
}

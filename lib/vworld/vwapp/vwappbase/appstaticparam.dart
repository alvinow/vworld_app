class AppStaticParam {
  static final String syncUrl =
      'https://api.bagkeu.dikdasmen.kemdikbud.go.id/api/2.0/request';
  static final String loginUrl =
      "https://api.bagkeu.dikdasmen.kemdikbud.go.id/api/2.0/json/login";
  //static final String syncUrl ='http://172.14.2.15:1405/api/2.0/request';
  //static final String loginUrl ='http://172.14.2.15:1405/api/2.0/json/login';

  //http://172.14.2.15:1405/spimobile2020_214.apk
//static final String syncUrl ='http://172.27.2.106:1405/api/2.0/request';
//static final String loginUrl ='http://172.27.2.106:1405/api/2.0/json/login';

  static final int maxUploadFileSize = 10000000; //max file size 5mb
  static final String localFileDocumentDirectory = "local_file_document";
  static final String loginAppMainLogo="assets/icon/sdg_logo.png";
  static final String titleApplicationName="Event Management System";

  static String getFrameworkId() {
    return "v.7-2.3";
  }
}
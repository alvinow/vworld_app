import 'package:flutter/cupertino.dart';
import 'filedocumentstorageinfo.dart';
import 'package:uuid/uuid.dart';

//file document link is only hold one document
class FileDocumentBinary {
  FileDocumentBinary(
      {@required this.sourceFileInfo,
      @required this.serverFileInfo,
      @required this.uniqueFileName,
      this.syncDate,
      this.isSynced,
      this.fileContentBase64}) {
    if (this.uniqueFileName == null) {
      this.uniqueFileName = Uuid().v4();
    }
  }


  final FileDocumentStorageInfo sourceFileInfo;//write by local
  final FileDocumentStorageInfo serverFileInfo;//write by server
  String uniqueFileName; //UUID became document Id
  String syncDate;
  bool isSynced;
  String fileContentBase64;
  //upsync , in client: set field "fileContentBase64" at last minute before uploading , in server:  save file to folder, clear field "fileContentBase64" before saving into database

  static final String sourceFileInfo_CCFN = "sourceFileInfo";
  static final String serverFileInfo_CCFN = "serverFileInfo";
  static final String uniqueFileName_CCFN = "uniqueFileName";
  static final String syncDate_CCFN = "syncDate";
  static final String isSynced_CCFN = "isSynced";
  static final String fileContentBase64_CCFN = "fileContentBase64";

  Map<String, dynamic> toJson() => {
    FileDocumentBinary.sourceFileInfo_CCFN: this.sourceFileInfo.toJson(),
    FileDocumentBinary.uniqueFileName_CCFN: this.uniqueFileName,
    FileDocumentBinary.syncDate_CCFN: this.syncDate,
    FileDocumentBinary.isSynced_CCFN: this.isSynced,
    FileDocumentBinary.fileContentBase64_CCFN: this.fileContentBase64
      };

  factory FileDocumentBinary.fromJson(Map<String, dynamic> data) =>
      FileDocumentBinary(
          sourceFileInfo: data[FileDocumentBinary.sourceFileInfo_CCFN] == null
              ? FileDocumentStorageInfo()
              : FileDocumentStorageInfo.fromJson(
                  data[FileDocumentBinary.sourceFileInfo_CCFN]),
          uniqueFileName: data[FileDocumentBinary.uniqueFileName_CCFN],
          syncDate: data[FileDocumentBinary.syncDate_CCFN],
          isSynced: data[FileDocumentBinary.isSynced_CCFN],
          fileContentBase64: data[FileDocumentBinary.fileContentBase64_CCFN]);
}

/*import 'filedocumentstorageinfo.dart';
import 'package:flutter/cupertino.dart';
import 'filedocumentstorageinfo.dart';


class FileDocument {
  FileDocument({@required this.metadata, @required this.fileContentInString});

  final FileDocumentStorageInfo metadata;

  final String fileContentInString;

  static final String metadata_CCFN = "metadata";

  static final String fileContentInString_CCFN = "fileContentInString";

  Map<String, dynamic> toJson() => {
    FileDocument.metadata_CCFN: this.metadata.toJson(),
    FileDocument.fileContentInString_CCFN: this.fileContentInString
      };

  factory FileDocument.fromJson(Map<String, dynamic> data) => FileDocument(
      metadata: data[FileDocument.metadata_CCFN] == null
          ? FileDocumentStorageInfo()
          : FileDocumentStorageInfo.fromJson(data[FileDocument.metadata_CCFN]),
      fileContentInString: data[FileDocument.fileContentInString_CCFN]);
}
*/
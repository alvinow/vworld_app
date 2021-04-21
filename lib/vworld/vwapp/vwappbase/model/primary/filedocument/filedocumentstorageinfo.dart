import 'package:uuid/uuid.dart';
import 'package:flutter/cupertino.dart';

class FileDocumentStorageInfo {
  FileDocumentStorageInfo(
      {@required this.fileNameFullpath,
      @required this.md5sum,
      @required this.size});

  final String fileNameFullpath;
  final String md5sum;
  final int size;

  static final String fileNameFullpath_CCFN = "fileNameFullPath";
  static final String md5sum_CCFN = "md5sum";
  static final String size_CCFN = "size";

  Map<String, dynamic> toJson() => {
    FileDocumentStorageInfo.fileNameFullpath_CCFN: this.fileNameFullpath,
    FileDocumentStorageInfo.md5sum_CCFN: this.md5sum,
    FileDocumentStorageInfo.size_CCFN: this.size
      };

  factory FileDocumentStorageInfo.fromJson(Map<String, dynamic> data) =>
      FileDocumentStorageInfo(
          fileNameFullpath: data[FileDocumentStorageInfo.fileNameFullpath_CCFN],
          md5sum: data[FileDocumentStorageInfo.md5sum_CCFN],
          size: data[FileDocumentStorageInfo.size_CCFN]);
}

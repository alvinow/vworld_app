import 'package:flutter/cupertino.dart';

class FileDocumentTypeTag{
  FileDocumentTypeTag({
    @required this.filedocumenttypeId,
    @required this.title,
    @required this.description,
    @required this.userNote,
});


  String filedocumenttypeId;
  String title;
  String description;
  String userNote;

  static final String filedocumenttypeId_CCFN="filedocumenttypeId";
  static final String title_CCFN="title";
  static final String description_CCFN="description";
  static final String userNote_CCFN="userNote";

  Map<String, dynamic> toJson() =>{
    FileDocumentTypeTag.filedocumenttypeId_CCFN: this.filedocumenttypeId,
    FileDocumentTypeTag.title_CCFN: this.title,
    FileDocumentTypeTag.description_CCFN: this.description,
  FileDocumentTypeTag.userNote_CCFN: this.userNote

  };

  factory FileDocumentTypeTag.fromJson(Map<String, dynamic> data)=>FileDocumentTypeTag(
    filedocumenttypeId: data[FileDocumentTypeTag.filedocumenttypeId_CCFN],
    title: data[FileDocumentTypeTag.title_CCFN],
    description: data[FileDocumentTypeTag.description_CCFN],
    userNote: data[FileDocumentTypeTag.userNote_CCFN]
  );


}
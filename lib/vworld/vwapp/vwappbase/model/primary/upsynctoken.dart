import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/docstream.dart';


class UpsyncToken {
  UpsyncToken({required this.token, required this.loginsessionId,required this.docstreamId,required this.jsonDocumentMd5} );

  final String? token;
  final String? loginsessionId;
  final String? docstreamId;
  final String? jsonDocumentMd5;

  static final String token_CCFN = 'token';
  static final String loginsessionId_CCFN = 'loginsessionId';
  static final String docstreamId_CCFN = 'docstreamId';
  static final String jsonDocumentMd5_CCFN='jsonDocumentMd5';

  Map<String, dynamic> toJson() => {
    UpsyncToken.token_CCFN: this.token,
    UpsyncToken.loginsessionId_CCFN: this.loginsessionId,
    UpsyncToken.docstreamId_CCFN: this.docstreamId,
    UpsyncToken.jsonDocumentMd5_CCFN: this.jsonDocumentMd5
  };

  factory UpsyncToken.fromDocStream(DocStream docStream)=>UpsyncToken(token: docStream.upsynctoken, loginsessionId: docStream.creatorLoginsessionId , docstreamId: docStream.id, jsonDocumentMd5: docStream.jsonDocumentMd5);

  factory UpsyncToken.fromJson(Map<String, dynamic> data) => UpsyncToken(
      token: data[UpsyncToken.token_CCFN],
      loginsessionId: data[UpsyncToken.loginsessionId_CCFN],
      docstreamId: data[UpsyncToken.docstreamId_CCFN],
      jsonDocumentMd5: data[UpsyncToken.jsonDocumentMd5_CCFN]
  );
}

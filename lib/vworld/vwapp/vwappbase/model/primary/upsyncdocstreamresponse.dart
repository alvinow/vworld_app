import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/docstream.dart';
import 'dart:convert';

import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/document.dart';

/*
        dynamic bodyRequest = {
          "sessionId": loginsessionId,
          "appVersion": "${AppStaticParam.getVersion()}",
          "root": "upSyncDocStream",
          "objects": [
            {"objectName": "document", "rows": docStreamListJson}
          ]
        };
* */

class ApiProc7Request {
  ApiProc7Request(
      {@required this.loginsessionId,
        @required this.sessionRequestId,
        @required this.frameworkId,
        @required this.root,
        @required this.debugLevel: 0,
        @required this.subRequests});

  final String loginsessionId;
  final String sessionRequestId;
  final String frameworkId;
  final String root;
  final int debugLevel; //0 : disable debug, 1: enable debug
  List<ApiProc7SubRequest> subRequests;

  static final String loginsessionId_CCFN = 'loginsessionId';
  static final String sessionRequestId_CCFN = 'sessionRequestId';
  static final String frameworkId_CCFN = 'frameworkId';
  static final String root_CCFN = 'root';
  static final String debugLevel_CCFN =
      'debugLevel'; //0 : disable debug, 1: enable debug
  static final String subRequests_CCFN = 'subRequests';

  Map<String, dynamic> toJson() => {
    ApiProc7Request.loginsessionId_CCFN: this.loginsessionId,
    ApiProc7Request.sessionRequestId_CCFN: this.sessionRequestId,
    ApiProc7Request.frameworkId_CCFN: this.frameworkId,
    ApiProc7Request.root_CCFN: this.root,
    ApiProc7Request.debugLevel_CCFN: this.debugLevel,
    ApiProc7Request.subRequests_CCFN: this.subRequests == null
        ? []
        : this.subRequests.map((item) => item.toJson()).toList(),
  };

  factory ApiProc7Request.fromJson(Map<String, dynamic> data) =>
      ApiProc7Request(
          loginsessionId: data[ApiProc7Request.loginsessionId_CCFN],
          sessionRequestId: data[ApiProc7Request.sessionRequestId_CCFN],
          frameworkId: data[ApiProc7Request.frameworkId_CCFN],
          root: data[ApiProc7Request.root_CCFN],
          debugLevel: data[ApiProc7Request.debugLevel_CCFN],
          subRequests: data[ApiProc7Request.subRequests_CCFN] == null
              ? List<ApiProc7SubRequest>()
              : data[ApiProc7Request.subRequests_CCFN]
              .map<ApiProc7SubRequest>(
                  (item) => ApiProc7SubRequest.fromJson(item))
              .toList());
}

class ApiProc7RequestResponse {
  ApiProc7RequestResponse(
      {@required this.success,
        @required this.authenticated,
        @required this.debugRequest,
        @required this.subRequestResponses});

  final bool success;
  final bool authenticated;
  ApiProc7Request debugRequest;
  List<ApiProc7SubRequestResponse> subRequestResponses;

  static final String success_CCFN = 'success';
  static final String authenticated_CCFN = 'authenticated';
  static final String debugRequest_CCFN = 'debugRequest';
  static final String subRequestResponses_CCFN = 'subRequestResponses';

  Map<String, dynamic> toJson() => {
    ApiProc7RequestResponse.success_CCFN: this.success,
    ApiProc7RequestResponse.authenticated_CCFN: this.authenticated,
    ApiProc7RequestResponse.debugRequest_CCFN:
    json.encode(this.debugRequest.toJson()),
    ApiProc7RequestResponse.subRequestResponses_CCFN:
    this.subRequestResponses == null
        ? []
        : this
        .subRequestResponses
        .map((item) => item.toJson())
        .toList(),
  };

  factory ApiProc7RequestResponse.fromJson(Map<String, dynamic> data) =>
      ApiProc7RequestResponse(
          success: data[ApiProc7RequestResponse.success_CCFN],
          authenticated: data[ApiProc7RequestResponse.authenticated_CCFN],
          debugRequest:data[ApiProc7RequestResponse.debugRequest_CCFN]==null? null: ApiProc7Request.fromJson(
              data[ApiProc7RequestResponse.debugRequest_CCFN]),
          subRequestResponses:
          data[ApiProc7RequestResponse.subRequestResponses_CCFN] == null
              ? List<ApiProc7SubRequestResponse>()
              : data[ApiProc7RequestResponse.subRequestResponses_CCFN]
              .map<ApiProc7SubRequestResponse>(
                  (item) => ApiProc7SubRequestResponse.fromJson(item))
              .toList());
}

class ApiProc7SubRequest {
  ApiProc7SubRequest(
      {@required this.requestName,
        @required this.sessionSubRequestId,
        @required this.documents,
        @required this.docstreams});

  final String requestName;
  final String sessionSubRequestId;
  final List<Document > documents;
  final List<DocStream> docstreams;

  static final String requestName_CCFN = 'requestName';
  static final String sessionSubRequestId_CCFN = 'sessionSubRequestId';
  static final String documents_CCFN = 'documents';
  static final String docstreams_CCFN = 'docstreams';

  Map<String, dynamic> toJson() => {
    ApiProc7SubRequest.requestName_CCFN: this.requestName,
    ApiProc7SubRequest.sessionSubRequestId_CCFN: this.sessionSubRequestId,
    ApiProc7SubRequest.documents_CCFN: this.documents == null
        ? []
        : this.documents.map((item) => item.toJson()).toList(),
    ApiProc7SubRequest.docstreams_CCFN: this.docstreams == null
        ? []
        : this.docstreams.map((item) => item.toJson()).toList(),
  };
  factory ApiProc7SubRequest.fromJson(Map<String, dynamic> data) =>
      ApiProc7SubRequest(
        requestName: data[ApiProc7SubRequest.requestName_CCFN],
        sessionSubRequestId: data[ApiProc7SubRequest.sessionSubRequestId_CCFN],
        documents: data[ApiProc7SubRequest.documents_CCFN] == null
            ? List<Document>()
            : data[ApiProc7SubRequest.documents_CCFN]
            .map<Document>((item) => Document.fromJson(item))
            .toList(),
        docstreams: data[ApiProc7SubRequest.docstreams_CCFN] == null
            ? List<DocStream>()
            : data[ApiProc7SubRequest.docstreams_CCFN]
            .map<DocStream>((item) => DocStream.fromJson(item))
            .toList(),
      );
}

class ApiProc7SubRequestResponse {
  ApiProc7SubRequestResponse(
      {@required this.success,
        @required this.sessionSubRequestId,
        @required this.documents,
        @required this.docstreams,
        @required this.debugSubRequest});

  final bool success;
  final String sessionSubRequestId;
  final List<Document> documents;
  final List<DocStream> docstreams;
  ApiProc7SubRequest debugSubRequest;

  static final String success_CCFN = 'success';
  static final String sessionSubRequestId_CCFN = 'sessionSubRequestId';
  static final String documents_CCFN = 'documents';
  static final String docstreams_CCFN = 'docstreams';
  static final String debugSubRequest_CCFN = 'debugSubRequest';

  Map<String, dynamic> toJson() => {
    ApiProc7SubRequestResponse.success_CCFN: this.success,
    ApiProc7SubRequestResponse.sessionSubRequestId_CCFN:
    this.sessionSubRequestId,
    ApiProc7SubRequestResponse.documents_CCFN: this.documents == null
        ? []
        : this.documents.map((item) => item.toJson()).toList(),
    ApiProc7SubRequestResponse.docstreams_CCFN: this.docstreams == null
        ? []
        : this.docstreams.map((item) => item.toJson()).toList(),
    ApiProc7SubRequestResponse.debugSubRequest_CCFN:
    json.encode(this.debugSubRequest.toJson())
  };

  factory ApiProc7SubRequestResponse.fromJson(Map<String, dynamic> data) =>
      ApiProc7SubRequestResponse(
          success: data[ApiProc7SubRequestResponse.success_CCFN],
          sessionSubRequestId:
          data[ApiProc7SubRequestResponse.sessionSubRequestId_CCFN],
          documents: data[ApiProc7SubRequestResponse.documents_CCFN] == null
              ? List<Document>()
              : data[ApiProc7SubRequestResponse.documents_CCFN]
              .map<Document>((item) => Document.fromJson(item))
              .toList(),
          docstreams: data[ApiProc7SubRequestResponse.docstreams_CCFN] == null
              ? List<DocStream>()
              : data[ApiProc7SubRequestResponse.docstreams_CCFN]
              .map<DocStream>((item) => DocStream.fromJson(item))
              .toList(),
          debugSubRequest: ApiProc7SubRequest.fromJson(
              data[ApiProc7SubRequestResponse.debugSubRequest_CCFN]));
}

/*
class UpsyncDocstreamResponse {
  UpsyncDocstreamResponse(
      {@required this.success,
      @required this.authenticated,
      @required this.objects});

  final bool success;
  final bool authenticated;
  final List<UpsyncDocstreamInstanceResponse> objects;

  static final String success_CCFN = 'success';
  static final String authenticated_CCFN = 'authenticated';
  static final String objects_CCFN = 'objects';
  static final String tokenObjects_CCFN = 'tokenObjects';

  factory UpsyncDocstreamResponse.fromJson(Map<String, dynamic> data) =>
      UpsyncDocstreamResponse(
          success: data[UpsyncDocstreamResponse.success_CCFN],
          authenticated: data[UpsyncDocstreamResponse.authenticated_CCFN],
          objects: data[UpsyncDocstreamResponse.objects_CCFN] == null
              ? List<UpsyncDocstreamInstanceResponse>()
              : data[UpsyncDocstreamResponse.objects_CCFN]
                  .map<UpsyncDocstreamInstanceResponse>(
                      (item) => UpsyncDocstreamInstanceResponse.fromJson(item))
                  .toList());

  Map<String, dynamic> toJson() => {
        UpsyncDocstreamResponse.success_CCFN: this.success,
        UpsyncDocstreamResponse.authenticated_CCFN: this.authenticated,
        UpsyncDocstreamResponse.objects_CCFN: this.objects == null
            ? []
            : this.objects.map((item) => item.toJson()).toList(),
      };
}
*/


/*

class TokenRequestInstanceResponse {
  TokenRequestInstanceResponse(
      {@required this.objectName, @required this.rows});

  final String objectName;
  final List<UpsyncToken> rows;

  static final String objectName_CCFN = 'objectName';
  static final String rows_CCFN = 'rows';

  factory TokenRequestInstanceResponse.fromJson(Map<String, dynamic> data) =>
      TokenRequestInstanceResponse(
          objectName: data[TokenRequestInstanceResponse.objectName_CCFN],
          rows: data[TokenRequestInstanceResponse.rows_CCFN] == null
              ? List<UpsyncToken>()
              : data[TokenRequestInstanceResponse.rows_CCFN]
                  .map<UpsyncToken>((item) => UpsyncToken.fromJson(item))
                  .toList());

  Map<String, dynamic> toJson() => {
        UpsyncDocstreamInstanceResponse.objectName_CCFN: this.objectName,
        UpsyncDocstreamInstanceResponse.rows_CCFN: this.rows == null
            ? []
            : this.rows.map((item) => item.toJson()).toList(),
      };
}

class UpsyncDocstreamInstanceResponse {
  UpsyncDocstreamInstanceResponse(
      {@required this.objectName, @required this.rows});

  final String objectName;
  final List<DocStream> rows;

  static final String objectName_CCFN = 'objectName';
  static final String rows_CCFN = 'rows';

  factory UpsyncDocstreamInstanceResponse.fromJson(Map<String, dynamic> data) =>
      UpsyncDocstreamInstanceResponse(
          objectName: data[UpsyncDocstreamInstanceResponse.objectName_CCFN],
          rows: data[UpsyncDocstreamInstanceResponse.rows_CCFN] == null
              ? List<DocStream>()
              : data[UpsyncDocstreamInstanceResponse.rows_CCFN]
                  .map<DocStream>((item) => DocStream.fromJson(item))
                  .toList());

  Map<String, dynamic> toJson() => {
        UpsyncDocstreamInstanceResponse.objectName_CCFN: this.objectName,
        UpsyncDocstreamInstanceResponse.rows_CCFN: this.rows == null
            ? []
            : this.rows.map((item) => item.toJson()).toList(),
      };
}
*/
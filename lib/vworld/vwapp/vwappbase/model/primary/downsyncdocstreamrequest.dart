import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/upsynctoken.dart';


class DownsyncDocStreamRequest{
  DownsyncDocStreamRequest({
    @required this.whereSql,
    @required this.localDocstreamMd5,
    this.serverDocstreamMd5,
    @required this.localDocStreams,
    this.serverDocStreams
  });

  final String whereSql;
  final String localDocstreamMd5;
  final String serverDocstreamMd5;
  final List<UpsyncToken> localDocStreams;
  final List<UpsyncToken> serverDocStreams;


  static final String whereSql_CCFN='whereSql';
  static final String localDocstreamMd5_CCFN='localDocstreamMd5';
  static final String serverDocstreamMd5_CCFN='serverDocstreamMd5';
  static final String localDocStreams_CCFN='localDocStreams';
  static final String serverDocStreams_CCFN='serverDocStreams';

  Map<String, dynamic> toJson() => {
    DownsyncDocStreamRequest.whereSql_CCFN: this.whereSql,
    DownsyncDocStreamRequest.localDocstreamMd5_CCFN: this.localDocstreamMd5,
    DownsyncDocStreamRequest.serverDocstreamMd5_CCFN: this.serverDocstreamMd5,
    DownsyncDocStreamRequest.localDocStreams_CCFN:  this.localDocStreams == null
        ? []
        : this.localDocStreams.map((item) => item.toJson()).toList(),
    DownsyncDocStreamRequest.serverDocStreams_CCFN:  this.serverDocStreams == null
        ? []
        : this.serverDocStreams.map((item) => item.toJson()).toList(),
  };

  factory DownsyncDocStreamRequest.fromJson(Map<String, dynamic> data) =>DownsyncDocStreamRequest(
    whereSql: data[DownsyncDocStreamRequest.whereSql_CCFN],
    localDocstreamMd5: data[DownsyncDocStreamRequest.localDocstreamMd5_CCFN],
    serverDocstreamMd5: data[DownsyncDocStreamRequest.serverDocstreamMd5_CCFN],
    localDocStreams: data[DownsyncDocStreamRequest.localDocStreams_CCFN] == null
        ? List<UpsyncToken>()
        : data[DownsyncDocStreamRequest.localDocStreams_CCFN]
        .map<UpsyncToken>((item) => UpsyncToken.fromJson(item))
        .toList(),
    serverDocStreams: data[DownsyncDocStreamRequest.serverDocStreams_CCFN] == null
        ? List<UpsyncToken>()
        : data[DownsyncDocStreamRequest.serverDocStreams_CCFN]
        .map<UpsyncToken>((item) => UpsyncToken.fromJson(item))
        .toList(),

  );


}
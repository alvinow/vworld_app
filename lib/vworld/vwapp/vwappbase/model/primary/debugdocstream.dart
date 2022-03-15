import 'package:flutter/cupertino.dart';

class DebugDocstream {
  DebugDocstream(
      {required this.isRecordInserted,
        required this.isDocStreamProcessed,
        required this.clientActionId,
        required this.errorMessage});

  final bool? isRecordInserted;
  final bool? isDocStreamProcessed;
  final String? clientActionId;
  final String? errorMessage;

  static final String isRecordInserted_CCFN = 'isRecordInserted';
  static final String isDocStreamProcessed_CCFN = 'isDocStreamProcessed';
  static final String clientActionId_CCFN = 'clientActionId';
  static final String errorMessage_CCFN = 'errorMessage';

  static final String deleteRecordOnClient_clientActionId_Fields='deleteRecordOnClient';
  static final String retokenizeRecordOnClient_clientActionId_Fields='retokenizeRecordOnClient';
  static final String updateServerTokenRecordOnClient_clientActionId_Fields='updateServerTokenRecordOnClient';

  factory DebugDocstream.fromJson(Map<String, dynamic> data) => DebugDocstream(
      isRecordInserted: data[DebugDocstream.isRecordInserted_CCFN],
      isDocStreamProcessed: data[DebugDocstream.isDocStreamProcessed_CCFN],
      clientActionId: data[DebugDocstream.clientActionId_CCFN],
      errorMessage: data[DebugDocstream.errorMessage_CCFN]);

  Map<String, dynamic> toJson() => {
    DebugDocstream.isRecordInserted_CCFN: this.isRecordInserted,
    DebugDocstream.isDocStreamProcessed_CCFN: this.isDocStreamProcessed,
    DebugDocstream.clientActionId_CCFN: this.clientActionId,
    DebugDocstream.errorMessage_CCFN: this.errorMessage
  };
}

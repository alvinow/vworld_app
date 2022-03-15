import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class ErrorLog{
  String? errorLogId=  Uuid().v4();
  DateTime? dateTime=DateTime.now().toUtc();
  final String? catchedLocation;
  final String? errorMessage;
  String? additionalData="";
  String? loginsessionId="";

  static final  String errorLogId_fieldName='errorLogId';
  static final  String dateTime_fieldName='dateTime';
  static final  String catchedLocation_fieldName='catchedLocation';
  static final  String errorMessage_fieldName='errorMessage';
  static final  String additionalData_fieldName='additionalData';
  static final  String loginsessionId_fieldName='loginsessionId';

  ErrorLog({
    this.errorLogId ,
    this.dateTime ,
    @required this.catchedLocation="",
    @required this.errorMessage="",
    this.additionalData,
    this.loginsessionId
  });

  factory ErrorLog.fromJson(Map<String, dynamic> data)=>ErrorLog(
      errorLogId: data[ErrorLog.errorLogId_fieldName],
      dateTime:  data[ErrorLog.dateTime_fieldName],
      catchedLocation: data[ErrorLog.catchedLocation_fieldName],
      errorMessage: data[ErrorLog.errorMessage_fieldName],
      additionalData: data[ErrorLog.additionalData_fieldName],
      loginsessionId: data[ErrorLog.loginsessionId_fieldName]
  );

  Map<String, dynamic> toJson()=>{
    ErrorLog.errorLogId_fieldName:this.errorLogId,
    ErrorLog.dateTime_fieldName:this.dateTime,
    ErrorLog.catchedLocation_fieldName:this.catchedLocation,
    ErrorLog.errorMessage_fieldName:this.errorMessage,
    ErrorLog.additionalData_fieldName:this.additionalData,
    ErrorLog.loginsessionId_fieldName:this.loginsessionId
  };
}
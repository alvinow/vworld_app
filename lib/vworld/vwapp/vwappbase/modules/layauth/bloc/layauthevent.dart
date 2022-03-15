import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/model/loginpageappparam.dart';



abstract class LayAuthEvent extends Equatable {
  const LayAuthEvent();

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}

class LayAuthEventCheckLocalLoginResponse extends LayAuthEvent {
  LayAuthEventCheckLocalLoginResponse(this.timestamp);

  final DateTime timestamp;

  @override
  List<Object> get props => [timestamp];

  @override
  String toString() =>
      'LayAuthEventGetLocalLoginResponse{${this.timestamp.toString()}}';
}

class LayAuthEventLogout extends LayAuthEvent {
  LayAuthEventLogout({required this.timestamp, required this.userloginId});

  final DateTime timestamp;
  final String userloginId;

  @override
  List<Object> get props => [timestamp];

  @override
  String toString() => 'LayAuthEventLogout{${this.timestamp.toString()}}';
}

class LayAuthEventLogin extends LayAuthEvent {
  LayAuthEventLogin({required this.loginPageAppParam, required this.timestamp});

  final LoginPageAppParam loginPageAppParam;
  final DateTime timestamp;

  @override
  List<Object> get props => [loginPageAppParam, timestamp];

  @override
  String toString() =>
      'LayAuthEventLogin{${this.timestamp.toString()},${json.encode(this.loginPageAppParam.toString())}}';
}

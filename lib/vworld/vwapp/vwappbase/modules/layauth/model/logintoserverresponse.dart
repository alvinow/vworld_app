import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/loginresponse.dart';

class LoginToServerResponse {
  LoginToServerResponse(
      {@required this.loginResponse,
      this.isExceptionOccured: false,
      this.isConnectedToServer: false});
  LoginResponse loginResponse;
  bool isExceptionOccured;
  bool isConnectedToServer;
}

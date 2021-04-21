import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/appstaticparam.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/loginrequestbody.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/loginresponse.dart';

class LoginToServerResponse{
  LoginToServerResponse({ this.loginResponse, this.isExceptionOccured:false, this.isConnectedToServer :false});
  LoginResponse loginResponse;
  bool isExceptionOccured;
  bool isConnectedToServer;
}

class UserRepository {
  static final String keySharedPrefLoginResponse = "loginResponse";
  static final String keySharedPrefIsAuthenticated = 'isAuthenticated';

  //static final String loginApiUrl ="https://api.bagkeudikdasmen.id/proc7/api/2.0/json/login";

  static Future<Directory> getAppSavingDirectory() async{
    Directory returnValue;
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      returnValue = Directory(
          "${appDocDir.path}/${AppStaticParam.localFileDocumentDirectory}");
    }
    catch(error){
      print("Error catched on UserRepository.getAppSavingDirectory(): ErrorMessage=${error.toString()}");
    }
    return returnValue;
  }


  static Future<void> syncDocstreamSpiMobile2020() async {
    try {

      /*
      await DocumentDocStreamStore.upsyncDocStream();

      await DocumentDocStreamStore.downsyncDocStream([
        '2020_spi_mobile_filedocumentgroup_3',
        '2020_spi_mobile_filedocumentgroup_4',
        '2020_spi_mobile_filedocumentgroup_5',
        '2020_spi_mobile_filedocumentgroup_6',
        '2020_spi_mobile_filedocumentgroup_7',
        '2020_spi_mobile_filedocumentgroup_8',
        '2020_spi_mobile_filedocumentgroup_9',
        Document.linkFiledocumenttypegroup,
        Document.fileDocumentLinkDocumenttypeId
      ]);

       */
    } catch (error) {}
  }




  static Future<LoginToServerResponse> loginToServerWithResponse(
      {@required LoginRequestBody loginRequestBody,
        @required String loginApiUrl}) async {
    LoginToServerResponse returnValue=LoginToServerResponse();
    try {
      final String loginRequestBodyString =
      json.encode(loginRequestBody.toJson());

      print('Will be http post with param ' +
          json.encode(loginRequestBody.toJson()));

      final response = await http.Client().post(
        loginApiUrl,
        headers: {
          "Access-Control-Allow-Origin":
          "*", // Required for CORS support to work
          "Access-Control-Allow-Credentials":
          "true", // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        },
        body: loginRequestBodyString,

      ).timeout(const Duration(seconds: 10));

      if(response.statusCode==200) {
        returnValue.isConnectedToServer = true;
      }

      String responseBody = response.body != null && response.body.length > 0
          ? response.body.trim().substring(0, 1)
          : null;

      if (response.statusCode == 200 &&
          responseBody != null &&
          responseBody.length > 0 &&
          responseBody.substring(0, 1) == "{") {
        print('http response');
        print(response.body);

        dynamic dynResponseBody = json.decode(response.body);

        returnValue.loginResponse = LoginResponse.fromJson(dynResponseBody);

        if(returnValue.loginResponse.authenticated==true) {
          print('LoginResponse to Json= ' + json.encode(returnValue.loginResponse.toJson()));
        }
        else
        {
          print("Login is not authenticated!!!");
        }
      }
    } catch (Error) {
      print("Error inside login=" + Error.toString());
      returnValue.isExceptionOccured=true;
    }

    return returnValue;
  }

  static Future<LoginResponse> loginToServer(
      {@required LoginRequestBody loginRequestBody,
        @required String loginApiUrl}) async {
    LoginResponse returnValue;
    try {
      final String loginRequestBodyString =
      json.encode(loginRequestBody.toJson());

      print('Will be http post with param ' +
          json.encode(loginRequestBody.toJson()));

      final response = await http.Client().post(
        loginApiUrl,
        headers: {
          "Access-Control-Allow-Origin":
          "*", // Required for CORS support to work
          "Access-Control-Allow-Credentials":
          "true", // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        },
        body: loginRequestBodyString,

      ).timeout(const Duration(seconds: 15));;

      String responseBody = response.body != null && response.body.length > 0
          ? response.body.trim().substring(0, 1)
          : null;

      if (response.statusCode == 200 &&
          responseBody != null &&
          responseBody.length > 0 &&
          responseBody.substring(0, 1) == "{") {
        print('http response');
        print(response.body);

        dynamic dynResponseBody = json.decode(response.body);

        returnValue = LoginResponse.fromJson(dynResponseBody);

        if(returnValue.authenticated==true) {
          print('LoginResponse to Json= ' + json.encode(returnValue.toJson()));
        }
        else
        {
          print("Login is not authenticated!!!");
        }
      }
    } catch (Error) {
      print("Error inside login=" + Error.toString());
    }

    return returnValue;
  }

  static Future<void> setUnathenticated() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(keySharedPrefIsAuthenticated);
      prefs.remove(keySharedPrefLoginResponse);
    } catch (Error) {
      print('Error inside set');
    }
  }

  Future<void> persistToken(String token) async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  static Future<void> addLoginResponseToSharedPref(
      LoginResponse loginResponse) async {
    try {
      String loginResponseString = json.encode(loginResponse.toJson());

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setBool(keySharedPrefIsAuthenticated, true);
      prefs.setString(keySharedPrefLoginResponse, loginResponseString);
    } catch (Error) {
      print('Error inside addLoginResponseToSharedPred=' + Error.toString());
    }
  }

  static Future<LoginResponse> getLoginResponseFromDevice() async {
    LoginResponse returnValue;

    bool isAuthenticated = await UserRepository.getIsAuthenticated();

    try {
      if (isAuthenticated == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final String loginResponseString =
        prefs.getString(keySharedPrefLoginResponse);

        dynamic dynResponseBody = json.decode(loginResponseString);
        returnValue = LoginResponse.fromJson(dynResponseBody);

        //print('loginsession Id');
        //print(returnValue.loginsessionId);
      }
    } catch (Error) {
      print('Error in getLoginResponseFromDevice' + Error.toString());
    }

    return returnValue;
  }

  static Future<bool> getIsAuthenticated() async {
    bool returnValue = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      returnValue = prefs.getBool(keySharedPrefIsAuthenticated);

      if (returnValue == null) {
        returnValue = false;
      }
    } catch (Error) {
      print('Error on getIsAuthenticated=' + Error.toString());
    }
    return returnValue;
  }
}

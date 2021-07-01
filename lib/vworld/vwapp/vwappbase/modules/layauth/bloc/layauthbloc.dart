import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/appstaticparam.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/generalcaption.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/loginresponse.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/model/loginpageappparam.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/model/loginrequestparam.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/model/logintoserverresponse.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/util/connectivityutil.dart';
import 'bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class LayAuthBloc extends Bloc<LayAuthEvent, LayAuthState> {
  LayAuthBloc() : super(LayAuthStateUninitialized());

  static final String keySharedPrefLoginResponse = "loginResponse";
  static final String keySharedPrefIsAuthenticated = 'isAuthenticated';

  static Future<void> setUnathenticated() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(LayAuthBloc.keySharedPrefIsAuthenticated);
      prefs.remove(LayAuthBloc.keySharedPrefLoginResponse);
    } catch (Error) {
      print('Error inside set');
    }
  }

  static Future<void> addLoginResponseToSharedPref(
      LoginResponse loginResponse) async {
    try {
      String loginResponseString = json.encode(loginResponse.toJson());

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setBool(LayAuthBloc.keySharedPrefIsAuthenticated, true);
      prefs.setString(
          LayAuthBloc.keySharedPrefLoginResponse, loginResponseString);
    } catch (Error) {
      print('Error inside addLoginResponseToSharedPred=' + Error.toString());
    }
  }

  static Future<LoginToServerResponse> loginToServerWithResponse(
      {@required LoginRequestParam loginRequestParam,
      @required String loginApiUrl}) async {
    LoginToServerResponse returnValue =
        LoginToServerResponse(loginResponse: LoginResponse());
    try {
      final String loginRequestBodyString =
          json.encode(loginRequestParam.toJson());

      print('Will be http post with param ' +
          json.encode(loginRequestParam.toJson()));

      final response = await http.Client()
          .post(
            Uri.http(loginApiUrl,"")  ,
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
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
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

        if (returnValue.loginResponse.authenticated == true) {
          print('LoginResponse to Json= ' +
              json.encode(returnValue.loginResponse.toJson()));
        } else {
          print("Login is not authenticated!!!");
        }
      }
    } catch (Error) {
      print("Error inside login=" + Error.toString());
      returnValue.isExceptionOccured = true;
    }

    return returnValue;
  }

  static Future<bool> getIsAuthenticated() async {
    bool returnValue = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      returnValue = prefs.getBool(LayAuthBloc.keySharedPrefIsAuthenticated);

      if (returnValue == null) {
        returnValue = false;
      }
    } catch (Error) {
      print('Error on getIsAuthenticated=' + Error.toString());
    }
    return returnValue;
  }

  static Future<LoginResponse> getLoginResponseFromDevice() async {
    LoginResponse returnValue;

    bool isAuthenticated = await LayAuthBloc.getIsAuthenticated();

    try {
      if (isAuthenticated == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final String loginResponseString =
            prefs.getString(keySharedPrefLoginResponse);

        dynamic dynResponseBody = json.decode(loginResponseString);
        returnValue = LoginResponse.fromJson(dynResponseBody);
        print(loginResponseString);

        //print('loginsession Id');
        //print(returnValue.loginsessionId);
      }
    } catch (Error) {
      print('Error in getLoginResponseFromDevice' + Error.toString());
    }

    return returnValue;
  }

  /*
  @override
  get initialState => LayAuthStateUninitialized();

   */

  @override
  Stream<Transition<LayAuthEvent, LayAuthState>> transformEvents(
    Stream<LayAuthEvent> events,
    TransitionFunction<LayAuthEvent, LayAuthState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<LayAuthState> mapEventToState(LayAuthEvent event) async* {
    //LayAuthState currentState = state;

    if (event is LayAuthEventCheckLocalLoginResponse) {
      yield LayAuthStateProcessing(title: "initializing");

      final loginResponse = await LayAuthBloc.getLoginResponseFromDevice();

      if (loginResponse == null ||
          (loginResponse != null && loginResponse.authenticated == false)) {
        yield LayAuthStateLoggedOut();
        return;
      } else {
        yield LayAuthStateLoggedIn(loginResponse);
        return;
      }
    } else if (event is LayAuthEventLogin) {
      yield LayAuthStateProcessing(title: GeneralCaption.authenticatingCCFN);

      bool isConnectedToInternet =
          await ConnectivityUtil.isConnectedToInternet();

      if (isConnectedToInternet == false) {
        await Future.delayed(const Duration(seconds: 2), () {});

        yield LayAuthStateLoggedOut(
            loginPageAppParam: LoginPageAppParam(
                isPreviousLoginNotConnectedToInternet: true,
                isPreviousLogInFailed: false));
        return;
      }

      final LoginRequestParam loginRequestParam =
          event.loginPageAppParam.loginRequestParam;

      final LoginToServerResponse loginToServerResponse =
          await LayAuthBloc.loginToServerWithResponse(
              loginRequestParam: loginRequestParam,
              loginApiUrl: AppStaticParam.loginUrl);

      if (loginToServerResponse.loginResponse != null &&
          loginToServerResponse.loginResponse.authenticated == true) {
        await LayAuthBloc.addLoginResponseToSharedPref(
            loginToServerResponse.loginResponse);

        this.add(LayAuthEventCheckLocalLoginResponse(DateTime.now()));
        return;
      } else {
        if (loginToServerResponse.isExceptionOccured == true ||
            loginToServerResponse.isConnectedToServer == false) {
          yield LayAuthStateLoggedOut(
              loginPageAppParam: LoginPageAppParam(
                  isPreviousLoginNotConnectedToServer: true,
                  isPreviousLogInFailed: false));
          return;
        } else {
          yield LayAuthStateLoggedOut(
              loginPageAppParam:
                  LoginPageAppParam(isPreviousLogInFailed: true));
          return;
        }
      }
    } else if (event is LayAuthEventLogout) {
      yield LayAuthStateProcessing(title: GeneralCaption.loggingOutCCFN);
      await LayAuthBloc.setUnathenticated();

      yield LayAuthStateLoggedOut();
      return;
    }
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/loginresponse.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/model/loginpageappparam.dart';

abstract class LayAuthState extends Equatable {
  LayAuthState();

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}

class LayAuthStateUninitialized extends LayAuthState {
  @override
  String toString() => 'LayAuthStateUninitialized';
}

class LayAuthStateLoggedOut extends LayAuthState {
  LayAuthStateLoggedOut({this.loginPageAppParam: const LoginPageAppParam()});

  final LoginPageAppParam loginPageAppParam;

  @override
  String toString() => 'LayAuthStateLoggedOut';
}

class LayAuthStateProcessing extends LayAuthState {
  LayAuthStateProcessing({@required this.title, this.description:''});

  final String title;
  final String description;

  @override
  List<Object> get props => [title, description];

  @override
  String toString() => 'LayAuthStateProcessing';
}

class LayAuthStateLoggedIn extends LayAuthState {
  LayAuthStateLoggedIn(this.loginResponse);

  final LoginResponse loginResponse;

  @override
  List<Object> get props => [loginResponse];

  @override
  String toString() => 'LayAuthStateLoggedIn';
}

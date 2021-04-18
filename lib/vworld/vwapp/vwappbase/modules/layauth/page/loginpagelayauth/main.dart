import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/model/loginpageappparam.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/page/loginpagelayauth/loginpageimplementation.dart';

class LoginPageLayAuth extends StatefulWidget {
  LoginPageLayAuth(this.doLoginApp,
      {this.loginPageAppParam: const LoginPageAppParam()});

  final LoginPageAppParam loginPageAppParam;

  final LoginApp doLoginApp;

  @override
  _LoginPageLayAuthState createState() => _LoginPageLayAuthState();
}

class _LoginPageLayAuthState extends State<LoginPageLayAuth> {


  @override
  Widget build(BuildContext context) {
    return LoginPageImplementation(
      doLoginApp: this.widget.doLoginApp,
      loginPageAppParam: this.widget.loginPageAppParam,
    );
  }
}

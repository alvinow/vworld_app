import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/model/loginpageappparam.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/page/loginpagelayauth/applogo.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/page/loginpagelayauth/curvepainter1.dart';

typedef LoginApp = void Function(String, String);

class LoginPageImplementation extends StatefulWidget {
  LoginPageImplementation(
      {@required this.doLoginApp,
      this.loginPageAppParam: const LoginPageAppParam()});

  final LoginPageAppParam loginPageAppParam;

  final LoginApp doLoginApp;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageImplementation> {
  final _controllerUsername = TextEditingController();
  final _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        //painter: CurvePainter1(),
        child: _buildLoginLayout(),
      ),
    );
  }

  Widget _buildLoginLayout() {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: AppLogo(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildLoginFields(),
        )
      ],
    );
  }

  Widget _buildLoginFields() {
    return Card(
      color: Colors.white70,
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 80.0),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            this.widget.loginPageAppParam.isPreviousLoginNotConnectedToInternet
                ? _buildNotConnectedToInternetWarning()
                : this
                            .widget
                            .loginPageAppParam
                            .isPreviousLoginNotConnectedToServer ==
                        true
                    ? _buildNotConnectedToServerWarning()
                    : this.widget.loginPageAppParam.isPreviousLogInFailed ==
                            true
                        ? this._buildInvalidLoginWarning()
                        : Container(),
            _buildEmailField(),
            SizedBox(
              height: 10.0,
            ),
            _buildPasswordField(),
            SizedBox(
              height: 20.0,
            ),
            _buildSubmitButton(),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvalidLoginWarning() {
    return Text(
      "Invalid Username and/or Password",
      style: TextStyle(color: Colors.red),
    );
  }

  Widget _buildNotConnectedToInternetWarning() {
    return Text(
      "Error: Tidak terhubung ke Internet",
      style: TextStyle(color: Colors.red),
    );
  }

  Widget _buildNotConnectedToServerWarning() {
    return Text(
      "Error: Tidak terhubung ke server",
      style: TextStyle(color: Colors.red),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _controllerUsername,
      decoration: InputDecoration(labelText: 'Username'),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _controllerPassword,
      obscureText: true,
      decoration: InputDecoration(labelText: 'Password'),
    );
  }

  Widget _buildSubmitButton() {
    /*
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );*/

    return RaisedButton(
      onPressed: () {
        if (_controllerUsername.text.trim().length > 4 &&
            _controllerPassword.text.trim().length > 4) {
          this.widget.doLoginApp(
              _controllerUsername.text.trim(), _controllerPassword.text.trim());
        } else {
          _showMyDialog();
        }
      },
      color: Colors.blueAccent[200],
      child: Text(
        'LOGIN',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  /*
  Widget _buildRegisterText() {
    return Text(
      'REGISTER',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
    );
  }*/

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Jumlah karakter username & password minimal 5 karakter'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

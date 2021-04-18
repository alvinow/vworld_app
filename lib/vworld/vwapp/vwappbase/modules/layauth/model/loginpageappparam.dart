import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/model/loginrequestparam.dart';

class LoginPageAppParam {
  const LoginPageAppParam(
      {this.isPreviousLogInFailed: false,
      this.isPreviousLoginNotConnectedToInternet: false,
      this.isPreviousLoginNotConnectedToServer: false,
      this.loginRequestParam});
  final bool isPreviousLogInFailed;
  final bool isPreviousLoginNotConnectedToInternet;
  final bool isPreviousLoginNotConnectedToServer;
  final LoginRequestParam loginRequestParam;
}

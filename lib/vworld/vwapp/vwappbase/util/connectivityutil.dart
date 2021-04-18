import 'package:connectivity/connectivity.dart';

class ConnectivityUtil {
  static Future<bool> isConnectedToInternet() async {
    bool returnValue = false;

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      returnValue = true;
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      returnValue = true;
      // I am connected to a wifi network.
    }
    return returnValue;
  }
}
import 'package:connectivity_plus/connectivity_plus.dart';

class Helper {
  static Future isNotConnected() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return false;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return false;
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      return false;
    } else if (connectivityResult == ConnectivityResult.none) {
      return true;
    }
  }
}

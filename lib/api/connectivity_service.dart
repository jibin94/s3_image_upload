import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  ConnectivityService._internal();
  static Future<bool> isConnected() async {
    var connectivity = await (Connectivity().checkConnectivity());
    if (connectivity == ConnectivityResult.mobile ||
        connectivity == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}

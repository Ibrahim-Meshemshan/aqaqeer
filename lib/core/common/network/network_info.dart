
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
abstract class NetworkConnectivityInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl extends NetworkConnectivityInfo{

  @override
  Future<bool> get isConnected async {
    try{
      List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
     return (connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi)|| connectivityResult.contains(ConnectivityResult.bluetooth));
    }
    catch(e){
      if (kDebugMode) {
        print('Error checking connectivity: $e');
      }
      return false;
    }
  }



}
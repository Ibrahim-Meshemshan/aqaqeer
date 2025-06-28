import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

typedef ConnectivityCallback = void Function(
    List<ConnectivityResult> result)?;

class ConnectionStatus {
  ConnectionStatus() {
    _connectivity = Connectivity();
  }

  late Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? subscription;

  void registerListener(ConnectivityCallback listener) {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {});
  }

  //A clean up method to close our StreamController
  //   Because this is meant to exist through the entire application life cycle this isn't
  //   really an issue
  Future<void> dispose() async {
    await subscription?.cancel();
  }

  Future<bool> isConnected() async {
    // return false;
    final connectivityResult =
        await _connectivity.checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      // I am connected to a mobile network.
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      // I am connected to a wifi network.
      return true;
    } else if (connectivityResult
        .contains(ConnectivityResult.ethernet)) {
      // I am connected to a ethernet network.
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
      // I am connected to a vpn network.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
      return true;
    } else if (connectivityResult
        .contains(ConnectivityResult.other)) {
      // I am connected to a network which is not in the above mentioned networks.
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      // I am not connected to any network.
      return false;
    }
    return false;
  }
}
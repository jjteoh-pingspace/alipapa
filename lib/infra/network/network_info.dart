
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfo implements INetworkInfo {
  final Connectivity _connectionChecker = Connectivity();

  @override
  Future<bool> get isConnected async {
    late ConnectivityResult result;
    
    try {
      result = await _connectionChecker.checkConnectivity();
      return result != ConnectivityResult.none;
    } on PlatformException catch (e) {
      print('connection checker throws error: ');
      print(e.toString());
      throw e;
    }
  }
}

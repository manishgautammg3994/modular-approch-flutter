import 'dart:async';
import 'dart:io';
import 'package:packages/packages.dart';
import 'package:flutter/foundation.dart';

import 'network_connectivity_checker.dart';
import 'network_connectivity_status.dart';
class NetworkConnectivityCheckerImpl implements NetworkConnectivityChecker {
  NetworkConnectivityCheckerImpl({
    required this.uris,

  });

  final List<Uri> uris;

  final _connectivity = Connectivity();

  @override
 //done
  Stream<NetworkConnectivityStatus> get onStatusChange =>
      _connectivity.onConnectivityChanged.asyncMap((connectivityResult) async {
        if (connectivityResult.lastOrNull == ConnectivityResult.none) {
          return NetworkConnectivityStatus.offline;
        } else {
          final networkResult = await compute(
              _performNetworkRequest, uris.first);
          return networkResult;
        }
      });


  @override
  Future<NetworkConnectivityStatus> hasConnection() async {
    final networkResult = await compute(_performNetworkRequest, uris.first);
    return networkResult;
  }

  @override
  void dispose() {

  }

  Future<NetworkConnectivityStatus> _performNetworkRequest(Uri uri) async {
    try {
      final request =
      await HttpClient().headUrl(uri).timeout(Duration(seconds: 5));
      final response = await request.close();

      if (response.statusCode >= 200 && response.statusCode <= 404) {
        return NetworkConnectivityStatus.online;
      } else if (response.statusCode > 499 && response.statusCode <= 600) {
        return NetworkConnectivityStatus.appOver;
      }
    } catch (e) {
      print('Network Request Error checking connection: $e');
    }

    return NetworkConnectivityStatus.offline;
  }
}






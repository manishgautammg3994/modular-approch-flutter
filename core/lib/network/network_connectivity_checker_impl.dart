import 'dart:async';

import 'package:packages/packages.dart';
import 'package:flutter/foundation.dart';
import 'package:preferences/preferences.dart';

import 'network_connectivity_checker.dart';
import 'network_connectivity_status.dart';

// class NetworkConnectivityCheckerImpl implements NetworkConnectivityChecker {
//  const  NetworkConnectivityCheckerImpl( {
//     required this.config,
//    // this.apiClient = ,
//   });
//   final FlavorConfig config;
//   // final ApiClient apiClient
//   @override
//  //done
//   Stream<NetworkConnectivityStatus> get onStatusChange =>
//       Connectivity().onConnectivityChanged.asyncMap((connectivityResult) async {
//         if (connectivityResult.lastOrNull == ConnectivityResult.none) {
//           return NetworkConnectivityStatus.offline;
//         } else {
//           final networkResult = await _computedNetworkCheck();
//           return networkResult;
//         }
//       });
//   @override
//   Future<NetworkConnectivityStatus> hasConnection() async {
//     final networkResult = await _computedNetworkCheck() ;
//     return networkResult;
//   }
//  Future<NetworkConnectivityStatus> _computedNetworkCheck() => compute(_performNetworkRequest, "${config.baseUrl}");
//   Future<NetworkConnectivityStatus> _performNetworkRequest(String uri) async {
//     try {
// final response = await Dio().get(uri); //todo pas api client with interceptor and check if banned or other
//   debugPrint(response.statusCode!.toString());
//       if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! <= 404) {
//         return NetworkConnectivityStatus.online;
//       } else if (response.statusCode != null && response.statusCode! > 499 && response.statusCode! <= 600) {
//         return NetworkConnectivityStatus.appOver;
//       }
//     } catch (e) {
//       print('Network Request Error checking connection: $e');
//     }
//     return NetworkConnectivityStatus.offline;
//   }
// }
//
//
//
//

class NetworkConnectivityCheckerImpl implements NetworkConnectivityChecker {
  NetworkConnectivityCheckerImpl._internal(this.config);

  static NetworkConnectivityCheckerImpl? _instance;
  static NetworkConnectivityCheckerImpl getInstance(FlavorConfig config) {
    _instance ??= NetworkConnectivityCheckerImpl._internal(config);
    return _instance!;
  }

  final FlavorConfig config; //api client istead

  @override
  Stream<NetworkConnectivityStatus> get onStatusChange =>
      Connectivity().onConnectivityChanged.asyncMap((connectivityResult) async {
        if (connectivityResult.lastOrNull != null && connectivityResult.lastOrNull != ConnectivityResult.none) {
          final networkResult = await _computedNetworkCheck();
          return networkResult;
        } else {
          return NetworkConnectivityStatus.offline;
        }
      });

  @override
  Future<NetworkConnectivityStatus> hasConnection() async {
    final networkResult = await _computedNetworkCheck();
    return networkResult;
  }

  Future<NetworkConnectivityStatus> _computedNetworkCheck() =>
      compute(_performNetworkRequest, "${config.baseUrl}");

  Future<NetworkConnectivityStatus> _performNetworkRequest(String uri) async {
    try {
      final response = await Dio().get(uri);
      debugPrint(response.statusCode?.toString());
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! <= 404) {
        return NetworkConnectivityStatus.online;
      } else if (response.statusCode != null &&
          response.statusCode! > 499 &&
          response.statusCode! <= 600) {
        return NetworkConnectivityStatus.appOver;
      }
    } catch (e) {
      debugPrint('Network Request Error checking connection: $e');
    }
    return NetworkConnectivityStatus.offline;
  }
}


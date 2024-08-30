import 'dart:async';
import 'dart:io';

import 'package:packages/packages.dart';
import 'package:flutter/foundation.dart';

import '../services/services.dart';
import 'api_client.dart';
import 'network_connectivity_status.dart';
import 'network_info.dart';

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




 class NetworkInfoImpl implements NetworkInfo  {
 const NetworkInfoImpl( this._apiClient,
     // this._connectivity
     );

 final ApiServices _apiClient;
 // final   Connectivity _connectivity;


  @override
  Stream<NetworkConnectivityStatus> get onStatusChange =>
      _apiClient.connectivity.onConnectivityChanged.asyncMap((connectivityResult) async {
        if (connectivityResult.lastOrNull != null && connectivityResult.lastOrNull != ConnectivityResult.none) {
          final networkResult = await _computedNetworkCheck();
          return networkResult;
        } else {
          return NetworkConnectivityStatus.offline;
        }
      });



  Future<NetworkConnectivityStatus> _computedNetworkCheck() =>
      compute(_performNetworkRequest, ""
          // "/status/check"
      );

  Future<NetworkConnectivityStatus> _performNetworkRequest(String uri) async {

    try {
      final response = await _apiClient.dio.get(uri); //replace with Api Client
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
    }
    // on SocketException {
    //   await _connectivity.checkConnectivity().then((connectivityResult) async {
    //     if(connectivityResult.lastOrNull != null && connectivityResult.lastOrNull != ConnectivityResult.none){
    //
    //       await Future.delayed(const Duration(seconds: 5));
    //       // return
    //         await _computedNetworkCheck();
    //     }
    //   });
    // }
     catch (e) {
      debugPrint('Network Request Error checking connection: $e');
      //  add retry inspetor with dio on nointernet or say socket // if still that  then offline // but keep that running in background //TODO
      // return _computedNetworkCheck();
    }
    return NetworkConnectivityStatus.offline;
  }

  @override
  Future<NetworkConnectivityStatus> get isConnected => _computedNetworkCheck();
}


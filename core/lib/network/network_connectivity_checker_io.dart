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

final _connectivity =Connectivity();

  @override
  // TODO: implement onStatusChange
  Stream<NetworkConnectivityStatus> get onStatusChange => _connectivity.onConnectivityChanged.asyncMap((connectivityResult) async {
      if (connectivityResult.lastOrNull == ConnectivityResult.none) {
        return NetworkConnectivityStatus.offline;
      } else {
        final networkResult = await compute(_performNetworkRequest, uris.first);
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


      // Connectivity().onConnectivityChanged.map((connectivityResult)async*{
      //   final request = await HttpClient().headUrl(uri).timeout(
      //       Duration(seconds: 5));
      //   final response = await request.close();
      //
      //   switch(connectivityResult.lastOrNull){
      //     case null:
      //       yield NetworkConnectivityStatus.offline;
      //     case ConnectivityResult.none:
      //       yield NetworkConnectivityStatus.offline;
      //     case ConnectivityResult.vpn when (response.statusCode >=200 && response.statusCode <=499):
      //       yield NetworkConnectivityStatus.onlineButVPN;
      //     case ConnectivityResult.bluetooth :
      //
      //     case ConnectivityResult.wifi:
      //       // TODO: Handle this case.
      //     case ConnectivityResult.ethernet:
      //       // TODO: Handle this case.
      //     case ConnectivityResult.mobile:
      //       // TODO: Handle this case.
      //
      //       // TODO: Handle this case.
      //     case ConnectivityResult.vpn:
      //       // TODO: Handle this case.
      //     case ConnectivityResult.other:
            // TODO: Handle this case.
      //   }
      // });


  }





// // network_connectivity_checker_io.dart
// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
//
// import 'network_connectivity_checker.dart';
// import 'network_connectivity_status.dart';
//
// class NetworkConnectivityCheckerImpl implements NetworkConnectivityChecker {
//   const NetworkConnectivityCheckerImpl({
//     required this.uris,
//     this.interval = const Duration(seconds: 5),
//   });
//
//   final List<Uri> uris;
//   final Duration interval;
//
//   @override
//   Stream<NetworkConnectivityStatus> get onStatusChange async* {
//
//   }
//
//
//
//
//
//   @override
//   Future<void> dispose() async{
//
//   }
//
//   @override
//   Future<NetworkConnectivityStatus> hasConnection() async =>await _getNetworkStatus();
//
//   Future<NetworkConnectivityStatus> _getNetworkStatus() async => await compute(_performNetworkRequest, uris.first);
//   Future<NetworkConnectivityStatus> _performNetworkRequest(Uri uri) async {
//     try {
//       final request = await HttpClient().headUrl(uri).timeout(
//           Duration(seconds: 5));
//       final response = await request.close();
//
//       if (response.statusCode >= 200 && response.statusCode <= 404) {
//         return NetworkConnectivityStatus.online;
//       } else if (response.statusCode > 499 && response.statusCode <= 600) {
//         return NetworkConnectivityStatus.appOver;
//       }
//     } catch (e) {
//       print(' Network Request Error checking connection: $e');
//     }
//
//     return NetworkConnectivityStatus.offline;
//   }
// }
//
// /////////////////////
//
//
//
//
// // // network_connectivity_checker_io.dart
// // import 'dart:async';
// // import 'dart:io';
// // import 'network_connectivity_checker.dart';
// // import 'network_connectivity_status.dart';
// //
// // class NetworkConnectivityCheckerImpl implements NetworkConnectivityChecker {
// //   const NetworkConnectivityCheckerImpl({
// //     required this.uris,
// //     this.interval = const Duration(seconds: 5),
// //   });
// //
// //   final List<Uri> uris;
// //   final Duration interval;
// //
// //   @override
// //   Stream<NetworkConnectivityStatus> get onStatusChange async* {
// //     while (true) {
// //       yield* _checkConnection();
// //       await Future.delayed(interval);
// //     }
// //   }
// //
// //   Stream<NetworkConnectivityStatus> _checkConnection() async* {
// //     yield NetworkConnectivityStatus.checking;
// //
// //     for (final uri in uris) {
// //       try {
// //         final request = await HttpClient().headUrl(uri).timeout(Duration(seconds: 5));
// //         final response = await request.close();
// //         if (response.statusCode == HttpStatus.ok) {
// //           yield NetworkConnectivityStatus.online;
// //           return;
// //         }
// //       } catch (e) {
// //         continue;
// //       }
// //     }
// //     yield NetworkConnectivityStatus.offline;
// //   }
// // }
// ////////////////
//
//
//
// // import 'dart:async';
// // import 'dart:io';
// // import 'network_connectivity_checker.dart';
// // import 'network_connectivity_status.dart';
// //
// // class NetworkConnectivityCheckerImpl implements NetworkConnectivityChecker {
// //   const NetworkConnectivityCheckerImpl({
// //     required this.uris,
// //     this.interval = const Duration(seconds: 5),
// //   });
// //
// //   final List<Uri> uris;
// //   final Duration interval;
// //
// //
// //   @override
// //   Stream<NetworkConnectivityStatus> get onStatusChange async* {
// //     while (true) {
// //       yield* _checkConnection();
// //       await Future.delayed(interval);
// //     }
// //   }
// //
// //   Stream<NetworkConnectivityStatus> _checkConnection() async* {
// //     // yield NetworkConnectivityStatus.checking;
// //
// //     for (final uri in uris) {
// //       try {
// //         final result = await InternetAddress.lookup(uri.host).timeout(Duration(seconds: 4)).timeout exceptio handling;
// //         if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
// //           yield NetworkConnectivityStatus.online;
// //           return; // Exit early if we find an online status
// //         }
// //       } on SocketException catch (e) {
// //         // Log or handle the error if needed
// //         print('Network check failed: $e');
// //         continue;
// //       }
// //     }
// //     yield NetworkConnectivityStatus.offline;
// //   }
// // }

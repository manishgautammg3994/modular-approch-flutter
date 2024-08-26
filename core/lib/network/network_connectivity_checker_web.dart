// // network_connectivity_checker_web.dart
// import 'dart:async';
// import 'dart:js_interop';
// import 'package:flutter/cupertino.dart';
// import 'package:packages/packages.dart' ;
// import 'network_connectivity_checker.dart';
// import 'network_connectivity_status.dart';
//
// class NetworkConnectivityCheckerImpl implements NetworkConnectivityChecker {
//    NetworkConnectivityCheckerImpl({
//     required this.uris,
//     this.interval = const Duration(seconds: 5),
//   });
//
//   final List<Uri> uris;
//   final Duration interval;
//
//
//   final StreamController<NetworkConnectivityStatus> controller =
//   StreamController<NetworkConnectivityStatus>();
//   @override
//   Stream<NetworkConnectivityStatus> get onStatusChange  {
//
//     // Ensure distinct values only
//     final statusStream = controller.stream.distinct();
//
//     // Emit the initial status
//     controller.add(window.navigator.onLine
//         ? NetworkConnectivityStatus.online
//         : NetworkConnectivityStatus.offline);
//
//     // Listen to browser's online/offline events
//
//   window.addEventListener('online',(){
//       debugPrint("online");
//       controller.add(NetworkConnectivityStatus.online);
//     }.toJS);
//     window.addEventListener('offline',(){
//       debugPrint("offline");
//       controller.add(NetworkConnectivityStatus.offline);
//     }.toJS);
//
//     return  statusStream ;
// }
//
//   @override
//   void dispose() {
//     window.removeEventListener('online',(){}.toJS);
//     window.removeEventListener('offline',(){}.toJS);
//      controller.close();
//   }
//
//   @override
//   Future<NetworkConnectivityStatus> hasConnection() async{
//    return window.navigator.onLine ? NetworkConnectivityStatus.online : NetworkConnectivityStatus.offline;
//   }
//
//   }
// // window.navigator.onLine ;


import 'dart:async';
import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:packages/packages.dart';
import 'network_connectivity_checker.dart';
import 'network_connectivity_status.dart';

class NetworkConnectivityCheckerImpl implements NetworkConnectivityChecker {
  NetworkConnectivityCheckerImpl({
    required this.uris,
    this.interval = const Duration(seconds: 5),
  }) {
    _initializeEventListeners();
  }

  final List<Uri> uris;
  final Duration interval;
  final StreamController<NetworkConnectivityStatus> controller =
  StreamController<NetworkConnectivityStatus>();

  static bool _listenersInitialized = false;

  @override
  Stream<NetworkConnectivityStatus> get onStatusChange {
    // Ensure distinct values only
    final statusStream = controller.stream.distinct();

    // Emit the initial status
    controller.add(window.navigator.onLine
        ? NetworkConnectivityStatus.online
        : NetworkConnectivityStatus.offline);

    return statusStream;
  }

  void _initializeEventListeners() {
    if (_listenersInitialized) return;

    // Listen to browser's online/offline events
    window.addEventListener('online', () {
      debugPrint("online");
      controller.add(NetworkConnectivityStatus.online);
    }.toJS);

    window.addEventListener('offline', () {
      debugPrint("offline");
      controller.add(NetworkConnectivityStatus.offline);
    }.toJS);

    _listenersInitialized = true;
  }

  @override
  void dispose() {
    window.removeEventListener('online', () {}.toJS);
    window.removeEventListener('offline', () {}.toJS);
    controller.close();
    _listenersInitialized = false; // Reset flag on dispose

  }

  @override
  Future<NetworkConnectivityStatus> hasConnection() async {
    return window.navigator.onLine
        ? NetworkConnectivityStatus.online
        : NetworkConnectivityStatus.offline;
  }
}

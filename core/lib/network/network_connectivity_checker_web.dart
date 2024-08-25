// network_connectivity_checker_web.dart
import 'dart:async';

import 'package:packages/packages.dart' ;
import 'network_connectivity_checker.dart';
import 'network_connectivity_status.dart';

class NetworkConnectivityCheckerImpl implements NetworkConnectivityChecker {
  const NetworkConnectivityCheckerImpl({
    required this.uris,
    this.interval = const Duration(seconds: 5),
  });

  final List<Uri> uris;
  final Duration interval;

  @override
  Stream<NetworkConnectivityStatus> get onStatusChange async* {
    while (true) {
      yield* _checkConnection();
      await Future.delayed(interval);
    }
  }


  Stream<NetworkConnectivityStatus> _checkConnection() async* {
    // yield NetworkConnectivityStatus.checking;
if(window.navigator.onLine){
  yield NetworkConnectivityStatus.online;
  return;
}
    // for (final uri in uris) {
    //   try {
    //     // print('Network check on web ${uri.toString()},');
    //     final request = window.navigator.onLine;
    //     // await html.HttpRequest.requestCrossOrigin(
    //     //   uri.toString(),
    //     //   method: 'HEAD',
    //     //
    //     // ).timeout(Duration(seconds:4));
    //
    //     // Check if the status code is 200 OK
    //     if (request) {
    //       yield NetworkConnectivityStatus.online;
    //       return; // Exit early if we find an online status
    //     }
    //   } catch (e) {
    //     // Log or handle the error if needed
    //     print('Network check failed: ${e.toString()}');
    //     continue;
    //   }
    // }
    yield NetworkConnectivityStatus.offline;
  }
}

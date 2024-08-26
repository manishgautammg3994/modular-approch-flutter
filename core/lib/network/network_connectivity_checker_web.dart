// network_connectivity_checker_web.dart
import 'dart:async';
import 'dart:js_interop';

// import 'package:core/utils/extensions/log/log_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:packages/packages.dart' ;
import 'network_connectivity_checker.dart';
import 'network_connectivity_status.dart';

class NetworkConnectivityCheckerImpl implements NetworkConnectivityChecker {
   NetworkConnectivityCheckerImpl({
    required this.uris,
    this.interval = const Duration(seconds: 5),
  });

  final List<Uri> uris;
  final Duration interval;


  final StreamController<NetworkConnectivityStatus> controller =
  StreamController<NetworkConnectivityStatus>();
  @override
  Stream<NetworkConnectivityStatus> get onStatusChange async* {

    yield window.navigator.onLine
        ? NetworkConnectivityStatus.online
        : NetworkConnectivityStatus.offline;

  window.addEventListener('online',(){
      debugPrint("online");
      controller.add(NetworkConnectivityStatus.online);
    }.toJS);
    window.addEventListener('offline',(){
      debugPrint("offline");
      controller.add(NetworkConnectivityStatus.offline);
    }.toJS);

    yield*  controller.stream ;
}

  @override
  void dispose() {
    window.removeEventListener('online',(){}.toJS);
    window.removeEventListener('offline',(){}.toJS);
     controller.close();
  }

  @override
  Future<NetworkConnectivityStatus> hasConnection() async{
   return window.navigator.onLine ? NetworkConnectivityStatus.online : NetworkConnectivityStatus.offline;
  }

  }
// window.navigator.onLine ;
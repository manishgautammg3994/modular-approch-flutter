import 'dart:async';


import 'network_connectivity_status.dart';



abstract interface class NetworkConnectivityChecker {
  const NetworkConnectivityChecker();

  Stream<NetworkConnectivityStatus> get onStatusChange;
}


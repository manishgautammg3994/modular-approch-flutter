

import 'network_connectivity_checker.dart';
import 'network_connectivity_status.dart';

abstract interface class NetworkInfo {
  // Future<bool> get isConnected;
  Stream<NetworkConnectivityStatus> get onStatusChange;
}

class NetworkInfoImpl implements NetworkInfo {
  final NetworkConnectivityChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  // @override
  // Future<bool> get isConnected => connectionChecker.hasConnection;

  @override
  Stream<NetworkConnectivityStatus> get onStatusChange =>
      connectionChecker.onStatusChange;
}

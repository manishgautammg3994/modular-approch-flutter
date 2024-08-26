

import 'network_connectivity_checker.dart';
import 'network_connectivity_status.dart';

abstract interface class NetworkInfo {
  Stream<NetworkConnectivityStatus> get onStatusChange;
  Future<NetworkConnectivityStatus> get isConnected;
  void dispose();
}

class NetworkInfoImpl implements NetworkInfo {
  final NetworkConnectivityChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<NetworkConnectivityStatus> get isConnected => connectionChecker.hasConnection();

  @override
  Stream<NetworkConnectivityStatus> get onStatusChange =>
      connectionChecker.onStatusChange;

  @override
  void dispose() => connectionChecker.dispose();
}

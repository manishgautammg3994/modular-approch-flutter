

import 'network_connectivity_checker.dart';
import 'network_connectivity_status.dart';

abstract interface class NetworkInfo {
  const NetworkInfo();
  Stream<NetworkConnectivityStatus> get onStatusChange;
  Future<NetworkConnectivityStatus> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final NetworkConnectivityChecker connectionChecker;
  const NetworkInfoImpl(this.connectionChecker);

  @override
  Future<NetworkConnectivityStatus> get isConnected => connectionChecker.hasConnection();

  @override
  Stream<NetworkConnectivityStatus> get onStatusChange => connectionChecker.onStatusChange;

}

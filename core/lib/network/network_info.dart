import 'package:packages/packages.dart';

abstract interface class NetworkInfo {
  Future<bool> get isConnected;
  Stream<InternetConnectionStatus> get onStatusChange;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

  @override
  Stream<InternetConnectionStatus> get onStatusChange =>
      connectionChecker.onStatusChange;
}

import 'package:flutter/services.dart';

/// Connectivity status
 enum NetworkConnectivityStatus {
  /// Package is checking... internet state
  checking,
  /// Device is online
  online,
  onlineButVPN,
  /// Device is offline
  offline,
  /// Response as App Under Maintainace Mode
  appOver,
}

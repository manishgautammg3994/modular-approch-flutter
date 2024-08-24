import 'package:flutter/services.dart';

/// Connectivity status
 enum NetworkConnectivityStatus {
  /// Device is online
  online,

  /// Device is offline
  offline,

  /// Package is checking... internet state
  checking,
  /// Package is checking... internet state
  appOver,
}

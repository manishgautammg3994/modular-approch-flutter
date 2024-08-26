import 'package:core/network/network_info.dart';

import 'package:preferences/preferences.dart';


import 'network_connectivity_checker.dart';
import 'network_connectivity_checker_io.dart'
// if (dart.library.html ) 'network_connectivity_checker_web.dart'
if (dart.library.js_interop )'network_connectivity_checker_web.dart';


abstract interface class NetworkInfoFactory {
  const  NetworkInfoFactory();
  NetworkInfo createNetworkInfo();
  void dispose();
}

class NetworkInfoFactoryImpl implements NetworkInfoFactory {
  final FlavorConfig config;

   NetworkInfoFactoryImpl(this.config);
  late NetworkConnectivityChecker connectionChecker;

  @override
  NetworkInfo createNetworkInfo() {
      connectionChecker=NetworkConnectivityCheckerImpl(uris: [Uri.parse(config.baseUrl)]);
    return NetworkInfoImpl(connectionChecker);
  }

  @override
  void dispose() {
    connectionChecker.dispose();

  }
}

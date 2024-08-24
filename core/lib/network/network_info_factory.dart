import 'package:core/network/network_info.dart';

import 'package:preferences/preferences.dart';


import 'network_connectivity_checker_io.dart' if (dart.library.html) 'network_connectivity_checker_web.dart';


abstract interface class NetworkInfoFactory {
  NetworkInfo createNetworkInfo();
}

class NetworkInfoFactoryImpl implements NetworkInfoFactory {
  final FlavorConfig config;

  NetworkInfoFactoryImpl(this.config);

  @override
  NetworkInfo createNetworkInfo() {
    final
      connectionChecker=NetworkConnectivityCheckerImpl(uris: [Uri.parse(config.baseUrl)]);
    return NetworkInfoImpl(connectionChecker);
  }
}

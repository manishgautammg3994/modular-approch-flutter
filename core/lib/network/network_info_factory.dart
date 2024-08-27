import 'package:core/network/network_info.dart';

import 'package:preferences/preferences.dart';


import 'network_connectivity_checker.dart';
import 'network_connectivity_checker_impl.dart'
// if (dart.library.html ) 'network_connectivity_checker_web.dart'
// if (dart.library.js_interop )
//   'network_connectivity_checker_web.dart'
;


abstract interface class NetworkInfoFactory {
  const  NetworkInfoFactory();
  NetworkInfo createNetworkInfo();
}
class NetworkInfoFactoryImpl implements NetworkInfoFactory {
  final FlavorConfig config;
  const NetworkInfoFactoryImpl(this.config);
  @override
  NetworkInfo createNetworkInfo() {
    return NetworkInfoImpl(NetworkConnectivityCheckerImpl.getInstance( config));
  }
}

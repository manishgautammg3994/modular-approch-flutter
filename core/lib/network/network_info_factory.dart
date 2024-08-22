import 'package:core/network/network_info.dart';
import 'package:packages/packages.dart';
import 'package:preferences/preferences.dart';

abstract interface class NetworkInfoFactory {
  NetworkInfo createNetworkInfo();
}

class NetworkInfoFactoryImpl implements NetworkInfoFactory {
  final FlavorConfig config;

  NetworkInfoFactoryImpl(this.config);

  @override
  NetworkInfo createNetworkInfo() {
    final connectionChecker = InternetConnectionChecker.createInstance(
      customCheckOptions: [
        AddressCheckOption(
          uri: Uri.parse('${config.baseUrl}'),
          responseStatusFn: (response) {
            return response.statusCode == 404;
          },
        ),
      ],
      useDefaultOptions: false,
    );

    return NetworkInfoImpl(connectionChecker);
  }
}

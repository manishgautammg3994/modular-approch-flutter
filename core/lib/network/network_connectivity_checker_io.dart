// network_connectivity_checker_io.dart
import 'dart:async';
import 'dart:io';
import 'network_connectivity_checker.dart';
import 'network_connectivity_status.dart';

class NetworkConnectivityCheckerImpl implements NetworkConnectivityChecker {
  const NetworkConnectivityCheckerImpl({
    required this.uris,
    this.interval = const Duration(seconds: 5),
  });

  final List<Uri> uris;
  final Duration interval;

  @override
  Stream<NetworkConnectivityStatus> get onStatusChange async* {
    while (true) {
      yield* _checkConnection();
      await Future.delayed(interval);
    }
  }

  Stream<NetworkConnectivityStatus> _checkConnection() async* {
    yield NetworkConnectivityStatus.checking;

    for (final uri in uris) {
      try {
        final request = await HttpClient().headUrl(uri).timeout(Duration(seconds: 5));
        final response = await request.close();
        if (response.statusCode == HttpStatus.ok) {
          yield NetworkConnectivityStatus.online;
          return;
        }
      } catch (e) {
        continue;
      }
    }
    yield NetworkConnectivityStatus.offline;
  }
}


/////////////////////



// // network_connectivity_checker_io.dart
// import 'dart:async';
// import 'dart:io';
// import 'network_connectivity_checker.dart';
// import 'network_connectivity_status.dart';
//
// class NetworkConnectivityCheckerImpl implements NetworkConnectivityChecker {
//   const NetworkConnectivityCheckerImpl({
//     required this.uris,
//     this.interval = const Duration(seconds: 5),
//   });
//
//   final List<Uri> uris;
//   final Duration interval;
//
//   @override
//   Stream<NetworkConnectivityStatus> get onStatusChange async* {
//     while (true) {
//       yield* _checkConnection();
//       await Future.delayed(interval);
//     }
//   }
//
//   Stream<NetworkConnectivityStatus> _checkConnection() async* {
//     yield NetworkConnectivityStatus.checking;
//
//     for (final uri in uris) {
//       try {
//         final request = await HttpClient().headUrl(uri).timeout(Duration(seconds: 5));
//         final response = await request.close();
//         if (response.statusCode == HttpStatus.ok) {
//           yield NetworkConnectivityStatus.online;
//           return;
//         }
//       } catch (e) {
//         continue;
//       }
//     }
//     yield NetworkConnectivityStatus.offline;
//   }
// }
////////////////



// import 'dart:async';
// import 'dart:io';
// import 'network_connectivity_checker.dart';
// import 'network_connectivity_status.dart';
//
// class NetworkConnectivityCheckerImpl implements NetworkConnectivityChecker {
//   const NetworkConnectivityCheckerImpl({
//     required this.uris,
//     this.interval = const Duration(seconds: 5),
//   });
//
//   final List<Uri> uris;
//   final Duration interval;
//
//
//   @override
//   Stream<NetworkConnectivityStatus> get onStatusChange async* {
//     while (true) {
//       yield* _checkConnection();
//       await Future.delayed(interval);
//     }
//   }
//
//   Stream<NetworkConnectivityStatus> _checkConnection() async* {
//     // yield NetworkConnectivityStatus.checking;
//
//     for (final uri in uris) {
//       try {
//         final result = await InternetAddress.lookup(uri.host).timeout(Duration(seconds: 4));
//         if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//           yield NetworkConnectivityStatus.online;
//           return; // Exit early if we find an online status
//         }
//       } on SocketException catch (e) {
//         // Log or handle the error if needed
//         print('Network check failed: $e');
//         continue;
//       }
//     }
//     yield NetworkConnectivityStatus.offline;
//   }
// }

import 'package:flutter_test/flutter_test.dart' show setUp, group, test, expect;

import 'package:core/core.dart' show NetworkInfoImpl;
import 'package:mockito/mockito.dart';
import 'package:packages/packages.dart' show InternetConnectionChecker;

// Mock class for InternetConnectionChecker
class MockInternetConnectionChecker extends Mock
    implements InternetConnectionChecker {
  @override
  Future<bool> get hasConnection => super.noSuchMethod(
        Invocation.getter(#hasConnection),
        returnValue: Future.value(true),
        returnValueForMissingStub: Future.value(true),
      );
}

void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnectionChecker mockConnectionChecker;

  setUp(() {
    mockConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockConnectionChecker);
  });

  group('isConnected', () {
    test(
      'should forward the call to InternetConnectionChecker.hasConnection',
      () async {
        // Arrange
        final tHasConnectionFuture = Future.value(true);

        // Mock the hasConnection getter to return a Future with value true
        when(mockConnectionChecker.hasConnection)
            .thenAnswer((_) => tHasConnectionFuture);

        // Act
        final result = await networkInfo.isConnected;

        // Assert
        verify(mockConnectionChecker.hasConnection);
        expect(result, true); // Expecting the resolved value
      },
    );
  });
  test(
    'should forward the call to InternetConnectionChecker.hasConnection and return false',
    () async {
      // Arrange
      final tHasConnectionFuture = Future.value(false);

      when(mockConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);

      // Act
      final result = await networkInfo.isConnected;

      // Assert
      verify(mockConnectionChecker.hasConnection);
      expect(result, false);
    },
  );
}
// class MockDataConnectionChecker extends Mock
//     implements InternetConnectionChecker {}

// void main() {
//    NetworkInfoImpl? networkInfo;
//    MockDataConnectionChecker? mockDataConnectionChecker;

//   setUp(() {
//     mockDataConnectionChecker = MockDataConnectionChecker();
//     networkInfo = NetworkInfoImpl(mockDataConnectionChecker!);
//   });

//   group('isConnected', () {
//     test(
//       'should forward the call to InternetConnectionChecker.hasConnection',
//       () async {
//         // arrange
//         final tHasConnectionFuture = Future.value(true);

//         when(mockDataConnectionChecker?.hasConnection)
//             .thenAnswer((_) => tHasConnectionFuture);
//         // act
//         // NOTICE: We're NOT awaiting the result
//         final result = networkInfo?.isConnected;
//         // assert
//         verify(mockDataConnectionChecker?.hasConnection);
//         // Utilizing Dart's default referential equality.
//         // Only references to the same object are equal.
//         expect(result, tHasConnectionFuture);
//       },
//     );
//   });
// }

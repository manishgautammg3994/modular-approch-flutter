// import 'package:flutter_test/flutter_test.dart';

// import 'package:core/core.dart';
// import 'package:packages/packages.dart';
// // 🎯 Dart imports:
// import 'dart:io';
// import 'dart:math';

// // 📦 Package imports:
// import 'package:path/path.dart' as path;

// // Mock class for Hive Box
// class MockBox extends Mock implements Box {}

// // Create a mock for CacheManagerImpl
// class MockCacheManagerImpl extends Mock implements CacheManagerImpl {}

// void main() {
//   late MockBox mockBox;
//   late CacheManagerImpl cacheManager;

//   setUp(() async {
//     // Initialize the Hive Flutter
//     await Hive.initFlutter();

//     // Create the mock box
//     mockBox = MockBox();

//     // Setup CacheManagerImpl with mock box
//     cacheManager = CacheManagerImpl._();

//     // Assign the mocked box to the private static field
//     CacheManagerImpl._box = mockBox;

//     // Mock Hive operations
//     when(mockBox.isOpen).thenReturn(true);
//   });

//   group('CacheManagerImpl Unit Tests', () {
//     test('should write and read a value', () async {
//       final key = 'test_key';
//       final value = 'test_value';

//       // Mock the write and read operations
//       when(mockBox.put(key, value)).thenAnswer((_) async {});
//       when(mockBox.get(key)).thenReturn(value);

//       await cacheManager.write(key, value);
//       final result = cacheManager.read(key);

//       expect(result, equals(value));
//     });

//     test('should delete a value', () async {
//       final key = 'test_key';

//       // Mock the delete operation
//       when(mockBox.delete(key)).thenAnswer((_) async {});

//       await cacheManager.delete(key);
//       // Verify the delete method was called
//       verify(mockBox.delete(key));
//     });

//     test('should clear all values', () async {
//       // Mock the clear operation
//       when(mockBox.clear()).thenAnswer((_) async {});

//       await cacheManager.clearAll();
//       // Verify the clear method was called
//       verify(mockBox.clear());
//     });

//     test('should compact the box', () async {
//       // Mock the compact operation
//       when(mockBox.compact()).thenAnswer((_) async {});

//       await cacheManager.compact();
//       // Verify the compact method was called
//       verify(mockBox.compact());
//     });

//     test('should close the box', () async {
//       // Mock the close operation
//       when(mockBox.close()).thenAnswer((_) async {});

//       await cacheManager.close();
//       // Verify the close method was called
//       verify(mockBox.close());
//     });
//   });
// }
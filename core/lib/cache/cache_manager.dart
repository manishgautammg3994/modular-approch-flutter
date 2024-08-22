import 'package:core/constants/hive_keys.dart';
import 'package:packages/packages.dart';

/// Cache Manager
/// A simple and efficient interface for persisting and retrieving state changes.
///
/// Supported data types:
/// `List`, `Map`, `DateTime`, `BigInt`, and `Uint8List`.
abstract interface class CacheManager {
  /// Retrieves a value associated with the [key].
  dynamic read(String key);

  /// Persists a key-value pair.
  /// Supports `List`, `Map`, `DateTime`, `BigInt`, and `Uint8List` as value types.
  /// Other types may result in an error.
  Future<void>? write(String key, dynamic value);

  /// Deletes a value by its [key].
  Future<void> delete(String key);

  /// Clears all cached data.
  Future<void> clearAll();

  /// Compacts the cache to optimize storage.
  Future<void> compact();

  /// Closes the cache manager and releases any resources.
  Future<void> close();
}

/// Implementation of [CacheManager] that uses `Hive` to persist and retrieve state changes from the local device.
final class CacheManagerImpl implements CacheManager {
  static CacheManagerImpl? _singleton;
  static late Box _box;

  CacheManagerImpl._();

  factory CacheManagerImpl() {
    _singleton ??= CacheManagerImpl._();
    return _singleton!;
  }

  /// Initializes the cache manager. Should be called before using the instance.
  ///
  /// [encrypt] specifies whether to encrypt the stored data.
  /// [encryptKey] is the key used for encryption.
  static Future<CacheManagerImpl> setup({
    bool encrypt = true,
    String encryptKey = HiveKeys.encryptKey,
  }) async {
    if (_singleton == null) {
      Hive.initFlutter();

      var encryptionKey = encryptKey.codeUnits;
      _box = await Hive.openBox(
        HiveKeys.globalkey,
        encryptionCipher: encrypt ? HiveAesCipher(encryptionKey) : null,
      );

      _singleton = CacheManagerImpl._();
    }

    return _singleton!;
  }

  @override
  Future<void> clearAll() async {
    if (_box.isOpen) {
      await _box.clear();
    }
  }

  @override
  Future<void> delete(String key) async {
    if (_box.isOpen) {
      await _box.delete(key);
    }
  }

  @override
  dynamic read(String key) {
    return _box.isOpen ? _box.get(key) : null;
  }

  @override
  Future<void>? write(String key, dynamic value) {
    return _box.isOpen ? _box.put(key, value) : null;
  }

  @override
  Future<void> close() async {
    if (_box.isOpen) {
      await _box.close();
    }
  }

  @override
  Future<void> compact() async {
    if (_box.isOpen) {
      await _box.compact();
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<bool> store(StorageKey key, String data);

  String? read(StorageKey key);

  Future<bool> remove(StorageKey key);

  Future<bool> update(StorageKey key, String data);

}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences db;

  LocalDataSourceImpl({required this.db});

  static Future<SharedPreferences> get init async {
    return SharedPreferences.getInstance();
  }

  @override
  String? read(StorageKey key) {
    return db.getString(key.name);
  }

  @override
  Future<bool> remove(key) {
    return db.remove(key.name);
  }

  @override
  Future<bool> store(StorageKey key, String data) {
    return db.setString(key.name, data);
  }

  @override
  Future<bool> update(StorageKey key, String data) {
    return db.setString(key.name, data);
  }

  // Add the following method to ensure the SharedPreferences is initialized before reading data
  Future<void> ensureInitialized() async {
    if (!db.containsKey(StorageKey.todos.name)) {
      await store(StorageKey.todos, "[]");
    }
  }
}

enum StorageKey { todos }

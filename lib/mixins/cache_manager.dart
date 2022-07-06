import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

mixin CacheManager {
  Future<void> saveToken(String? token) async {
    try {
      log(token.toString(), name: 'token');
      final storage = new FlutterSecureStorage();
      return await storage.write(key: CacheManagerKey.TOKEN.name.toString(), value: token);
    } catch (e) {
      log(e.toString(), name: 'saveToken');
    }
  }

  Future<String?> getToken() async {
    try {
      final storage = new FlutterSecureStorage();

      return await storage.read(key: CacheManagerKey.TOKEN.name.toString());
    } catch (e) {
      log(e.toString(), name: 'saveToken');
    }
    return null;
  }

  Future<void> removeToken() async {
    final storage = new FlutterSecureStorage();
    return await storage.delete(key: CacheManagerKey.TOKEN.name.toString());
  }
}

enum CacheManagerKey { TOKEN, USER }

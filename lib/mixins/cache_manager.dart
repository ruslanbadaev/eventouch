import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pres7t/models/user.dart';

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
      log(await storage.read(key: CacheManagerKey.TOKEN.name.toString()).toString(), name: 'token');

      return await storage.read(key: CacheManagerKey.TOKEN.name.toString());
    } catch (e) {
      log(e.toString(), name: 'saveToken');
    }
  }

  Future<void> removeToken() async {
    final storage = new FlutterSecureStorage();
    return await storage.delete(key: CacheManagerKey.TOKEN.name.toString());
  }

  Future<bool> saveUser(UserModel user) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.USER.name.toString(), user);
    return true;
  }
}

enum CacheManagerKey { TOKEN, USER }

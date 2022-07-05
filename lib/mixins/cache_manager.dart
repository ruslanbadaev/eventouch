import 'package:get_storage/get_storage.dart';
import 'package:pres7t/models/user.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.name.toString(), token);
    box.save();
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.name.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.name.toString());
  }

  Future<bool> saveUser(UserModel user) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.USER.name.toString(), user);
    return true;
  }
}

enum CacheManagerKey { TOKEN, USER }

import 'dart:developer';

import 'package:get/get.dart';
import 'package:pres7t/models/user.dart';

import '../mixins/cache_manager.dart';

class SessionController extends GetxController with CacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
    UserModel.removeCurrentUser();
  }

  void login(String? token) async {
    isLogged.value = true;
    await saveToken(token);
  }

  Future<bool> checkLogged() async {
    final token = await getToken();
    log(token.toString(), name: 'token');
    if (token != null) {
      isLogged.value = true;

      return true;
    } else {
      return false;
    }
  }
}

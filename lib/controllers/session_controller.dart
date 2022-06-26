import 'package:get/get.dart';

import '../mixins/cache_manager.dart';

class SessionController extends GetxController with CacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogged.value = true;
    await saveToken(token);
  }

  bool checkLogged() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;

      return true;
    } else {
      return false;
    }
  }
}

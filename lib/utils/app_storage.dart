import 'package:get_storage/get_storage.dart';

import '../mixins/cache_manager.dart';
import '../models/user.dart';

class AppStorage {
  static UserModel getCurrentUserData() {
    return GetStorage().read(CacheManagerKey.USER.toString()) ??
        UserModel(
          id: '0',
          name: '--',
          email: '--',
          role: '--',
        );
  }
}

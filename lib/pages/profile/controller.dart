import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pres7t/models/user.dart';

import '../../mixins/cache_manager.dart';
import '../../models/profile.dart';

class ProfileController extends GetxController {
  Map<String, dynamic> profileJson = {
    "id": "1",
    "name": "1",
    "email": "1",
    "avatarUrl": "1",
  };

  ProfileModel? _profileData;

  @override
  void onInit() {
    super.onInit();
  }

  ProfileModel? get profileData => _profileData;

  fetchProfileData() {
    _profileData = ProfileModel.fromJson(profileJson);
  }

  UserModel getUserData() {
    return GetStorage().read(CacheManagerKey.USER.toString()) ??
        UserModel(
          id: '0',
          name: '--',
          email: '--',
          role: '--',
        );
  }

  void updateProfile() {}
}

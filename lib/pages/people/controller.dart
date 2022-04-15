import '../../models/people.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class PeopleController extends GetxController {
  UserModel? _selectedUser;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  UserModel? get selectedUser => _selectedUser;

  void selectUser(UserModel user) {
    _selectedUser = user;
    nameController.text = user.name;
    emailController.text = user.email;
    update();
  }

  void changeUserRole(String role) {
    _selectedUser?.role = role;
    print(selectedUser!.role.toString());
    print(selectedUser.toString());
    update();
  }

  void saveUserData() {
    // set data to server
  }
}

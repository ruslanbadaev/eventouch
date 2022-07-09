import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../models/user.dart';
import '../../utils/event_type.dart';

class CreateEventController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutEventController = TextEditingController();
  TextEditingController aboutYouController = TextEditingController();
  TextEditingController aboutLocationController = TextEditingController();
  TextEditingController dateTimeController = TextEditingController();
  EventType _selectedEventType = EventType.tourist;

  bool _isLoading = false;
  UserModel? _currentUser;

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  UserModel? get currentUser => _currentUser;

  void getUserData() async {
    _currentUser = await UserModel.getCurrentUser();
    update();
  }

  bool get isLoading => this._isLoading;
  EventType get selectedEventType => this._selectedEventType;

  void selectEventType(EventType type) {
    _selectedEventType = type;
    update();
  }

  Future<void> createEvent() async {
    //   try {
    //     _isLoading = true;
    //     update();
    //     ResponseModel<UserModel> result = await NetworkController().login();
    //     if (result.response != null) {
    //     } else if (result.error?.messages?.first != null) {
    //       throw result.error?.messages?.first;
    //     } else if (result.error == null) {
    //       throw 'UNKNOWN_ERROR';
    //     } else {
    //       throw result.error.toString();
    //     }

    //     update();
    //   } catch (e) {
    //     print(e);

    //     AppDialog.getErrorDialog(
    //       e.toString(),
    //     );

    //     _isLoading = false;
    //     update();
    //   }
  }
}

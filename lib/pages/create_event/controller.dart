import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../utils/event_type.dart';

class CreateEventController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutEventController = TextEditingController();
  TextEditingController aboutYouController = TextEditingController();
  TextEditingController aboutLocationController = TextEditingController();
  EventType _selectedEventType = EventType.tourist;

  @override
  void onInit() {
    super.onInit();
  }

  EventType get selectedEventType => this._selectedEventType;

  void selectEventType(EventType type) {
    _selectedEventType = type;
    update();
  }
}

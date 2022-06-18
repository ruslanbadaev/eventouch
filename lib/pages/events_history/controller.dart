import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../controllers/network_controller.dart';
import '../../models/event.dart';
import '../../models/response.dart';

class EventsHistoryScreenController extends GetxController {
  bool _isLoading = false;
  List<EventModel> events = [];

  bool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    getEventsHistory();
  }

  Future<void> getEventsHistory() async {
    try {
      _isLoading = true;
      update();
      ResponseModel<List<EventModel>> result = await NetworkController.getEvents();
      if (result.error == null) {
        events = result.response!;
      }
      _isLoading = false;
      update();
    } catch (e) {
      print(e);

      _isLoading = false;
      update();
    }
  }
}

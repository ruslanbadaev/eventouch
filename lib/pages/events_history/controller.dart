import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../controllers/network_controller.dart';
import '../../models/event.dart';
import '../../models/response.dart';

class EventsHistoryScreenController extends GetxController {
  List<EventModel> events = [];

  @override
  void onInit() {
    super.onInit();
    getEventsHistory();
  }

  Future<void> getEventsHistory() async {
    ResponseModel<List<EventModel>> result = await NetworkController.getEvents();
    if (result.error == null) {
      events = result.response!;
    }
    update();
  }
}

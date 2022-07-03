import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../controllers/network_controller.dart';
import '../../models/event.dart';
import '../../models/response.dart';
import '../../utils/app_dialog.dart';

enum EventStatus { visited, created }

class EventsHistoryScreenController extends GetxController {
  bool _isLoading = false;
  EventStatus _selectedStatusTab = EventStatus.visited;
  List<EventModel> events = [];

  bool get isLoading => _isLoading;
  EventStatus get selectedStatusTab => _selectedStatusTab;

  @override
  void onInit() {
    super.onInit();
    getEventsHistory();
  }

  void changeTab(EventStatus tab) {
    _selectedStatusTab = tab;
    update();
  }

  Future<void> getEventsHistory() async {
    try {
      _isLoading = true;
      update();
      ResponseModel<List<EventModel>> result = await NetworkController().getEventsHistory(status: _selectedStatusTab);
      if (result.error == null) {
        events = result.response!;
      } else {
        AppDialog.getErrorDialog(
          result.error!.message ?? 'Oops! Unknown error. Please try again later.',
        );
      }
      _isLoading = false;
      update();
    } catch (e) {
      print(e);
      AppDialog.getErrorDialog(
        'Oops! Unknown error. Please try again later.',
        details: e.toString(),
      );
      _isLoading = false;
      update();
    }
  }
}

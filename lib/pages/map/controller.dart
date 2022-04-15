import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:latlong2/latlong.dart';

import '../../models/event_marker.dart';

class MapScreenController extends GetxController {
  List<EventMarkerModel> events = [];
  @override
  void onInit() {
    super.onInit();
    fetchEvents(LatLng(51.521, -0.083));
  }

  List<EventMarkerModel> fetchEvents(LatLng center) {
    List<EventMarkerModel> events = [];
    List<Map<String, dynamic>> jsonData = [
      {
        "id": "1",
        "title": "Title Example",
        "lat": "51.52",
        "lng": "-0.093",
        "type": "tourist",
      },
      {
        "id": "2",
        "title": "Title Example",
        "lat": "51.521",
        "lng": "-0.083",
        "type": "extravert",
      },
      {
        "id": "3",
        "title": "Title Example",
        "lat": "51.526",
        "lng": "-0.088",
        "type": "nurd",
      },
      {
        "id": "4",
        "title": "Title Example",
        "lat": "51.511",
        "lng": "-0.086",
        "type": "politic",
      },
      {
        "id": "5",
        "title": "Title Example",
        "lat": "51.516",
        "lng": "-0.08",
        "type": "nurd",
      },
      {
        "id": "6",
        "title": "Title Example",
        "lat": "51.526",
        "lng": "-0.07",
        "type": "extravert",
      },
    ];

    for (Map<String, dynamic> event in jsonData) events.add(EventMarkerModel.fromJson(event));

    return [];
  }
}

import 'package:latlong2/latlong.dart';

import '../utils/event_type.dart';

class EventMarkerModel {
  final String id;
  final String title;
  final LatLng latLng;
  final EventType eventType;

  EventMarkerModel({
    required this.id,
    required this.title,
    required this.latLng,
    required this.eventType,
  });

  factory EventMarkerModel.fromJson(Map<String, dynamic> json) {
    return EventMarkerModel(
      id: json['id'],
      title: json['title'],
      latLng: LatLng(double.parse(json['lat']), double.parse(json['lng'])),
      eventType: getEventTypeFromString(json['type']),
    );
  }
}

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
  static List<EventMarkerModel> listFromJson(List<dynamic> list) {
    return list.map((json) => EventMarkerModel.fromJson(json)).toList();
  }

  factory EventMarkerModel.fromJson(Map<String, dynamic> json) {
    return EventMarkerModel(
      id: json['_id'],
      title: json['title'],
      latLng: LatLng(json['location']['lat'], json['location']['lng']),
      eventType: getEventTypeFromString(json['type']),
    );
  }
}

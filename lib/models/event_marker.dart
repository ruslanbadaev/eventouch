import 'package:latlong2/latlong.dart';

enum EventType { tourist, politic, extravert, nurd }

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
      eventType: _getEventType(json['type']),
    );
  }
}

EventType _getEventType(String type) {
  switch (type) {
    case 'tourist':
      return EventType.tourist;
    case 'politic':
      return EventType.politic;
    case 'extravert':
      return EventType.extravert;
    case 'nurd':
      return EventType.nurd;
    default:
      return EventType.tourist;
  }
}

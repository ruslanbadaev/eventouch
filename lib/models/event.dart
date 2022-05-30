import 'package:pres7t/models/event_marker.dart';

class EventModel {
  final String id;
  final EventType type;
  final String title;
  final String creator;
  final String aboutEvent;
  final String aboutYou;
  final int visitors;
  final String date;

  List<String>? images;

  EventModel({
    required this.id,
    required this.type,
    required this.title,
    required this.creator,
    required this.aboutEvent,
    required this.aboutYou,
    required this.visitors,
    required this.date,
    this.images,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      type: json['type'],
      title: json['title'],
      creator: json['creator'],
      aboutEvent: json['aboutEvent'],
      aboutYou: json['aboutYou'],
      visitors: json['visitors'],
      date: json['date'],
      images: json['images'],
    );
  }
}

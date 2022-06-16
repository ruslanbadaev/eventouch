import 'dart:developer';

import '../utils/event_type.dart';

class EventModel {
  final String id;
  final EventType type;
  final String title;
  final String creatorId;
  final String aboutEvent;
  final String aboutYou;
  final int visitors;
  final String date;
  final Map location;
  final String createdAt;
  final String updatedAt;

  List? images;

  EventModel({
    required this.id,
    required this.type,
    required this.title,
    required this.creatorId,
    required this.aboutEvent,
    required this.aboutYou,
    required this.visitors,
    required this.date,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    this.images,
  });
  static List<EventModel> listFromJson(List<dynamic> list) {
    return list.map((json) => EventModel.fromJson(json)).toList();
  }

  factory EventModel.fromJson(Map<String, dynamic> json) {
    try {
      log(json.toString());
      return EventModel(
        id: json['_id'],
        type: getEventTypeFromString(json['type']),
        title: json['title'],
        creatorId: json['creatorId'],
        aboutEvent: json['aboutEvent'],
        aboutYou: json['aboutYou'],
        visitors: json['visitors'],
        date: json['date'],
        location: json['location'],
        images: json['images'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );
    } catch (e) {
      print('----- ----- ------');
      print(e);
      return EventModel(
        id: json['_id'],
        type: getEventTypeFromString(json['type']),
        title: json['title'],
        creatorId: json['creatorId'],
        aboutEvent: json['aboutEvent'],
        aboutYou: json['aboutYou'],
        visitors: json['visitors'],
        date: json['date'],
        location: json['location'],
        images: json['images'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );
    }
  }
}

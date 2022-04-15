enum EventType { tourist, politic, extravert, nurd }

class EventModel {
  final String id;
  final String title;

  List<String>? images;

  EventModel({
    required this.id,
    required this.title,
    this.images,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      images: json['images'],
    );
  }
}

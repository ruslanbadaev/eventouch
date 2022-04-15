import 'image.dart';

class PostModel {
  final String id;
  final String title;
  final String introText;
  final String fullText;
  final String date;
  final int views;
  final String createdAt;
  final String updatedAt;
  final List<ImageModel> images;

  PostModel({
    required this.id,
    required this.title,
    required this.introText,
    required this.fullText,
    required this.date,
    required this.views,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  static List<PostModel> listFromJson(List<dynamic> list) {
    return list.map((json) => PostModel.fromJson(json)).toList();
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['_id'],
      title: json['title'],
      introText: json['introText'],
      fullText: json['fullText'],
      date: json['date'].toString(),
      views: json['views'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      images: json['images'] != null ? ImageModel.listFromJson(json['images']) : [],
    );
  }
}

class ItemModel {
  final String id;
  final String title;
  final String body;
  List<String>? images;

  ItemModel({
    required this.id,
    required this.title,
    required this.body,
    this.images,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      images: json['images'],
    );
  }
}

class ImageModel {
  final String filename;
  final String path;
  final int size;

  ImageModel({
    required this.filename,
    required this.path,
    required this.size,
  });

  static List<ImageModel> listFromJson(List<dynamic> list) {
    return list.map((json) => ImageModel.fromJson(json)).toList();
  }

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      filename: json['filename'],
      path: json['path'],
      size: json['size'],
    );
  }

  static Map toJson(ImageModel image) {
    return {
      'filename': image.filename,
      'path': image.path,
      'size': image.size,
    };
  }
}

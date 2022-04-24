class ProfileModel {
  final String id;
  final String name;
  final String email;
  final String? avatarUrl;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatarUrl: json['avatarUrl'],
    );
  }
}

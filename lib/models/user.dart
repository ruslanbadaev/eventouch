import 'dart:developer';

class UserModel {
  final String id;
  String name;
  String email;
  String role;
  String? description;
  bool? verified;
  String? avatar;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.description,
    this.verified,
    this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    try {
      return UserModel(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        role: json['role'],
        description: json['description'],
        verified: json['verified'],
        avatar: json['avatar'],
      );
    } catch (e) {
      log(e.toString());
      return UserModel(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        role: json['role'],
        description: json['description'],
        verified: json['verified'],
        avatar: json['avatar'],
      );
    }
  }
}

import 'dart:developer';

class UserModel {
  final String id;
  String name;
  String email;
  String role;
  bool? verified;
  String? avatar;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.verified,
    this.avatar,
  });

  //   "user": {
  //     "_id": "62aee2c3b1be2118ffd1a809",
  //     "name": "Tolik Test",
  //     "email": "test@gmail.com",
  //     "role": "user",
  //     "verified": false,
  //     "verification": "27da77a9-7bd6-40d5-a892-84a9ca56d73b"
  // }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    try {
      return UserModel(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        role: json['role'],
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
        verified: json['verified'],
        avatar: json['avatar'],
      );
    }
  }
}

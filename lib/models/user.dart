import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

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

  static void saveCurrentUser({
    required String id,
    required String name,
    required String email,
    required String role,
    String? description,
    bool? verified,
    String? avatar,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('id', id);
      await prefs.setString('name', name);
      await prefs.setString('email', email);
      await prefs.setString('role', role);
      if (description != null) await prefs.setString('description', description);
      if (verified != null) await prefs.setBool('verified', verified);
      if (avatar != null) await prefs.setString('avatar', avatar);
    } catch (e) {
      log(e.toString(), name: 'saveCurrentUser');
    }
  }

  static void removeCurrentUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('id');
      await prefs.remove('name');
      await prefs.remove('email');
      await prefs.remove('role');
      await prefs.remove('description');
      await prefs.remove('verified');
      await prefs.remove('avatar');
    } catch (e) {
      log(e.toString(), name: 'saveCurrentUser');
    }
  }

  static Future<UserModel?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? id = await prefs.getString('id');
    String? name = await prefs.getString('name');
    String? email = await prefs.getString('email');
    String? role = await prefs.getString('role');
    if (id == null || name == null || email == null || role == null) {
      return null;
    } else {
      return UserModel(
        id: await prefs.getString('id')!,
        name: await prefs.getString('name')!,
        email: await prefs.getString('email')!,
        role: await prefs.getString('role')!,
        description: await prefs.getString('description'),
        verified: await prefs.getBool('verified'),
        avatar: await prefs.getString('avatar'),
      );
    }
  }
}

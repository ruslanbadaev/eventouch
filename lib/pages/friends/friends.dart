import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/event_marker.dart';
import '../../models/people.dart';
import 'controller.dart';
import 'widgets/friend_item.dart';

class FriendsScreen extends StatefulWidget {
  FriendsScreen({Key? key}) : super(key: key);

  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> with TickerProviderStateMixin {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  List<UserModel> users = [
    UserModel(
      id: "6208ed5b8afbec974dc782f4",
      name: 'Ivan Ivanov',
      email: 'Ivanov-ivan@gmail.com',
      role: 'student',
    ),
    UserModel(
      id: "6208ed5b8afbec974dc782f4",
      name: 'Petr Antonov',
      email: 'Ivanov-ivan@gmail.com',
      role: 'student',
    ),
    UserModel(
      id: "6208ed5b8afbec974dc782f4",
      name: 'Admin Petrovich',
      email: 'Ivanov-ivan@gmail.com',
      role: 'student',
    ),
    UserModel(
      id: "6208ed5b8afbec974dc782f4",
      name: 'Simple Student',
      email: 'Ivanov-ivan@gmail.com',
      role: 'student',
    ),
  ];

  initState() {
    super.initState();
  }

  int? x;
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<FriendsScreenController>(
      init: FriendsScreenController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                for (UserModel user in users)
                  FriendItem(
                    id: user.id,
                    title: user.name,
                    eventType: EventType.nurd,
                    onPressed: () => {},
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}

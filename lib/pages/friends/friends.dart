import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pres7t/pages/profile/profile.dart';

import '../../models/user.dart';
import '../../widgets/user_item.dart';
import 'controller.dart';

class FriendsScreen extends StatefulWidget {
  FriendsScreen({Key? key}) : super(key: key);

  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> with TickerProviderStateMixin {
  List<UserModel> users = [
    UserModel(
      id: "6208ed5b8afbec974dc782f4",
      name: 'Ivan Ivanov',
      email: 'Ivanov-ivan@gmail.com',
      role: 'Master',
    ),
    UserModel(
      id: "6208ed5b8afbec974dc782f4",
      name: 'Petr Antonov',
      email: 'Ivanov-ivan@gmail.com',
      role: 'Junior',
    ),
    UserModel(
      id: "6208ed5b8afbec974dc782f4",
      name: 'Admin Petrovich',
      email: 'Ivanov-ivan@gmail.com',
      role: 'Middle',
    ),
    UserModel(
      id: "6208ed5b8afbec974dc782f4",
      name: 'Simple Bob',
      email: 'Ivanov-ivan@gmail.com',
      role: 'King of the Party',
    ),
  ];

  initState() {
    super.initState();
  }

  int? x;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FriendsScreenController>(
      init: FriendsScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                for (UserModel user in users)
                  UserItemWidget(
                    title: user.name,
                    subtitle: user.role,
                    color: AdaptiveTheme.of(context).theme.cardColor,
                    onPressed: () => {
                      Get.to(
                        () => ProfileScreen(
                          id: 'xxx',
                        ),
                        transition: Transition.size,
                      ),
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

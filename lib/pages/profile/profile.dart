import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pres7t/widgets/single_line_tile.dart';

import '../../utils/constants/colors.dart';
import 'controller.dart';
import '../../widgets/editible_field.dart';

class ProfileScreen extends StatefulWidget {
  String id;
  ProfileScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AdaptiveTheme.of(context).theme.primaryColor,
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        color: AppColors.PINK,
                        size: 36,
                      ),
                      onPressed: () => {Get.back()},
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: CircleAvatar(
                        radius: 64,
                        backgroundColor: AppColors.BLUE,
                        backgroundImage: NetworkImage(
                          'https://yt3.ggpht.com/a/AATXAJxQ-ZsPQu79yvh7ybjxkbu_R75dPcX-uuBEbw=s900-c-k-c0xffffffff-no-rj-mo',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.share_rounded,
                        color: AppColors.BLUE,
                        size: 28,
                      ),
                      onPressed: () => {Get.back()},
                    ),
                  ],
                ),
                SizedBox(height: 28),
                EditebleField(
                  title: 'About you:',
                  subtitle:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                ),
                SingleLineTile(
                  id: '1',
                  title: 'Events created:',
                  subtitle: '4',
                ),
                SingleLineTile(
                  id: '1',
                  title: 'Events attended:',
                  subtitle: '12',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

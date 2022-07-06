import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';
import '../../widgets/editible_field.dart';
import '../../widgets/single_line_tile.dart';
import '../../widgets/unauth_widget.dart';
import 'controller.dart';

class ProfileScreen extends StatefulWidget {
  String? id;
  Function? onClose;
  ProfileScreen({
    Key? key,
    this.id,
    this.onClose,
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
          body: controller.currentUser == null
              ? UnauthWidget(onPressed: () => {controller.getUserData()})
              : SafeArea(
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
                            onPressed: () => {
                              Get.back(),
                              (widget.onClose ?? () => {})(),
                            },
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
                        title: controller.currentUser?.name ?? '',
                        subtitle: controller.currentUser?.description ?? '',
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

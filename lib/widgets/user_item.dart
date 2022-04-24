import 'package:eventouch/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import 'user_avatar.dart';

class UserItemWidget extends StatelessWidget {
  String title;
  String subtitle;
  String? imageUrl;
  Color color;
  List<BoxShadow>? shadow;

  UserItemWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.imageUrl,
    required this.color,
    required this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      margin: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        boxShadow: shadow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: UserAvatarWidget(
          name: '   -',
        ),
        // child: ListTile(
        //   leading: UserAvatarWidget(
        //     name: title,
        //     imageUrl: imageUrl,
        //     color: AppColors.PURPLE,
        //   ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.PRIMARY,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.PRIMARY,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

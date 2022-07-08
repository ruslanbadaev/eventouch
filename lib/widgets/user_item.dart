import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import 'user_avatar.dart';

class UserItemWidget extends StatelessWidget {
  String title;
  String subtitle;
  String? imageUrl;
  Color? color;
  Color? overlayColor;
  Color? textColor;
  List<BoxShadow>? shadow;
  Function? onPressed;

  UserItemWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.imageUrl,
    this.color,
    this.overlayColor,
    this.textColor,
    this.shadow,
    this.onPressed,
  }) : super(key: key);

  List<BoxShadow> _defaultShadow = [
    BoxShadow(
      color: AppColors.PRIMARY!.withOpacity(0.1),
      spreadRadius: 1,
      blurRadius: .3,
      offset: Offset(2, 2),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      overlayColor: MaterialStateProperty.all(overlayColor ?? AppColors.PURPLE),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        margin: EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color ?? AppColors.WHITE,
          boxShadow: shadow ?? _defaultShadow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: UserAvatarWidget(
            name: title,
            imageUrl: imageUrl,
          ),
          title: Text(
            title,
            style: AdaptiveTheme.of(context).theme.textTheme.bodyText1!.copyWith(color: textColor),
          ),
          subtitle: Text(
            subtitle,
            style: AdaptiveTheme.of(context).theme.textTheme.bodyText2!.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}

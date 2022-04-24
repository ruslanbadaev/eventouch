import 'package:eventouch/utils/constants/colors.dart';
import 'package:eventouch/utils/constants/strings.dart';
import 'package:eventouch/widgets/subtitle.dart';
import 'package:flutter/material.dart';

class UserAvatarWidget extends StatelessWidget {
  String? name;
  String? imageUrl;
  double? radius;
  Color? color;

  UserAvatarWidget({
    Key? key,
    this.name,
    this.imageUrl,
    this.radius,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        decoration: BoxDecoration(
          gradient: color == null ? AppColors.PRIMARY_GRADIENT : null,
          color: color,
        ),
        width: radius ?? 56,
        height: radius ?? 56,
        child: _circleWidget(name, imageUrl),
      ),
    );
  }

  Widget _circleWidget(String? name, String? imageUrl) {
    if (imageUrl != null) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
      );
    } else if (name != null) {
      return Center(
          child: SubtitleWidget(
        title: AppStrings.getInitials(name),
      ));
    } else {
      return Icon(
        Icons.emoji_people_rounded,
        color: AppColors.PRIMARY,
      );
    }
  }
}

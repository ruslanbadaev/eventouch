import 'package:flutter/material.dart';

import '../../models/event_marker.dart';
import 'colors.dart';

class AppIcons {
  static Widget getAvatar(
    EventType eventType, {
    double? radius,
    double? borderSize,
    Color? borderColor,
  }) {
    Widget? _avatarContent;
    Color? _avatarColor = AppColors.SECONDARY;

    switch (eventType) {
      case EventType.tourist:
        _avatarContent = Icon(
          Icons.pedal_bike_rounded,
          color: AppColors.BLACK,
        );
        _avatarColor = AppColors.BLUE;
        break;
      case EventType.politic:
        _avatarContent = Icon(
          Icons.flag_rounded,
          color: AppColors.BLACK,
        );
        _avatarColor = AppColors.PINK;
        break;
      case EventType.extravert:
        _avatarContent = Icon(
          Icons.skateboarding_rounded,
          color: AppColors.BLACK,
        );
        _avatarColor = AppColors.PURPLE;
        break;
      case EventType.nurd:
        _avatarContent = Icon(
          Icons.computer_rounded,
          color: AppColors.BLACK,
        );
        _avatarColor = AppColors.ORANGE;
        break;
      default:
    }

    if (radius != null) {
      borderSize = radius + (borderSize ?? 0);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: borderColor,
          radius: borderSize ?? radius,
          child: CircleAvatar(
            backgroundColor: _avatarColor,
            child: _avatarContent,
            maxRadius: radius,
          ),
        ),
      ],
    );
  }
}

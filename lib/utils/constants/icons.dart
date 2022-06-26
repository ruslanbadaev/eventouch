import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/create_event/create_event.dart';
import '../event_type.dart';
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

  static Widget getFilterIcon(
    BuildContext context, {
    EventType? eventType,
    EventType? selectedEventFilter,
    required Function(EventType) onPressed,
  }) {
    Widget? _avatarContent;
    Color? _avatarColor = AppColors.SECONDARY;
    String title = '';
    switch (eventType) {
      case EventType.tourist:
        _avatarContent = Icon(
          Icons.pedal_bike_rounded,
          color: AppColors.BLACK,
        );
        title = 'Tourists';
        _avatarColor = AppColors.BLUE;
        break;
      case EventType.politic:
        _avatarContent = Icon(
          Icons.flag_rounded,
          color: AppColors.BLACK,
        );
        _avatarColor = AppColors.PINK;
        title = 'Politics';
        break;
      case EventType.extravert:
        _avatarContent = Icon(
          Icons.skateboarding_rounded,
          color: AppColors.BLACK,
        );
        _avatarColor = AppColors.PURPLE;
        title = 'Extraverts';
        break;
      case EventType.nurd:
        _avatarContent = Icon(
          Icons.computer_rounded,
          color: AppColors.BLACK,
        );
        _avatarColor = AppColors.ORANGE;
        title = 'Nurds';
        break;
      default:
        _avatarContent = Icon(
          Icons.add_rounded,
          color: AdaptiveTheme.of(context).theme.textTheme.bodyText1!.color,
        );
        _avatarColor = AdaptiveTheme.of(context).theme.primaryColor;
        title = 'Create celebration';
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 12,
      ),
      child: FloatingActionButton.extended(
        backgroundColor: _avatarColor!.withOpacity(
            (selectedEventFilter == eventType || selectedEventFilter == null || eventType == null) ? 1 : .5),
        onPressed: () => eventType == null
            ? Get.to(
                () => CreateEventScreen(),
                transition: Transition.upToDown,
              )
            : onPressed(eventType),
        icon: _avatarContent,
        label: Text(
          title,
          style: AdaptiveTheme.of(context).theme.textTheme.bodyText1!.copyWith(
                color: eventType == null ? null : AppColors.PRIMARY,
              ),
        ),
      ),
    );
  }
}

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../../../models/event_marker.dart';
import '../../../utils/constants/colors.dart';

// ignore: must_be_immutable
class CloudMarker extends StatefulWidget {
  String id;
  String title;
  bool isLeftSide;
  EventType eventType;
  Function onPressed;

  CloudMarker({
    Key? key,
    required this.id,
    required this.title,
    required this.eventType,
    this.isLeftSide = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CloudMarker> createState() => _CloudMarkerWidgetState();
}

class _CloudMarkerWidgetState extends State<CloudMarker> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        widget.onPressed(),
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: AdaptiveTheme.of(context).theme.primaryColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.PRIMARY!.withOpacity(.7),
              offset: Offset(2, 3),
              blurRadius: 5.0,
              spreadRadius: .4,
            ),
          ],
        ),
        child: Row(
          children: [
            if (widget.isLeftSide)
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: _getAvatar(widget.eventType),
              ),
            Expanded(
              child: Text(
                widget.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AdaptiveTheme.of(context).theme.textTheme.bodyText1,
                textAlign: widget.isLeftSide ? TextAlign.left : TextAlign.right,
              ),
            ),
            if (!widget.isLeftSide)
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: _getAvatar(widget.eventType),
              ),
          ],
        ),
      ),
    );
  }

  Widget _getAvatar(EventType eventType) {
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

    return CircleAvatar(backgroundColor: _avatarColor, child: _avatarContent);
  }
}

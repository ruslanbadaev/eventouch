import 'package:eventouch/models/event_marker.dart';
import 'package:flutter/material.dart';

import '../../../models/event.dart';
import '../../../utils/constants/colors.dart';

// ignore: must_be_immutable
class CloudMarker extends StatefulWidget {
  String id;
  String title;

  EventType eventType;
  Function onPressed;

  CloudMarker({
    Key? key,
    required this.id,
    required this.title,
    required this.eventType,
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
            color: AppColors.WHITE,
            boxShadow: [BoxShadow(color: AppColors.WHITE, offset: Offset(0, -5), blurRadius: 10.0)]),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: _getAvatar(widget.eventType),
            ),
            Expanded(
              child: Text(
                widget.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getAvatar(EventType eventType) {
    Widget? _avatarContent;
    Color? _avatarColor = AppColors.SECONDARY;

    switch (eventType) {
      case EventType.tourist:
        _avatarContent = Icon(
          Icons.computer_rounded,
          color: AppColors.BLACK,
        );
        _avatarColor = AppColors.BLUE;
        break;
      case EventType.politic:
        _avatarContent = Icon(
          Icons.pedal_bike_rounded,
          color: AppColors.BLACK,
        );
        _avatarColor = AppColors.PINK;
        break;
      case EventType.extravert:
        _avatarContent = Icon(
          Icons.music_note_rounded,
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

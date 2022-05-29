import 'package:flutter/material.dart';

import '../../../models/event_marker.dart';
import '../../../utils/constants/colors.dart';

// ignore: must_be_immutable
class EventItemWidget extends StatefulWidget {
  String id;
  String title;
  String date;
  String? image;

  EventType eventType;
  Function onPressed;

  EventItemWidget({
    Key? key,
    required this.id,
    required this.title,
    required this.date,
    required this.eventType,
    this.image,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<EventItemWidget> createState() => _EventItemWidgetState();
}

class _EventItemWidgetState extends State<EventItemWidget> {
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
      overlayColor: MaterialStateProperty.all(AppColors.PURPLE),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        margin: EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.WHITE,
              AppColors.WHITE,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.PRIMARY!.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: .3,
              offset: Offset(2, 2),
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Container(
              height: 240,
              width: double.infinity,
            ),
            ListTile(
              title: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.PRIMARY,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.PRIMARY,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_date.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/icons.dart';
import '../../../utils/event_type.dart';

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
  final _backgroundGradient = AppColors.getShuffledGradient();

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
          color: AdaptiveTheme.of(context).theme.cardColor,
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: _backgroundGradient,
                  ),
                  child: widget.image != null
                      ? Image.network(
                          widget.image!,
                          fit: BoxFit.fill,
                        )
                      : AppIcons.getAvatar(
                          widget.eventType,
                          radius: 36,
                          borderSize: 3,
                          borderColor: AdaptiveTheme.of(context).theme.primaryColor,
                        ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                widget.title,
                style: AdaptiveTheme.of(context).theme.textTheme.bodyText1,
              ),
              subtitle: Text(
                AppDate.getFormattedDateString(widget.date),
                style: AdaptiveTheme.of(context).theme.textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

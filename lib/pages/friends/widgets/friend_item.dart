import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/event_type.dart';

// ignore: must_be_immutable
class FriendItem extends StatefulWidget {
  String id;
  String title;

  EventType eventType;
  Function onPressed;

  FriendItem({
    Key? key,
    required this.id,
    required this.title,
    required this.eventType,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<FriendItem> createState() => _FriendItemWidgetState();
}

class _FriendItemWidgetState extends State<FriendItem> {
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
              // AppColors.ORANGE!.withOpacity(.6),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.PRIMARY!.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: .3,
              offset: Offset(2, 2), // changes position of shadow
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              width: 56,
              height: 56,
              child: Image.network(
                'https://i.pinimg.com/originals/64/cb/f6/64cbf6023a8576482f7782ce1d29cc01.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            'Till Lindenmann',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.PRIMARY,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            'Master',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.PRIMARY,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

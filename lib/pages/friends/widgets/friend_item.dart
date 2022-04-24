import 'package:flutter/material.dart';

import '../../../models/event_marker.dart';
import '../../../utils/constants/colors.dart';

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

  Widget _getAvatar(EventType eventType) {
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

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      margin: EdgeInsets.all(8),
      width: 300,
      // width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.ORANGE!,
            AppColors.ORANGE!,
            // AppColors.ORANGE!.withOpacity(.6),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.PRIMARY!.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: .3,
            offset: Offset(3, 3), // changes position of shadow
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
    );
  }
}

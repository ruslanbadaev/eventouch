import 'dart:math';

import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/strings.dart';

class UserWidget extends StatefulWidget {
  String id;
  String name;
  String email;
  String role;
  Function onPressed;
  double descriptionWidth;

  UserWidget({
    Key? key,
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.onPressed,
    required this.descriptionWidth,
  }) : super(key: key);

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPressed(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: CircleAvatar(
                    backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    radius: 36,
                    child: Text(
                      AppStrings.getInitials(widget.name),
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Container(
                  width: widget.descriptionWidth,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          color: AppColors.PRIMARY,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.email,
                        style: TextStyle(
                          color: AppColors.BLACK,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.role,
                        style: TextStyle(
                          color: AppColors.PRIMARY,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

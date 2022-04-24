import 'package:eventouch/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TextBoxWidget extends StatelessWidget {
  String title;
  String body;
  Color? color;
  List<BoxShadow>? shadow;

  TextBoxWidget({
    Key? key,
    required this.title,
    required this.body,
    this.color,
    required this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          margin: EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            color: color ?? AppColors.WHITE,
            boxShadow: shadow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.PRIMARY,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

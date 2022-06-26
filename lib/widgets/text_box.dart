import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';

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
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          margin: EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            color: color ?? AppColors.WHITE,
            boxShadow: shadow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            body,
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

import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';

class SubtitleWidget extends StatelessWidget {
  final String title;
  final Color? color;
  final TextAlign? textAlign;

  SubtitleWidget({
    required this.title,
    this.color,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
        color: color ?? AppColors.PRIMARY,
        fontWeight: FontWeight.w400,
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';

class SubtitleWidget extends StatelessWidget {
  final String title;
  final Color? color;

  SubtitleWidget({
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        color: color ?? AppColors.PRIMARY,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }
}

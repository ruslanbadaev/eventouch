import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final Color color;

  TitleWidget({
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        color: color,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }
}

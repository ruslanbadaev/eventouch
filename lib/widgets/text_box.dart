import 'package:adaptive_theme/adaptive_theme.dart';
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
    this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      // margin: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        // color: color ?? AppColors.WHITE,
        // boxShadow: shadow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: color,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 8),
          Text(
            body,
            style: TextStyle(
              fontSize: 14,
              color: AdaptiveTheme.of(context).theme.accentColor,
              wordSpacing: 1.4,
              fontWeight: FontWeight.w400,
            ),
            // textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

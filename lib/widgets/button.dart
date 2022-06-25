import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String? title;
  final Color? color;
  final Color? textColor;
  final TextAlign? textAlign;
  final Function onPressed;

  ButtonWidget({
    this.title,
    this.color,
    this.textColor,
    this.textAlign,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        backgroundColor: color ?? AppColors.PURPLE!.withOpacity(1),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
      ),
      onPressed: () {
        onPressed();
      },
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Text(
          title ?? 'Confirm',
          style: Theme.of(context).textTheme.headline2?.copyWith(
                color: textColor ?? AppColors.PRIMARY,
                fontSize: 24,
              ),
        ),
      ),
    );
  }
}

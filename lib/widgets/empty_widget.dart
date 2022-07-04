import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants/colors.dart';

class EmptyWidget extends StatelessWidget {
  final Function? onPressed;

  EmptyWidget({
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => {
          if (onPressed != null)
            {
              onPressed!(),
            }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.data_array_rounded,
              size: 50,
              color: AppColors.ORANGE,
            ),
            SizedBox(height: 4),
            Text(
              'No Data',
              style: AdaptiveTheme.of(context).theme.textTheme.headline2!.copyWith(
                    color: AppColors.ORANGE,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            if (onPressed != null)
              Text(
                'Tap to update',
                style: AdaptiveTheme.of(context).theme.textTheme.headline2!.copyWith(
                      color: AppColors.BLUE,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}

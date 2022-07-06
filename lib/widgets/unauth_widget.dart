import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/auth/auth.dart';
import '../pages/auth/widgets/auth_confirm_button.dart';
import '../utils/constants/colors.dart';

class UnauthWidget extends StatelessWidget {
  final Function? onPressed;

  UnauthWidget({
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.login_rounded,
            size: 64,
            color: AppColors.ORANGE,
          ),
          SizedBox(height: 18),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Authorization is required to continue',
              style: AdaptiveTheme.of(context).theme.textTheme.headline2!.copyWith(
                    color: AppColors.ORANGE,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: AuthConfirmWidget(
              confirmTitle: 'Go to login',
              onConfirm: () => Get.to(AuthScreen(
                onClose: onPressed,
              )),
              onBack: () => Get.back(),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () => {Get.off(AuthScreen())},
          //   style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
          //     return AppColors.BLUE;
          //   })),
          //   child: Text(
          //     'Go to login',
          //     style: AdaptiveTheme.of(context).theme.textTheme.headline2!.copyWith(
          //           color: AppColors.PRIMARY,
          //           fontSize: 18,
          //           fontWeight: FontWeight.w600,
          //         ),
          //   ),
          // ),
          // if (onPressed != null)
          //   ElevatedButton(
          //     onPressed: () => {Get.back()},
          //     style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
          //       return AppColors.PURPLE;
          //     })),
          //     child: Text(
          //       'Back',
          //       style: AdaptiveTheme.of(context).theme.textTheme.headline2!.copyWith(
          //             color: AppColors.PRIMARY,
          //             fontSize: 18,
          //             fontWeight: FontWeight.w600,
          //           ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}

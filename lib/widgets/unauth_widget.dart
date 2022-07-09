import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../pages/auth/auth.dart';
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
          Text(
            'This page is unavailable. Please log in.',
            // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AdaptiveTheme.of(context).theme.accentColor,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48),

          // Icon(
          //   Icons.login_rounded,
          //   size: 64,
          //   color: AppColors.ORANGE,
          // ),
          // SizedBox(height: 18),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16),
          //   child: Text(
          //     'Authorization is required to continue',
          //     style: AdaptiveTheme.of(context).theme.textTheme.headline2!.copyWith(
          //           color: AppColors.ORANGE,
          //           fontSize: 24,
          //           fontWeight: FontWeight.w600,
          //         ),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          Lottie.asset('assets/animations/login.json', height: 256),

          // SizedBox(height: 32),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  onPressed: () => Get.off(AuthScreen()),
                  child: Text(
                    'Go to login',
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: AppColors.PURPLE,
                          fontSize: 24,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
                TextButton(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  onPressed: () => Get.back(),
                  child: Text(
                    'Back',
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: AdaptiveTheme.of(context).theme.accentColor.withOpacity(1),
                          fontSize: 24,
                        ),
                  ),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16),
          //   child: AuthConfirmWidget(
          //     confirmTitle: 'Go to login',
          //     onConfirm: () => Get.to(AuthScreen(
          //       onClose: onPressed,
          //     )),
          //     onBack: () => Get.back(),
          //   ),
          // ),
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

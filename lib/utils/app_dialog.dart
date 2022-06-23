import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/colors.dart';

class AppDialog {
  static void getErrorDialog(
    String text, {
    String? details,
    String? eventText,
    Function? onEventPressed,
  }) {
    Get.defaultDialog(
      title: 'Error',
      titleStyle: TextStyle(color: AppColors.ORANGE),
      titlePadding: EdgeInsets.only(top: 24),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: AppColors.PRIMARY,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 18),
          Text(
            text,
            style: TextStyle(color: AppColors.WHITE),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Divider(color: AppColors.PINK!.withOpacity(.5)),
          Row(
            mainAxisAlignment: details == null ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Get.back(),
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
                  child: Text(
                    'Close',
                    style: TextStyle(color: AppColors.PINK),
                  ),
                ),
              ),
              if (details != null)
                InkWell(
                  onTap: () => {
                    Get.back(),
                    getErrorDetailsDialog(details),
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
                    child: Text(
                      'Details',
                      style: TextStyle(color: AppColors.BLUE),
                    ),
                  ),
                ),
              if (onEventPressed != null)
                InkWell(
                  onTap: () => {
                    onEventPressed(),
                    Get.back(),
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
                    child: Text(
                      eventText ?? 'Ok',
                      style: TextStyle(color: AppColors.BLUE),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      radius: 10.0,
    );
  }

  static void getErrorDetailsDialog(String text) {
    Get.defaultDialog(
      title: 'Error details',
      titleStyle: TextStyle(color: AppColors.ORANGE),
      titlePadding: EdgeInsets.only(top: 24),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: AppColors.PRIMARY,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 18),
          Text(
            text,
            style: TextStyle(color: AppColors.WHITE),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Divider(color: AppColors.PINK!.withOpacity(.5)),
          InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
              child: Text(
                'Close',
                style: TextStyle(color: AppColors.PINK),
              ),
            ),
          ),
        ],
      ),
      radius: 10.0,
    );
  }

  static void getSelectDialog({required String text, required Function onSuccess, Function? onCancel}) {
    Get.defaultDialog(
      title: 'Select',
      titleStyle: TextStyle(color: AppColors.ORANGE),
      titlePadding: EdgeInsets.only(top: 24),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: AppColors.PRIMARY,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 18),
          Text(
            text,
            style: TextStyle(
              color: AppColors.ORANGE,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Divider(color: AppColors.PINK!.withOpacity(.5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => (onCancel ?? Get.back)(),
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
                  child: Text(
                    'Close',
                    style: TextStyle(color: AppColors.PINK),
                  ),
                ),
              ),
              InkWell(
                onTap: () => onSuccess(),
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: AppColors.BLUE),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      radius: 10.0,
    );
  }

  static void getInfoDialog(String text) {
    Get.defaultDialog(
      title: 'Info',
      titleStyle: TextStyle(color: AppColors.ORANGE),
      titlePadding: EdgeInsets.only(top: 24),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: AppColors.PRIMARY,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 18),
          Text(
            text,
            style: TextStyle(
              color: AppColors.ORANGE,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Divider(color: AppColors.PINK!.withOpacity(.5)),
          InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
              child: Text(
                'Confirm',
                style: TextStyle(color: AppColors.BLUE),
              ),
            ),
          ),
        ],
      ),
      radius: 10.0,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pres7t/widgets/button.dart';

import '../../../utils/constants/colors.dart';
import '../controller.dart';
import 'auth_confirm_button.dart';

class AuthSuccessWidget extends StatefulWidget {
  Function onConfirm;

  AuthSuccessWidget({
    Key? key,
    required this.onConfirm,
  }) : super(key: key);

  @override
  _AuthSuccessWidgetState createState() => _AuthSuccessWidgetState();
}

class _AuthSuccessWidgetState extends State<AuthSuccessWidget> with TickerProviderStateMixin {
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthScreenController>(
      init: AuthScreenController(),
      builder: (controller) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 36),
          decoration: BoxDecoration(color: Colors.grey.shade200.withOpacity(0.5)),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Thanks for authorization',
                  style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w600, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 24,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 48.0,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Now ',
                        style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w400, fontSize: 24),
                      ),
                      TextSpan(
                        text: 'You',
                        style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w600, fontSize: 24),
                      ),
                      TextSpan(
                        text: ' can create events and register in them.',
                        style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w400, fontSize: 24),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                ButtonWidget(onPressed: () => widget.onConfirm()),
              ],
            ),
          ),
        );
      },
    );
  }
}

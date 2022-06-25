import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pres7t/utils/validator.dart';

import '../../../utils/app_dialog.dart';
import '../controller.dart';
import 'auth_confirm_button.dart';
import 'password_field.dart';

class SignInWidget extends StatefulWidget {
  Function onConfirm;
  Function onBack;
  SignInWidget({
    Key? key,
    required this.onConfirm,
    required this.onBack,
  }) : super(key: key);

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> with TickerProviderStateMixin {
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
                TextFormField(
                  controller: controller.emailController,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: "Email",
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    errorText: Validator.emailError(
                      controller.emailController.text,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                PasswordFieldWidget(
                  labelText: 'Password',
                  errorText: Validator.passwordError(
                    controller.passwordController.text,
                    controller.repeatPasswordController.text,
                  ),
                  controller: controller.passwordController,
                  onChanged: () => setState(() {}),
                ),
                SizedBox(
                  height: 24,
                ),
                AuthConfirmWidget(
                  onConfirm: () => {
                    if (Validator.loginDataError(
                          email: controller.emailController.text,
                          password: controller.passwordController.text,
                        ) ==
                        null)
                      {
                        widget.onConfirm(),
                      }
                    else
                      {
                        AppDialog.getErrorDialog(
                          Validator.loginDataError(
                            email: controller.emailController.text,
                            password: controller.passwordController.text,
                          )!,
                        ),
                      }
                  },
                  onBack: () => {
                    widget.onBack(),
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

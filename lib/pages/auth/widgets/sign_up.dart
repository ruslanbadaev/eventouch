import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pres7t/utils/validator.dart';

import '../../../utils/app_dialog.dart';
import '../controller.dart';
import 'auth_confirm_button.dart';
import 'password_field.dart';

class SignUpWidget extends StatefulWidget {
  Function onConfirm;
  Function onBack;
  SignUpWidget({
    Key? key,
    required this.onConfirm,
    required this.onBack,
  }) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> with TickerProviderStateMixin {
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: controller.nameController,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: "Name",
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      errorText: Validator.nameError(
                        controller.nameController.text,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
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
                  PasswordFieldWidget(
                    labelText: 'Repeat password',
                    errorText: Validator.passwordError(
                      controller.passwordController.text,
                      controller.repeatPasswordController.text,
                    ),
                    controller: controller.repeatPasswordController,
                    onChanged: () => setState(() {}),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  AuthConfirmWidget(
                    onConfirm: () => {
                      if (Validator.registrationDataError(
                            name: controller.nameController.text,
                            email: controller.emailController.text,
                            password1: controller.passwordController.text,
                            password2: controller.repeatPasswordController.text,
                          ) ==
                          null)
                        {
                          widget.onConfirm(),
                        }
                      else
                        {
                          AppDialog.getErrorDialog(
                            Validator.registrationDataError(
                              name: controller.nameController.text,
                              email: controller.emailController.text,
                              password1: controller.passwordController.text,
                              password2: controller.repeatPasswordController.text,
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
          ),
        );
      },
    );
  }
}

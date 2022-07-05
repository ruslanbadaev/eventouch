import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_dialog.dart';
import '../../../utils/validator.dart';
import '../../../widgets/custom_text_field.dart';
import '../controller.dart';
import 'auth_confirm_button.dart';

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
                  CustomTextFieldWidget(
                    label: 'Name',
                    controller: controller.nameController,
                    keyboardType: TextInputType.name,
                    onChanged: () => setState(() {}),
                    errorText: Validator.nameError(
                      controller.nameController.text,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomTextFieldWidget(
                    label: 'Email',
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: () => setState(() {}),
                    errorText: Validator.emailError(
                      controller.emailController.text,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomTextFieldWidget(
                    label: 'Password',
                    isPassword: true,
                    controller: controller.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: () => setState(() {}),
                    errorText: Validator.passwordError(
                      controller.passwordController.text,
                      controller.repeatPasswordController.text,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomTextFieldWidget(
                    label: 'Repeat password',
                    isPassword: true,
                    controller: controller.repeatPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: () => setState(() {}),
                    errorText: Validator.passwordError(
                      controller.passwordController.text,
                      controller.repeatPasswordController.text,
                    ),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();

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
                  controller: _nameController,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: "Name",
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _emailController,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: "Email",
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                PasswordFieldWidget(
                  labelText: 'Password',
                  controller: _passwordController,
                ),
                SizedBox(
                  height: 24,
                ),
                PasswordFieldWidget(
                  labelText: 'Repeat password',
                  controller: _repeatPasswordController,
                ),
                SizedBox(
                  height: 24,
                ),
                AuthConfirmWidget(
                  onConfirm: () => controller.setAuthScreenType(AuthScreenType.welcome),
                  onBack: () => {
                    print('onBack'),
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

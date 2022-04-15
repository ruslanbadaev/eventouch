import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../controller.dart';

class SignUpWidget extends StatefulWidget {
  SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> with TickerProviderStateMixin {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
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
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Введите логин",
                    fillColor: AppColors.BLACK.withOpacity(.12),
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
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Введите пароль",
                    fillColor: AppColors.BLACK.withOpacity(.12),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

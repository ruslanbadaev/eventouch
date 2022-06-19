import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/session_controller.dart';
import '../../../utils/constants/colors.dart';
import '../controller.dart';

class SignInWidget extends StatefulWidget {
  SignInWidget({Key? key}) : super(key: key);

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> with TickerProviderStateMixin {
  final SessionController sessionController = Get.find();

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
                  controller: controller.loginController,
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
                  controller: controller.passwordController,
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
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: AppColors.BLACK.withOpacity(.24),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
                        ),
                        onPressed: () {
                          controller.setAuthScreenType(AuthScreenType.welcome);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 18),
                          child: Text(
                            '<',
                            style: Theme.of(context).textTheme.headline2?.copyWith(
                                  color: AppColors.BLACK,
                                  fontSize: 24,
                                ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      flex: 4,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: AppColors.BLACK.withOpacity(.24),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
                        ),
                        onPressed: () {
                          controller.signIn(sessionController.login);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(18),
                          child: Text(
                            'Отправить',
                            style: Theme.of(context).textTheme.headline2?.copyWith(
                                  color: AppColors.BLACK,
                                  fontSize: 24,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

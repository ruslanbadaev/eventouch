import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pres7t/pages/auth/widgets/auth_success.dart';
import 'package:pres7t/pages/auth/widgets/sign_in.dart';

import '../../app.dart';
import '../../controllers/session_controller.dart';
import '../../utils/app_dialog.dart';
import '../../utils/constants/colors.dart';
import 'controller.dart';
import 'widgets/email_verification.dart';

import 'widgets/sign_up.dart';
import 'widgets/welcome.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  final _backgroundGradient = AppColors.getShuffledGradient();

  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;
    final SessionController sessionController = Get.put(SessionController());
    Widget _authWidget({
      required AuthScreenType authType,
      required AuthScreenController controller,
    }) {
      sessionController.checkLogged();
      if (authType == AuthScreenType.signIn) {
        return SignInWidget(
          onConfirm: () => controller.login(),
          onBack: () => controller.setAuthScreenType(AuthScreenType.welcome),
        );
      } else if (authType == AuthScreenType.signUp) {
        return SignUpWidget(
          onConfirm: () => controller.register(),
          onBack: () => controller.setAuthScreenType(AuthScreenType.welcome),
        );
      } else if (authType == AuthScreenType.emailVerification) {
        return EmailVerificationWidget(
          onConfirm: () => Get.close(2),
          onBack: () => {AppDialog.getInfoDialog('The confirmation code was sent again')},
        );
      } else if (authType == AuthScreenType.success) {
        return AuthSuccessWidget(
          onConfirm: () => Get.back(),
        );
      } else {
        return WelcomeWidget();
      }
    }

    return GetBuilder<AuthScreenController>(
      init: AuthScreenController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: _screenHeight,
                width: double.infinity,
                decoration: BoxDecoration(gradient: _backgroundGradient),
              ),
              Positioned(
                top: 36,
                left: 8,
                child: IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                    color: AppColors.PRIMARY,
                    size: 36,
                  ),
                  onPressed: () => {Get.close(2)},
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 146),
                  child: Column(
                    children: [
                      FadeInDown(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 48.0,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'PRES',
                                style: TextStyle(color: AppColors.WHITE.withOpacity(.7), fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                text: '7',
                                style: TextStyle(color: AppColors.WHITE, fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: 'T',
                                style: TextStyle(color: AppColors.WHITE.withOpacity(.7), fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FadeInUp(
                        child: Text(
                          _getSubtitle(controller.authType),
                          style: TextStyle(
                              color: AppColors.WHITE.withOpacity(.7), fontWeight: FontWeight.w400, fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FadeInUpBig(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(36),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: _authWidget(authType: controller.authType, controller: controller),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getSubtitle(AuthScreenType type) {
    switch (type) {
      case AuthScreenType.signUp:
        return 'Registration';
      case AuthScreenType.signIn:
        return 'Login';
      case AuthScreenType.emailVerification:
        return 'Verification';
      case AuthScreenType.welcome:
        return 'Welcome!';
      case AuthScreenType.success:
        return 'Success!';
      default:
        return '';
    }
  }
}

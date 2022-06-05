import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';
import 'controller.dart';
import 'widgets/sign_in.dart';
import 'widgets/welcome.dart';

class Auth extends StatefulWidget {
  Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> with TickerProviderStateMixin {
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: _screenHeight,
                width: double.infinity,
                color: AppColors.LIGHT_GREY,
                child: Image.network(
                  'https://vuzopedia.ru/storage/app/uploads/public/5f3/5a6/276/5f35a62764eac724678464.jpg',
                  color: Colors.white.withOpacity(1),
                  colorBlendMode: BlendMode.modulate,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: _authWidget(controller.authType),
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

  Widget _authWidget(
    AuthType authType,
  ) {
    if (authType == AuthType.signIn) {
      return SignInWidget();
    } else if (authType == AuthType.signUp) {
      return SignInWidget();
    } else {
      return WelcomeWidget();
    }
  }
}

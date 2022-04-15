import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../controllers/session_controller.dart';
import '../utils/constants/colors.dart';

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with TickerProviderStateMixin {
  final SessionController sessionController = Get.find();

  initState() {
    sessionController.checkAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: _screenHeight,
            width: double.infinity,
            color: AppColors.LIGHT_GREY,
            child: Image.network(
              '',
              color: Colors.white.withOpacity(1),
              colorBlendMode: BlendMode.modulate,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: SpinKitRipple(
                    color: Colors.white,
                    size: 250.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

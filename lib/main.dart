import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app.dart';
import 'controllers/session_controller.dart';
import 'pages/auth/auth.dart';
import 'pages/loading.dart';
import 'utils/constants/colors.dart';
import 'utils/constants/strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SessionController());

    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.APP_NAME_TITLE,
        theme: ThemeData(
          primarySwatch: AppColors.WHITE,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.comfortaaTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: GetBuilder<SessionController>(
          init: SessionController(),
          builder: (controller) {
            return App();
            // return _getAppScreen(controller.isAuth);
          },
        ),
      ),
    );
  }

  Widget _getAppScreen(bool? isAuth) {
    if (isAuth == null) {
      return Loading();
    } else if (isAuth) {
      return App();
    } else {
      return Auth();
    }
  }
}

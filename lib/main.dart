import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pres7t/utils/constants/colors.dart';

import 'app.dart';
import 'controllers/session_controller.dart';
import 'pages/auth/auth.dart';
import 'pages/loading.dart';
import 'utils/constants/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  late AdaptiveThemeMode? savedThemeMode;

  MyApp({
    this.savedThemeMode,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(SessionController());

    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => AdaptiveTheme(
        light: ThemeData(
          brightness: Brightness.light,
          primaryColor: AppColors.WHITE,
          accentColor: AppColors.PRIMARY,
          textTheme: TextTheme(
            headline1: TextStyle(
              color: AppColors.PRIMARY,
              fontSize: 24,
            ),
            bodyText1: TextStyle(
              color: AppColors.PRIMARY,
              fontWeight: FontWeight.w600,
            ),
            bodyText2: TextStyle(
              color: AppColors.PRIMARY_DARK,
            ),
          ),
          iconTheme: IconThemeData(color: AppColors.PRIMARY),
          backgroundColor: AppColors.WHITE,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.WHITE,
          ),
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: AppColors.WHITE,
          ),
          cardColor: AppColors.WHITE,
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColors.PRIMARY,
          accentColor: AppColors.WHITE,
          textTheme: TextTheme(
            headline1: TextStyle(
              color: AppColors.WHITE,
              fontSize: 24,
            ),
            bodyText1: TextStyle(
              color: AppColors.WHITE,
              fontWeight: FontWeight.w600,
            ),
            bodyText2: TextStyle(
              color: AppColors.WHITE,
            ),
          ),
          iconTheme: IconThemeData(color: AppColors.WHITE),
          backgroundColor: AppColors.PRIMARY_DARK,
          bottomAppBarColor: AppColors.PRIMARY,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.PRIMARY,
          ),
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: AppColors.PRIMARY,
          ),
          cardColor: AppColors.PRIMARY,
        ),
        initial: savedThemeMode ?? AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.APP_NAME_TITLE,
          home: GetBuilder<SessionController>(
            init: SessionController(),
            builder: (controller) {
              return App();
            },
          ),
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

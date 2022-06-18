import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pres7t/utils/constants/colors.dart';

class LoadingScreen extends StatelessWidget {
  final Function? onPressed;

  LoadingScreen({
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitWave(
        color: AppColors.BLUE,
        size: 50.0,
      ),
    );
  }
}

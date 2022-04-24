import 'package:eventouch/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ImageIconWidget extends StatelessWidget {
  const ImageIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => {},
      icon: Icon(
        Icons.add_a_photo,
        color: AppColors.PRIMARY,
        size: 48,
      ),
    );
  }
}

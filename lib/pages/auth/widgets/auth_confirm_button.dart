import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class AuthConfirmWidget extends StatelessWidget {
  Function onConfirm;
  Function onBack;
  AuthConfirmWidget({
    Key? key,
    required this.onConfirm,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 1,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: AppColors.ORANGE!.withOpacity(1),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
            ),
            onPressed: () {
              onBack();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: Text(
                'Back',
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
          flex: 2,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: AppColors.PURPLE!.withOpacity(1),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
            ),
            onPressed: () {
              onConfirm();
            },
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                'Confirm',
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: AppColors.PRIMARY,
                      fontSize: 24,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

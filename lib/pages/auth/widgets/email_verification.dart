import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_dialog.dart';
import '../controller.dart';
import 'auth_confirm_button.dart';

class EmailVerificationWidget extends StatefulWidget {
  Function onConfirm;
  Function onBack;
  EmailVerificationWidget({
    Key? key,
    required this.onConfirm,
    required this.onBack,
  }) : super(key: key);

  @override
  _EmailVerificationWidgetState createState() => _EmailVerificationWidgetState();
}

class _EmailVerificationWidgetState extends State<EmailVerificationWidget> with TickerProviderStateMixin {
  TextEditingController _codeController = TextEditingController();

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
                  controller: _codeController,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: "Verification code",
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                AuthConfirmWidget(
                  backTitle: 'Repeat',
                  onConfirm: () => {
                    if (_codeController.text.isNotEmpty)
                      {
                        widget.onConfirm(),
                      }
                    else
                      {
                        AppDialog.getErrorDialog('CONFIRMATION_CODE_IS_REQUIRED'),
                      }
                  },
                  onBack: () => {
                    widget.onBack(),
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

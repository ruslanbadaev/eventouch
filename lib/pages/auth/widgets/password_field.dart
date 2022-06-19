import 'package:flutter/material.dart';
import 'package:pres7t/utils/constants/colors.dart';

class PasswordFieldWidget extends StatefulWidget {
  String labelText;
  String? errorText;
  TextEditingController controller;
  Function? onChanged;

  PasswordFieldWidget({
    Key? key,
    required this.labelText,
    this.errorText,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _passwordIsVisible = false;
  List<String> smiles = [
    '⛰',
    '⛱',
    '⛹',
    '⛷',
    '⛺',
    '⛴',
    '⛳',
    '⛪',
    '⛄',
    '⚽',
    '⚾',
    '☕',
  ];

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(fontSize: 24),
      textAlign: TextAlign.center,
      obscureText: !_passwordIsVisible,
      obscuringCharacter: '▒',
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () => setState(() {
            print(123);
            _passwordIsVisible = !_passwordIsVisible;
          }),
          child: Text(
            _passwordIsVisible ? '🙉' : '🙈',
            style: TextStyle(fontSize: 32),
          ),
        ),
        labelText: widget.labelText,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        errorText: widget.errorText,
        errorStyle: TextStyle(),
      ),
      onChanged: (value) => widget.onChanged != null ? widget.onChanged!() : {},
    );
  }
}

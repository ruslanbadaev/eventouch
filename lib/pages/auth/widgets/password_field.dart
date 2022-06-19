import 'package:flutter/material.dart';

class PasswordFieldWidget extends StatefulWidget {
  String labelText;
  TextEditingController controller;

  PasswordFieldWidget({
    Key? key,
    required this.labelText,
    required this.controller,
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
      ),
    );
  }
}

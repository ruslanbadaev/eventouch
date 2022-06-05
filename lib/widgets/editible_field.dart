import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';

// ignore: must_be_immutable
class EditebleField extends StatefulWidget {
  String title;
  String subtitle;
  bool? isSingleLine;

  Function(String)? onSaved;

  EditebleField({
    Key? key,
    required this.title,
    required this.subtitle,
    this.isSingleLine = false,
    this.onSaved,
  }) : super(key: key);

  @override
  State<EditebleField> createState() => _EditebleFieldWidgetState();
}

class _EditebleFieldWidgetState extends State<EditebleField> {
  bool isEdited = false;
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  Widget? _trailing() {
    if (isEdited) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.save_rounded),
            color: AdaptiveTheme.of(context).theme.iconTheme.color,
            onPressed: () => {
              setState(() {
                isEdited = false;
              }),
              widget.onSaved!(controller.text)
            },
          ),
          IconButton(
            icon: Icon(
              Icons.close_rounded,
            ),
            color: AdaptiveTheme.of(context).theme.iconTheme.color,
            onPressed: () => {
              setState(() {
                controller.text = widget.subtitle;
                isEdited = false;
              }),
            },
          ),
        ],
      );
    } else {
      return IconButton(
        icon: Icon(Icons.edit_rounded),
        color: AdaptiveTheme.of(context).theme.iconTheme.color,
        onPressed: () => {
          setState(() {
            isEdited = true;
          }),
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.only(
          bottom: 8,
        ),
        child: Text(
          widget.title,
          style: AdaptiveTheme.of(context).theme.textTheme.bodyText1!.copyWith(
              // decoration: TextDecoration.underline,
              ),
        ),
      ),
      subtitle: isEdited
          ? TextField(
              controller: controller,
              cursorColor: AppColors.BLUE,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: AppColors.ORANGE,
                  fontWeight: FontWeight.w600,
                ),
                hintText: "Type me",
                fillColor: AppColors.BLUE,
                hoverColor: AppColors.BLUE,
                focusColor: AppColors.BLUE,
              ),
              style: AdaptiveTheme.of(context).theme.textTheme.bodyText2!.copyWith(color: AppColors.BLUE),
            )
          : Text(
              widget.subtitle,
              style: AdaptiveTheme.of(context).theme.textTheme.bodyText2,
            ),
      trailing: widget.onSaved == null ? null : _trailing(),
    );
  }
}

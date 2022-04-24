import 'package:flutter/material.dart';

class TextBoxFieldWidget extends StatefulWidget {
  String title;
  TextEditingController controller;
  Color color;
  List<BoxShadow>? shadow;
  int? maxLines;
  TextBoxFieldWidget({
    Key? key,
    required this.title,
    required this.controller,
    required this.color,
    required this.shadow,
    this.maxLines,
  }) : super(key: key);

  @override
  State<TextBoxFieldWidget> createState() => _TextBoxFieldWidgetState();
}

class _TextBoxFieldWidgetState extends State<TextBoxFieldWidget> {
  String? latestText;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 18,
            color: widget.color,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          margin: EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.color,
            boxShadow: widget.shadow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            onChanged: (String value) => {
              setState(() {
                if (value == '') {
                  latestText = null;
                } else {
                  latestText = value;
                }
              })
            },
            controller: widget.controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => {
                  setState(() {
                    if (widget.controller.text.isEmpty) {
                      widget.controller.text = latestText ?? '';
                    } else {
                      widget.controller.clear();
                    }
                  }),
                },
                icon: (latestText == null || widget.controller.text.isNotEmpty)
                    ? Icon(
                        Icons.close_rounded,
                      )
                    : Icon(
                        Icons.undo_rounded,
                      ),
              ),
            ),
            maxLines: widget.maxLines ?? 5,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class TextBoxFieldWidget extends StatefulWidget {
  String title;
  TextEditingController controller;
  Color color;
  String? errorText;
  int? maxLines;
  TextBoxFieldWidget({
    Key? key,
    required this.title,
    required this.controller,
    required this.color,
    this.errorText,
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      margin: EdgeInsets.all(8),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
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
              label: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18,
                  color: widget.color,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
            minLines: 1,
            maxLines: widget.maxLines ?? 5,
          ),
        ],
      ),
    );
  }
}

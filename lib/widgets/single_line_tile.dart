import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SingleLineTile extends StatefulWidget {
  String id;
  String title;
  String subtitle;
  bool? isSingleLine;

  SingleLineTile({
    Key? key,
    required this.id,
    required this.title,
    required this.subtitle,
    this.isSingleLine = false,
  }) : super(key: key);

  @override
  State<SingleLineTile> createState() => _SingleLineTileWidgetState();
}

class _SingleLineTileWidgetState extends State<SingleLineTile> {
  bool isEdited = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        widget.title,
        style: AdaptiveTheme.of(context).theme.textTheme.bodyText1,
      ),
      trailing: Text(
        widget.subtitle,
        style: AdaptiveTheme.of(context).theme.textTheme.bodyText1,
      ),
    );
  }
}

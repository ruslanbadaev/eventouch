import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class EventScreen extends StatefulWidget {
  EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
      init: EventController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(),
        );
      },
    );
  }
}

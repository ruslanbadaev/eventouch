import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

enum EventType { tourist, politic, extravert, nurd }

class Event extends StatefulWidget {
  Event({Key? key}) : super(key: key);

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
      init: EventController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
          floatingActionButton: Container(),
        );
      },
    );
  }
}

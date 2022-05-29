import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/event.dart';
import '../../models/event_marker.dart';
import 'controller.dart';
import 'widgets/event_item.dart';

class EventsScreen extends StatefulWidget {
  EventsScreen({Key? key}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> with TickerProviderStateMixin {
  List<EventModel> events = [
    EventModel(
      id: "6208ed5b8afbec974dc782f4",
      title: 'Python hackathon',
      type: EventType.nurd,
      creator: '6208ed5b8afbec974dc782f4',
      aboutEvent: 'About event text',
      aboutYou: 'About you text',
      visitors: 18,
      date: 123123123,
      images: [],
    ),
    EventModel(
      id: "6208ed5b8afbec974dc782f4",
      title: 'Python hackathon',
      type: EventType.nurd,
      creator: '6208ed5b8afbec974dc782f4',
      aboutEvent: 'About event text',
      aboutYou: 'About you text',
      visitors: 18,
      date: 123123123,
      images: [],
    ),
    EventModel(
      id: "6208ed5b8afbec974dc782f4",
      title: 'Python hackathon',
      type: EventType.nurd,
      creator: '6208ed5b8afbec974dc782f4',
      aboutEvent: 'About event text',
      aboutYou: 'About you text',
      visitors: 18,
      date: 123123123,
      images: [],
    ),
  ];

  initState() {
    super.initState();
  }

  int? x;
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<EventsScreenController>(
      init: EventsScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                for (EventModel event in events)
                  EventItemWidget(
                    id: event.id,
                    title: event.title,
                    date: event.date.toString(),
                    eventType: event.type,
                    image: (event.images == null || event.images?.length == 0) ? null : event.images?.first,
                    onPressed: () => {},
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

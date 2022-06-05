import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/event.dart';
import '../../models/event_marker.dart';
import 'controller.dart';
import 'widgets/event_item.dart';

class EventsHistoryScreen extends StatefulWidget {
  EventsHistoryScreen({Key? key}) : super(key: key);

  @override
  _EventsHistoryScreenState createState() => _EventsHistoryScreenState();
}

class _EventsHistoryScreenState extends State<EventsHistoryScreen> with TickerProviderStateMixin {
  List<EventModel> events = [
    EventModel(
      id: "6208ed5b8afbec974dc782f4",
      title: 'Python hackathon',
      type: EventType.nurd,
      creator: '6208ed5b8afbec974dc782f4',
      aboutEvent: 'About event text',
      aboutYou: 'About you text',
      visitors: 18,
      date: '2022-01-03T21:21:38.032Z',
      images: ['https://amazinghiring.ru/blog/wp-content/uploads/2017/10/SOSUEU17-207.jpg'],
    ),
    EventModel(
      id: "6208ed5b8afbec974dc782f4",
      title: 'Python hackathon',
      type: EventType.nurd,
      creator: '6208ed5b8afbec974dc782f4',
      aboutEvent: 'About event text',
      aboutYou: 'About you text',
      visitors: 18,
      date: '2022-01-03T21:21:38.032Z',
      images: [],
    ),
    EventModel(
      id: "6208ed5b8afbec974dc782f4",
      title: 'Python hackathon',
      type: EventType.extravert,
      creator: '6208ed5b8afbec974dc782f4',
      aboutEvent: 'About event text',
      aboutYou: 'About you text',
      visitors: 18,
      date: '2022-01-03T21:21:38.032Z',
      images: [],
    ),
    EventModel(
      id: "6208ed5b8afbec974dc782f4",
      title: 'Python hackathon',
      type: EventType.politic,
      creator: '6208ed5b8afbec974dc782f4',
      aboutEvent: 'About event text',
      aboutYou: 'About you text',
      visitors: 18,
      date: '2022-01-03T21:21:38.032Z',
      images: [],
    ),
    EventModel(
      id: "6208ed5b8afbec974dc782f4",
      title: 'Python hackathon',
      type: EventType.tourist,
      creator: '6208ed5b8afbec974dc782f4',
      aboutEvent: 'About event text',
      aboutYou: 'About you text',
      visitors: 18,
      date: '2022-01-03T21:21:38.032Z',
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

    return GetBuilder<EventsHistoryScreenController>(
      init: EventsHistoryScreenController(),
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

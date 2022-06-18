import 'dart:async';
import 'dart:math';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../models/event.dart';
import '../../utils/constants/colors.dart';
import '../../utils/event_type.dart';
import '../event/event.dart';
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
      creatorId: '6208ed5b8afbec974dc782f4',
      aboutEvent: 'About event text',
      aboutYou: 'About you text',
      visitors: 18,
      location: {},
      date: '2022-01-03T21:21:38.032Z',
      images: ['https://amazinghiring.ru/blog/wp-content/uploads/2017/10/SOSUEU17-207.jpg'],
      createdAt: '',
      updatedAt: '',
    ),

    // EventModel(
    //   id: "6208ed5b8afbec974dc782f4",
    //   title: 'Python hackathon',
    //   type: EventType.nurd,
    //   creatorId: '6208ed5b8afbec974dc782f4',
    //   aboutEvent: 'About event text',
    //   aboutYou: 'About you text',
    //   visitors: 18,
    //   date: '2022-01-03T21:21:38.032Z',
    //   images: [],
    // ),
    // EventModel(
    //   id: "6208ed5b8afbec974dc782f4",
    //   title: 'Python hackathon',
    //   type: EventType.extravert,
    //   creatorId: '6208ed5b8afbec974dc782f4',
    //   aboutEvent: 'About event text',
    //   aboutYou: 'About you text',
    //   visitors: 18,
    //   date: '2022-01-03T21:21:38.032Z',
    //   images: [],
    // ),
    // EventModel(
    //   id: "6208ed5b8afbec974dc782f4",
    //   title: 'Python hackathon',
    //   type: EventType.politic,
    //   creatorId: '6208ed5b8afbec974dc782f4',
    //   aboutEvent: 'About event text',
    //   aboutYou: 'About you text',
    //   visitors: 18,
    //   date: '2022-01-03T21:21:38.032Z',
    //   images: [],
    // ),
    // EventModel(
    //   id: "6208ed5b8afbec974dc782f4",
    //   title: 'Python hackathon',
    //   type: EventType.tourist,
    //   creatorId: '6208ed5b8afbec974dc782f4',
    //   aboutEvent: 'About event text',
    //   aboutYou: 'About you text',
    //   visitors: 18,
    //   date: '2022-01-03T21:21:38.032Z',
    //   images: [],
    // ),
  ];

  initState() {
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey = GlobalKey<LiquidPullToRefreshState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventsHistoryScreenController>(
      init: EventsHistoryScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
          body: controller.events.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon(
                      //   Icons.not_interested_rounded,
                      //   size: 50,
                      //   color: AppColors.ORANGE,
                      // ),
                      SizedBox(
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 7.0,
                                color: Colors.white,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            pause: Duration(milliseconds: 1000),
                            animatedTexts: [
                              FlickerAnimatedText(
                                'No data, tap to reload',
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: AppColors.BLUE),
                              ),
                              FlickerAnimatedText(
                                'or',
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: AppColors.PINK),
                              ),
                              FlickerAnimatedText(
                                'create or visit',
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: AppColors.ORANGE),
                              ),
                              FlickerAnimatedText(
                                'some event',
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(color: AppColors.PURPLE),
                              ),
                            ],
                            onTap: () {
                              controller.getEventsHistory();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : LiquidPullToRefresh(
                  key: _refreshIndicatorKey,
                  showChildOpacityTransition: false,
                  color: AppColors.PRIMARY,
                  backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
                  springAnimationDurationInMilliseconds: 260,
                  onRefresh: controller.getEventsHistory,
                  child: ListView.builder(
                    padding: kMaterialListPadding,
                    itemCount: controller.events.length,
                    itemBuilder: (BuildContext context, int index) {
                      List<EventModel> events = controller.events;
                      return EventItemWidget(
                        id: events[index].id,
                        title: events[index].title,
                        date: events[index].date.toString(),
                        eventType: events[index].type,
                        image: (events[index].images == null || events[index].images?.length == 0)
                            ? null
                            : events[index].images?.first,
                        onPressed: () => {
                          Get.to(() => EventScreen(id: 'xxx'), transition: Transition.size),
                        },
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}

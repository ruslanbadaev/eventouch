import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pres7t/widgets/empty_widget.dart';
import 'package:pres7t/widgets/loading_screen.dart';

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
        getDialog() {
          print('getDialog');
        }

        return controller.isLoading
            ? LoadingScreen()
            : Scaffold(
                backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
                body: controller.events.isEmpty
                    ? EmptyWidget(onPressed: () => controller.getEventsHistory())
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

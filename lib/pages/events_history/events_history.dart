import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../models/event.dart';
import '../../utils/constants/colors.dart';
import '../../widgets/empty_widget.dart';
import '../../widgets/loading_screen.dart';
import '../event/event.dart';
import 'controller.dart';
import 'widgets/event_item.dart';

class EventsHistoryScreen extends StatefulWidget {
  EventsHistoryScreen({Key? key}) : super(key: key);

  @override
  _EventsHistoryScreenState createState() => _EventsHistoryScreenState();
}

class _EventsHistoryScreenState extends State<EventsHistoryScreen> with SingleTickerProviderStateMixin {
  initState() {
    super.initState();
  }

  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey = GlobalKey<LiquidPullToRefreshState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventsHistoryScreenController>(
      init: EventsHistoryScreenController(),
      builder: (controller) {
        return controller.isLoading
            ? LoadingScreen()
            : Scaffold(
                // appBar: AppBar(
                //   backgroundColor: AdaptiveTheme.of(context).theme.primaryColor,
                //   title: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       InkWell(
                //         onTap: () => {controller.changeTab(EventStatus.visited)},
                //         borderRadius: BorderRadius.circular(10),
                //         child: Padding(
                //           padding: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
                //           child: Text(
                //             'Visited',
                //             style: controller.selectedStatusTab == EventStatus.visited
                //                 ? TextStyle(
                //                     color: AppColors.PURPLE,
                //                     fontWeight: FontWeight.w600,
                //                   )
                //                 : TextStyle(
                //                     color: AdaptiveTheme.of(context).theme.accentColor,
                //                     fontWeight: FontWeight.w400,
                //                   ),
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         onTap: () => {controller.changeTab(EventStatus.created)},
                //         borderRadius: BorderRadius.circular(10),
                //         child: Padding(
                //           padding: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
                //           child: Container(
                //             child: Text(
                //               'Created',
                //               style: controller.selectedStatusTab == EventStatus.created
                //                   ? TextStyle(
                //                       color: AppColors.PURPLE,
                //                       fontWeight: FontWeight.w600,
                //                     )
                //                   : TextStyle(
                //                       color: AdaptiveTheme.of(context).theme.accentColor,
                //                       fontWeight: FontWeight.w400,
                //                     ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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

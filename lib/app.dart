import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:blobs/blobs.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pres7t/pages/settings/controller.dart';

import 'controller.dart';
import 'controllers/session_controller.dart';
import 'pages/events_history/events_history.dart';
import 'pages/friends/friends.dart';
import 'pages/map/map.dart';
import 'pages/profile/profile.dart';
import 'pages/settings/settings.dart';
import 'utils/constants/colors.dart';
import 'widgets/fade_indexed_stack.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin {
  Color _bottomSheetBackgroundColor = AppColors.PURPLE!;
  final SessionController sessionController = Get.put(SessionController());
  final SettingsController settingsController = Get.put(SettingsController());

  initState() {
    sessionController.checkLogged();
    super.initState();
  }

  final List<Widget> _screens = [
    MapScreen(),
    FriendsScreen(),
    EventsHistoryScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      init: AppController(),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AdaptiveTheme.of(context).theme.bottomSheetTheme.backgroundColor,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 21.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'PRES',
                          style: AdaptiveTheme.of(context).theme.textTheme.headline1,
                        ),
                        TextSpan(
                          text: '7',
                          style: TextStyle(color: AppColors.PURPLE, fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: 'T',
                          style: AdaptiveTheme.of(context).theme.textTheme.headline1,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Get.to(
                        () => ProfileScreen(
                          id: 'xxx',
                          onClose: () => {
                            settingsController.getCurrentUser(),
                          },
                        ),
                        transition: Transition.upToDown,
                      ),
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.BLUE,
                      backgroundImage: NetworkImage(
                        'https://yt3.ggpht.com/a/AATXAJxQ-ZsPQu79yvh7ybjxkbu_R75dPcX-uuBEbw=s900-c-k-c0xffffffff-no-rj-mo',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: Stack(
                children: [
                  FadeIndexedStack(
                    index: controller.tabIndex,
                    duration: Duration(milliseconds: 800),
                    children: [
                      MapScreen(),
                      FriendsScreen(),
                      EventsHistoryScreen(),
                      SettingsScreen(),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: CustomNavigationBar(
              iconSize: 76.0,
              opacity: 1,
              strokeColor: _bottomSheetBackgroundColor,
              backgroundColor: AdaptiveTheme.of(context).theme.bottomSheetTheme.backgroundColor ?? Colors.red,
              currentIndex: controller.tabIndex,
              scaleFactor: .2,
              items: [
                CustomNavigationBarItem(
                  icon: _navBarIcon(
                    controller,
                    iconData: Icons.map_rounded,
                    color: AppColors.PURPLE!,
                    index: 0,
                  ),
                ),
                CustomNavigationBarItem(
                  icon: _navBarIcon(
                    controller,
                    iconData: Icons.people_alt_rounded,
                    color: AppColors.PINK!,
                    index: 1,
                  ),
                ),
                CustomNavigationBarItem(
                  icon: _navBarIcon(
                    controller,
                    iconData: Icons.menu_book_rounded,
                    color: AppColors.BLUE!,
                    index: 2,
                  ),
                ),
                CustomNavigationBarItem(
                  icon: _navBarIcon(
                    controller,
                    iconData: Icons.settings_rounded,
                    color: AppColors.ORANGE!,
                    index: 3,
                  ),
                ),
              ],
              onTap: (index) {
                controller.changeTabIndex(index);

                setState(() {
                  switch (index) {
                    case 0:
                      _bottomSheetBackgroundColor = AppColors.PURPLE!;
                      break;
                    case 1:
                      _bottomSheetBackgroundColor = AppColors.PINK!;
                      break;
                    case 2:
                      //   _bottomSheetBackgroundColor = AppColors.PRIMARY!;
                      //   break;
                      // case 3:
                      _bottomSheetBackgroundColor = AppColors.BLUE!;
                      break;
                    case 3:
                      _bottomSheetBackgroundColor = AppColors.ORANGE!;
                      break;
                    default:
                  }
                });
              },
            ),
          ),
        );
      },
    );
  }

  Widget _navBarIcon(
    AppController controller, {
    required Color color,
    required IconData iconData,
    required int index,
  }) {
    return Stack(
      children: [
        Center(
          child: Blob.random(
            size: 76,
            minGrowth: 6,
            styles: BlobStyles(
              color: color.withOpacity(controller.tabIndex == index ? .2 : .0),
            ),
          ),
        ),
        Center(
          child: Icon(
            iconData,
            size: controller.tabIndex == index ? 42 : 36,
            color: color.withOpacity(controller.tabIndex == index ? 1 : .5),
          ),
        ),
      ],
    );
  }
}

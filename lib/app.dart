import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eventouch/pages/map/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

import 'pages/people/people.dart';
import 'utils/constants/colors.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin {
  Color _bottomSheetBackgroundColor = AppColors.PINK!;
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      init: AppController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.LIGHT,
            elevation: 0,
            title: Row(
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 21.0,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Even',
                        style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: 'Touch',
                        style: TextStyle(color: AppColors.PURPLE, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                // Text(
                //   'EvenTouch',
                //   style: TextStyle(color: AppColors.PRIMARY),
                // ),
              ],
            ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                IndexedStack(
                  index: controller.tabIndex,
                  children: [
                    MapScreen(),
                    People(),
                    People(),
                    People(),
                  ],
                ),
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: Container(
                //     height: 48,
                //     width: 156,
                //     padding: EdgeInsets.all(12),
                //     decoration: BoxDecoration(
                //       color: AppColors.LIGHT,
                //       borderRadius: BorderRadius.only(
                //         bottomRight: Radius.circular(40),
                //       ),
                //     ),
                //     child: Row(
                //       children: [
                //         Icon(
                //           Icons.bike_scooter,
                //           color: AppColors.PRIMARY,
                //         ),
                //         SizedBox(
                //           width: 12,
                //         ),
                //         Text(
                //           'EventME',
                //           style: TextStyle(color: AppColors.PRIMARY),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 96,
                    child: CurvedNavigationBar(
                      color: AppColors.LIGHT,
                      backgroundColor: _bottomSheetBackgroundColor.withOpacity(.3),
                      items: <Widget>[
                        Icon(Icons.map_rounded, size: 30, color: AppColors.PURPLE),
                        Icon(Icons.people_alt_rounded, size: 30, color: AppColors.PINK),
                        Icon(Icons.menu_book_rounded, size: 30, color: AppColors.BLUE),
                        Icon(Icons.settings_rounded, size: 30, color: AppColors.ORANGE),
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
                              _bottomSheetBackgroundColor = AppColors.BLUE!;
                              break;
                            case 3:
                              _bottomSheetBackgroundColor = AppColors.ORANGE!;
                              break;
                            default:
                          }
                        });

                        //Handle button tap
                      },
                    ),
                  ),
                ),
              ],
            ),
            // floatingActionButton: GetBuilder<SessionController>(
            //   init: SessionController(),
            //   builder: (controller) {
            //     return FloatingActionButton(
            //       onPressed: () {
            //         Get.to(Settings());
            //       },
            //       child: Icon(
            //         Icons.settings_rounded,
            //         color: AppColors.PRIMARY,
            //       ),
            //       backgroundColor: Colors.white,
            //     );
            //   },
            // ),
            // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

            // bottomNavigationBar: BubbleBottomBar(
            //   opacity: .2,
            //   currentIndex: controller.tabIndex,
            //   onTap: controller.changeTabIndex,
            //   borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            //   elevation: 8,
            //   fabLocation: BubbleBottomBarFabLocation.end,
            //   hasNotch: true,
            //   hasInk: true,
            //   inkColor: Colors.black12,
            //   items: <BubbleBottomBarItem>[
            //     BubbleBottomBarItem(
            //         backgroundColor: AppColors.PRIMARY,
            //         icon: Icon(
            //           Icons.laptop_mac_rounded,
            //           color: AppColors.PRIMARY,
            //         ),
            //         activeIcon: Icon(
            //           Icons.laptop_mac_rounded,
            //           color: AppColors.PRIMARY,
            //         ),
            //         title: Text("Map")),
            //     BubbleBottomBarItem(
            //         backgroundColor: AppColors.PRIMARY,
            //         icon: Icon(
            //           Icons.people_alt_rounded,
            //           color: AppColors.PRIMARY,
            //         ),
            //         activeIcon: Icon(
            //           Icons.people_alt_rounded,
            //           color: AppColors.PRIMARY,
            //         ),
            //         title: Text("Messages")),
            //     BubbleBottomBarItem(
            //         backgroundColor: AppColors.PRIMARY,
            //         icon: Icon(
            //           Icons.calendar_today_rounded,
            //           color: AppColors.PRIMARY,
            //         ),
            //         activeIcon: Icon(
            //           Icons.calendar_today_rounded,
            //           color: AppColors.PRIMARY,
            //         ),
            //         title: Text("Profile"))
            //   ],
            // ),
          ),
        );
      },
    );
  }
}

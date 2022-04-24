import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'pages/friends/friends.dart';
import 'pages/map/map.dart';
import 'pages/profile/profile.dart';
import 'utils/constants/colors.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin {
  Color _bottomSheetBackgroundColor = AppColors.PURPLE!;
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                GestureDetector(
                  onTap: () => {Get.to(ProfileScreen())},
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
                IndexedStack(
                  index: controller.tabIndex,
                  children: [
                    MapScreen(),
                    FriendsScreen(),
                    FriendsScreen(),
                    FriendsScreen(),
                    FriendsScreen(),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    // height: 96,
                    child: CurvedNavigationBar(
                      color: AppColors.LIGHT,
                      backgroundColor: _bottomSheetBackgroundColor.withOpacity(0),
                      animationDuration: Duration(milliseconds: 400),
                      buttonBackgroundColor: _bottomSheetBackgroundColor,
                      items: <Widget>[
                        Icon(Icons.map_rounded,
                            size: 30,
                            color:
                                _bottomSheetBackgroundColor == AppColors.PURPLE ? AppColors.WHITE : AppColors.PURPLE),
                        Icon(
                          Icons.people_alt_rounded,
                          size: 30,
                          color: _bottomSheetBackgroundColor == AppColors.PINK ? AppColors.WHITE : AppColors.PINK,
                        ),
                        Icon(Icons.menu_book_rounded,
                            size: 30,
                            color: _bottomSheetBackgroundColor == AppColors.BLUE ? AppColors.WHITE : AppColors.BLUE),
                        Icon(Icons.settings_rounded,
                            size: 30,
                            color:
                                _bottomSheetBackgroundColor == AppColors.ORANGE ? AppColors.WHITE : AppColors.ORANGE),
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

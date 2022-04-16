import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';
import 'controller.dart';

class EventScreen extends StatefulWidget {
  String id;
  EventScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> with TickerProviderStateMixin {
  List<BoxShadow> shadow = [
    BoxShadow(
      color: AppColors.PRIMARY!.withOpacity(0.3),
      spreadRadius: 1,
      blurRadius: 3,
      offset: Offset(3, 3), // changes position of shadow
    )
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
      init: EventController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.WHITE,
          body: Column(
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 240.0,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: false,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      onPageChanged: (_, __) => {},
                      scrollDirection: Axis.vertical,
                    ),
                    items: [
                      'https://newsroom.mastercard.com/wp-content/uploads/2016/10/HACKATHON-162-of-477.jpg',
                      'https://ria56.ru/wp-content/uploads/2021/07/0187LoULJ7M.jpg',
                      'https://amazinghiring.ru/blog/wp-content/uploads/2017/10/SOSUEU17-207.jpg',
                    ].map((String image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return ClipRRect(
                            child: Container(
                              width: double.infinity,
                              child: CachedNetworkImage(
                                imageUrl: '$image',
                                placeholder: (context, url) => SpinKitRipple(
                                  color: AppColors.ORANGE,
                                  size: 240.0,
                                ),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        color: AppColors.PINK,
                        size: 36,
                      ),
                      onPressed: () => {Get.back()},
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: IconButton(
                      icon: Icon(
                        Icons.share_rounded,
                        color: AppColors.BLUE,
                        size: 28,
                      ),
                      onPressed: () => {Get.back()},
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 24),
                      Text(
                        'Organizer',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.ORANGE,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        margin: EdgeInsets.all(8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomLeft,
                            colors: [
                              AppColors.ORANGE!,
                              AppColors.ORANGE!,
                              // AppColors.ORANGE!.withOpacity(.6),
                            ],
                          ),
                          boxShadow: shadow,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              width: 56,
                              height: 56,
                              child: Image.network(
                                'https://i.pinimg.com/originals/64/cb/f6/64cbf6023a8576482f7782ce1d29cc01.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            'Till Lindenmann',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.PRIMARY,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            'Master',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.PRIMARY,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'About event',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.PURPLE,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        margin: EdgeInsets.all(8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomLeft,
                            colors: [
                              AppColors.PURPLE!,
                              AppColors.PURPLE!,
                              // AppColors.PURPLE!.withOpacity(.6),
                            ],
                          ),
                          boxShadow: shadow,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Python hackathone',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.PRIMARY,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.PRIMARY,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Options',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.BLUE,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    AppColors.BLUE!,
                                    AppColors.BLUE!,
                                    // AppColors.BLUE!.withOpacity(.6),
                                  ],
                                ),
                                boxShadow: shadow,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Сost of entry:',
                                      style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                      text: ' Free',
                                      style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    AppColors.BLUE!,
                                    AppColors.BLUE!,
                                    // AppColors.BLUE!.withOpacity(.6),
                                  ],
                                ),
                                boxShadow: shadow,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Dress code:',
                                      style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                      text: ' Any',
                                      style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    AppColors.BLUE!,
                                    AppColors.BLUE!,
                                    // AppColors.BLUE!.withOpacity(.6),
                                  ],
                                ),
                                boxShadow: shadow,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Who is invited:',
                                      style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                      text: ' Python developers',
                                      style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    AppColors.BLUE!,
                                    AppColors.BLUE!,
                                    // AppColors.BLUE!.withOpacity(.6),
                                  ],
                                ),
                                boxShadow: shadow,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Alcohol:',
                                      style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                      text: ' Yes',
                                      style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    AppColors.BLUE!,
                                    AppColors.BLUE!,
                                    // AppColors.BLUE!.withOpacity(.6),
                                  ],
                                ),
                                boxShadow: shadow,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Food:',
                                      style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                      text: ' Fastfood',
                                      style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 128),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => {},
            backgroundColor: AppColors.PINK,
            extendedPadding: EdgeInsets.all(4),
            elevation: 4,
            label: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.WHITE,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  Text(
                    '18',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.PINK,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.people,
                    color: AppColors.PINK,
                    size: 16,
                  ),
                ],
              ),
            ),
            icon: Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                'I\'ll be there',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.PRIMARY,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

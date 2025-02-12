import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pres7t/pages/event/walking.dart';

import '../../utils/constants/colors.dart';
import '../../widgets/text_box.dart';
import '../../widgets/user_avatar.dart';
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
          backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
          body: Column(
            children: [
              Stack(
                children: [
                  FadeInDownBig(
                    child: Container(
                      child: CarouselSlider(
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
                                  height: 240.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        AppColors.BLUE!,
                                        AppColors.PURPLE!,
                                        AppColors.PINK!,
                                        AppColors.ORANGE!,
                                      ],
                                    ),
                                  ),
                                  width: double.infinity,
                                  child: CachedNetworkImage(
                                    imageUrl: '$image',
                                    placeholder: (context, url) => SpinKitRipple(
                                      color: AppColors.ORANGE,
                                      size: 240.0,
                                    ),
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.image_not_supported_rounded,
                                      color: AppColors.PRIMARY,
                                      size: 48,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: FadeInLeft(
                      child: IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          color: AppColors.PRIMARY,
                          size: 36,
                        ),
                        onPressed: () => {Get.back()},
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: FadeInRight(
                      child: IconButton(
                        icon: Icon(
                          Icons.share_rounded,
                          color: AppColors.PRIMARY,
                          size: 28,
                        ),
                        onPressed: () => {Get.back()},
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 24),
                        FadeInDown(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Python hackathone',
                              style: AdaptiveTheme.of(context).theme.textTheme.headline1,
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        // Text(
                        //   'Organizer',
                        //   style: TextStyle(
                        //     fontSize: 18,
                        //     color: AppColors.ORANGE,
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // ),
                        // FadeInLeft(
                        //   child: UserItemWidget(
                        //     title: 'Till Lindenmann',
                        //     subtitle: 'Master',
                        //     imageUrl: 'https://i.pinimg.com/originals/64/cb/f6/64cbf6023a8576482f7782ce1d29cc01.jpg',
                        //     color: AppColors.ORANGE!,
                        //     textColor: AppColors.PRIMARY,
                        //     shadow: shadow,
                        //   ),
                        // ),
                        // SizedBox(height: 12),
                        FadeInDown(
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(18),
                            overlayColor: MaterialStateProperty.all(AppColors.PURPLE),
                            child: Container(
                              // padding: EdgeInsets.symmetric(vertical: 8),
                              // margin: EdgeInsets.all(8),
                              width: double.infinity,
                              child: ListTile(
                                leading: UserAvatarWidget(
                                  name: 'Ruslan Badaev',
                                  // imageUrl: 'imageUrl',
                                ),
                                title: Text(
                                  'Ruslan Badaev',
                                  style: AdaptiveTheme.of(context)
                                      .theme
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: AdaptiveTheme.of(context).theme.accentColor),
                                ),
                                subtitle: Text(
                                  'Description or user status here',
                                  style: AdaptiveTheme.of(context)
                                      .theme
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: AdaptiveTheme.of(context).theme.accentColor),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 24),

                        FadeInUp(
                          child: TextBoxWidget(
                            title: 'About event',
                            body: '',
                            color: AppColors.PURPLE!,
                            // shadow: shadow,
                          ),
                        ),
                        SizedBox(height: 24),
                        FadeInUp(
                          child: TextBoxWidget(
                            title: 'About you',
                            body:
                                'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            color: AppColors.BLUE!,
                            // shadow: shadow,
                          ),
                        ),
                        SizedBox(height: 24),
                        FadeInUp(
                          child: TextBoxWidget(
                            title: 'About location',
                            body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                            color: AppColors.ORANGE!,
                            // shadow: shadow,
                          ),
                        ),
                        SizedBox(height: 256),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FadeInUpBig(
            child: Container(
              decoration: BoxDecoration(
                color: AdaptiveTheme.of(context).theme.backgroundColor.withOpacity(.8),
                borderRadius: BorderRadius.circular(18),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: TextButton(
                onPressed: () => {Get.to(WalkingScreen(id: ''))},
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(AppColors.PURPLE),
                ),
                child: Text(
                  'Visit the event',
                  style: TextStyle(
                    fontSize: 18,
                    color: AdaptiveTheme.of(context).theme.accentColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          // floatingActionButton: Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     Blob.random(
          //       size: 128,
          //       styles: BlobStyles(
          //         color: AppColors.PINK,
          //         // fillType: BlobFillType.stroke,
          //         // gradient: AppColors.getShuffledGradient().createShader(
          //         //   Rect.fromPoints(
          //         //     Offset(0, 200),
          //         //     Offset(200, 100),
          //         //   ),
          //         // ),
          //         strokeWidth: 6,
          //       ),
          //     ), // AppColors.getShuffledGradient()
          //     Text(
          //       'Visit',
          //       style: TextStyle(
          //         fontSize: 18,
          //         color: AdaptiveTheme.of(context).theme.primaryColor,
          //         // wordSpacing: 1.4,
          //         fontWeight: FontWeight.w600,
          //       ),
          //       // textAlign: TextAlign.center,
          //     ),
          //   ],
          // ),

          // floatingActionButton: FadeInRight(
          //   child: FloatingActionButton.extended(
          //     onPressed: () => {},
          //     backgroundColor: AppColors.PINK,
          //     extendedPadding: EdgeInsets.all(4),
          //     elevation: 4,
          //     label: Container(
          //       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          //       decoration: BoxDecoration(
          //         color: AdaptiveTheme.of(context).theme.backgroundColor,
          //         borderRadius: BorderRadius.circular(100),
          //       ),
          //       child: Row(
          //         children: [
          //           Text(
          //             '18',
          //             style: AdaptiveTheme.of(context).theme.textTheme.bodyText1,
          //           ),
          //           Icon(
          //             Icons.people,
          //             color: AppColors.PINK,
          //             size: 16,
          //           ),
          //         ],
          //       ),
          //     ),
          //     icon: Padding(
          //       padding: EdgeInsets.only(left: 12),
          //       child: Text(
          //         'I\'ll be there',
          //         style: TextStyle(
          //           fontSize: 16,
          //           color: AppColors.PRIMARY,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        );
      },
    );
  }
}


// Wrap(
//                           alignment: WrapAlignment.center,
//                           children: [
//                             Container(
//                               padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//                               margin: EdgeInsets.all(4),
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomLeft,
//                                   colors: [
//                                     AppColors.BLUE!,
//                                     AppColors.BLUE!,
//                                     // AppColors.BLUE!.withOpacity(.6),
//                                   ],
//                                 ),
//                                 boxShadow: shadow,
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(
//                                     fontSize: 16.0,
//                                   ),
//                                   children: <TextSpan>[
//                                     TextSpan(
//                                       text: 'Сost of entry:',
//                                       style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w600),
//                                     ),
//                                     TextSpan(
//                                       text: ' Free',
//                                       style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w400),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//                               margin: EdgeInsets.all(4),
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomLeft,
//                                   colors: [
//                                     AppColors.BLUE!,
//                                     AppColors.BLUE!,
//                                     // AppColors.BLUE!.withOpacity(.6),
//                                   ],
//                                 ),
//                                 boxShadow: shadow,
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(
//                                     fontSize: 16.0,
//                                   ),
//                                   children: <TextSpan>[
//                                     TextSpan(
//                                       text: 'Dress code:',
//                                       style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w600),
//                                     ),
//                                     TextSpan(
//                                       text: ' Any',
//                                       style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w400),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//                               margin: EdgeInsets.all(4),
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomLeft,
//                                   colors: [
//                                     AppColors.BLUE!,
//                                     AppColors.BLUE!,
//                                     // AppColors.BLUE!.withOpacity(.6),
//                                   ],
//                                 ),
//                                 boxShadow: shadow,
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(
//                                     fontSize: 16.0,
//                                   ),
//                                   children: <TextSpan>[
//                                     TextSpan(
//                                       text: 'Who is invited:',
//                                       style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w600),
//                                     ),
//                                     TextSpan(
//                                       text: ' Python developers',
//                                       style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w400),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//                               margin: EdgeInsets.all(4),
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomLeft,
//                                   colors: [
//                                     AppColors.BLUE!,
//                                     AppColors.BLUE!,
//                                     // AppColors.BLUE!.withOpacity(.6),
//                                   ],
//                                 ),
//                                 boxShadow: shadow,
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(
//                                     fontSize: 16.0,
//                                   ),
//                                   children: <TextSpan>[
//                                     TextSpan(
//                                       text: 'Alcohol:',
//                                       style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w600),
//                                     ),
//                                     TextSpan(
//                                       text: ' Yes',
//                                       style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w400),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//                               margin: EdgeInsets.all(4),
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomLeft,
//                                   colors: [
//                                     AppColors.BLUE!,
//                                     AppColors.BLUE!,
//                                     // AppColors.BLUE!.withOpacity(.6),
//                                   ],
//                                 ),
//                                 boxShadow: shadow,
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(
//                                     fontSize: 16.0,
//                                   ),
//                                   children: <TextSpan>[
//                                     TextSpan(
//                                       text: 'Food:',
//                                       style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w600),
//                                     ),
//                                     TextSpan(
//                                       text: ' Fastfood',
//                                       style: TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.w400),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
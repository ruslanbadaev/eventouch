import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';
import '../../widgets/text_box.dart';
import '../../widgets/user_avatar.dart';
import '../../widgets/user_item.dart';
import 'controller.dart';

class EventDemonstrationScreen extends StatefulWidget {
  String creatorName;
  String creatorDescription;
  String eventName;
  String aboutEvent;
  String aboutYou;
  String aboutLocation;

  EventDemonstrationScreen({
    Key? key,
    required this.creatorName,
    required this.creatorDescription,
    required this.eventName,
    required this.aboutEvent,
    required this.aboutYou,
    required this.aboutLocation,
  }) : super(key: key);

  @override
  _EventDemonstrationScreenState createState() => _EventDemonstrationScreenState();
}

class _EventDemonstrationScreenState extends State<EventDemonstrationScreen> with TickerProviderStateMixin {
  List<BoxShadow> shadow = [
    BoxShadow(
      color: AppColors.PRIMARY!.withOpacity(0.3),
      spreadRadius: 1,
      blurRadius: 3,
      offset: Offset(3, 3),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateEventController>(
      init: CreateEventController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    FadeInDown(
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
                        items: [''].map((String image) {
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
                SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: FadeInDown(
                    child: Text(
                      widget.eventName,
                      style: AdaptiveTheme.of(context).theme.textTheme.headline1,
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                FadeInDown(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
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
                            name: widget.creatorName,
                            // imageUrl: 'imageUrl',
                          ),
                          title: Text(
                            controller.currentUser?.name ?? '--',
                            style: AdaptiveTheme.of(context).theme.textTheme.bodyText1!.copyWith(
                                  color: AdaptiveTheme.of(context).theme.accentColor,
                                ),
                          ),
                          subtitle: Text(
                            controller.currentUser?.description ?? '--',
                            style: AdaptiveTheme.of(context).theme.textTheme.bodyText2!.copyWith(
                                  color: AdaptiveTheme.of(context).theme.accentColor,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                FadeInUp(
                  child: TextBoxWidget(
                    title: 'About event',
                    body: widget.aboutEvent,
                    color: AppColors.PURPLE!,
                    // shadow: shadow,
                  ),
                ),
                SizedBox(height: 24),
                FadeInUp(
                  child: TextBoxWidget(
                    title: 'About you',
                    body: widget.aboutYou,
                    color: AppColors.BLUE!,
                    // shadow: shadow,
                  ),
                ),
                SizedBox(height: 24),
                FadeInUp(
                  child: TextBoxWidget(
                    title: 'About location',
                    body: widget.aboutLocation,
                    color: AppColors.ORANGE!,
                    // shadow: shadow,
                  ),
                ),
                SizedBox(height: 256),
              ],
            ),
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
                onPressed: () => {},
                child: Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 18,
                    color: AdaptiveTheme.of(context).theme.accentColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

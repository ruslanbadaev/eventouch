import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';
import 'controller.dart';
import 'set_place.dart';
import 'widgets/image_icon.dart';
import 'widgets/text_box_field.dart';

class CreateEventScreen extends StatefulWidget {
  CreateEventScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> with TickerProviderStateMixin {
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
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
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
                              items: [
                                'add_image',
                              ].map((String image) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return ClipRRect(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: AppColors.PRIMARY_GRADIENT,
                                        ),
                                        height: 240.0,
                                        width: double.infinity,
                                        child: image == 'add_image'
                                            ? ImageIconWidget()
                                            : CachedNetworkImage(
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
                      SizedBox(height: 12),
                      FadeInLeft(
                        child: TextBoxFieldWidget(
                          title: 'Event name',
                          controller: controller.nameController,
                          color: AppColors.ORANGE!,
                          shadow: shadow,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(height: 12),
                      FadeInRight(
                        child: FadeInRight(
                          child: TextBoxFieldWidget(
                            title: 'About event',
                            controller: controller.aboutEventController,
                            color: AppColors.PURPLE!,
                            shadow: shadow,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      FadeInLeft(
                        child: FadeInLeft(
                          child: TextBoxFieldWidget(
                            title: 'About you',
                            controller: controller.aboutYouController,
                            color: AppColors.BLUE!,
                            shadow: shadow,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      FadeInRight(
                        child: FadeInRight(
                          child: TextBoxFieldWidget(
                            title: 'About location',
                            controller: controller.aboutLocationController,
                            color: AppColors.PINK!,
                            shadow: shadow,
                          ),
                        ),
                      ),
                      SizedBox(height: 128),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FadeInRight(
            child: FloatingActionButton.extended(
              onPressed: () => {
                Get.to(() => SetPlaceScreen()),
              },
              backgroundColor: AdaptiveTheme.of(context).theme.accentColor,
              extendedPadding: EdgeInsets.all(24),
              elevation: 4,
              label: Text(
                'Set place',
                style: TextStyle(
                  fontSize: 16,
                  color: AdaptiveTheme.of(context).theme.primaryColor,
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

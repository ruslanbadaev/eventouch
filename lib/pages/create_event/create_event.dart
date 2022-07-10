import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pres7t/utils/validator.dart';

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
                          maxLines: 1,
                          errorText: Validator.eventNameError(controller.nameController.text),
                          onChanged: () => setState(() {}),
                        ),
                      ),
                      FadeInRight(
                        child: FadeInRight(
                          child: TextBoxFieldWidget(
                            title: 'About event',
                            controller: controller.aboutEventController,
                            color: AppColors.PURPLE!,
                            errorText: Validator.eventAboutError(controller.aboutEventController.text),
                            onChanged: () => setState(() {}),
                          ),
                        ),
                      ),
                      FadeInLeft(
                        child: FadeInLeft(
                          child: TextBoxFieldWidget(
                            title: 'About you',
                            controller: controller.aboutYouController,
                            color: AppColors.BLUE!,
                            errorText: Validator.eventAboutError(controller.aboutYouController.text),
                            onChanged: () => setState(() {}),
                          ),
                        ),
                      ),
                      FadeInRight(
                        child: FadeInRight(
                          child: TextBoxFieldWidget(
                            title: 'About location',
                            controller: controller.aboutLocationController,
                            color: AppColors.PINK!,
                            errorText: Validator.eventAboutError(controller.aboutLocationController.text),
                            onChanged: () => setState(() {}),
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
                onPressed: () => {
                  if (Validator.eventNameError(controller.nameController.text) == null &&
                      Validator.eventAboutError(controller.aboutEventController.text) == null &&
                      Validator.eventAboutError(controller.aboutYouController.text) == null &&
                      Validator.eventAboutError(controller.aboutLocationController.text) == null)
                    {
                      Get.to(() => SetPlaceScreen()),
                    }
                  else
                    {
                      setState(() {}),
                    }
                },
                child: Text(
                  'Set place',
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

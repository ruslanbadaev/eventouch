import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pres7t/utils/constants/strings.dart';

import '../../utils/constants/colors.dart';
import '../../utils/name_parser.dart';
import '../../widgets/editible_field.dart';
import '../../widgets/single_line_tile.dart';
import '../../widgets/unauth_widget.dart';
import 'controller.dart';

class ProfileScreen extends StatefulWidget {
  String? id;
  Function? onClose;
  ProfileScreen({
    Key? key,
    this.id,
    this.onClose,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AdaptiveTheme.of(context).theme.primaryColor,
          body: controller.currentUser == null
              ? UnauthWidget(onPressed: () => {controller.getUserData()})
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Stack(
                            // fit: StackFit.expand,
                            alignment: Alignment.center,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Positioned(
                                left: 16,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Blob.random(
                                      size: 68,
                                      minGrowth: 5,
                                      styles: BlobStyles(
                                        color: AppColors.PINK!.withOpacity(.2),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: AppColors.PINK,
                                        size: 28,
                                      ),
                                      onPressed: () => {
                                        Get.back(),
                                        (widget.onClose ?? () => {})(),
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Blob.random(
                                    size: 256,
                                    minGrowth: 7,
                                    styles: BlobStyles(
                                      color: AppColors.ORANGE!.withOpacity(.2),
                                    ),
                                  ),
                                  Container(
                                    height: 148,
                                    width: 148,
                                    decoration: BoxDecoration(
                                      color: AppColors.ORANGE,
                                      border: Border.all(
                                        width: 4,
                                        color: AppColors.ORANGE!,
                                      ),
                                      borderRadius: BorderRadius.circular(1000),
                                    ),
                                    child:
                                        controller.currentUser!.avatar != null && controller.currentUser!.avatar != '--'
                                            ? ClipRRect(
                                                borderRadius: BorderRadius.circular(1000),
                                                child: Image.network(
                                                  controller.currentUser!.avatar!,
                                                  height: 48,
                                                  width: 48,
                                                  fit: BoxFit.fill,
                                                ),
                                              )
                                            : Center(
                                                child: Text(
                                                  AppStrings.getInitials(controller.currentUser!.name),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: AdaptiveTheme.of(context).theme.accentColor,
                                                    fontSize: 36,
                                                  ),
                                                ),
                                              ),
                                  ),
                                ],
                              ),
                              Positioned(
                                right: 16,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Blob.random(
                                      size: 68,
                                      minGrowth: 5,
                                      styles: BlobStyles(
                                        color: AppColors.BLUE!.withOpacity(.2),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.share_rounded,
                                        color: AppColors.BLUE,
                                        size: 28,
                                      ),
                                      onPressed: () => {Get.back()},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height: 28),
                        // EditebleField(
                        //   title: controller.currentUser?.name ?? '',
                        //   subtitle: controller.currentUser?.description ?? '',
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              Text(
                                controller.currentUser?.name ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AdaptiveTheme.of(context).theme.accentColor,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 24),
                              Text(
                                'Example description',
                                // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AdaptiveTheme.of(context).theme.accentColor,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 36),

                        Text(
                          'Events:',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AdaptiveTheme.of(context).theme.accentColor,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 24),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                // Blob.random(
                                //   size: 164,
                                //   minGrowth: 6,
                                //   styles: BlobStyles(color: AppColors.BLUE!.withOpacity(.2)),
                                // ),
                                Column(
                                  children: [
                                    Text(
                                      'Creqted',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AdaptiveTheme.of(context).theme.accentColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      '4',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AdaptiveTheme.of(context).theme.accentColor,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Stack(
                              alignment: Alignment.center,
                              children: [
                                // Blob.random(
                                //   size: 164,
                                //   minGrowth: 6,
                                //   styles: BlobStyles(color: AppColors.PINK!.withOpacity(.2)),
                                // ),
                                Column(
                                  children: [
                                    Text(
                                      'Attended',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AdaptiveTheme.of(context).theme.accentColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      '12',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AdaptiveTheme.of(context).theme.accentColor,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // Card(
                            //   shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(16.0),
                            //   ),
                            //   color: AdaptiveTheme.of(context).theme.primaryColor,
                            //   child: Padding(
                            //     padding: EdgeInsets.all(24),
                            //     child: Column(
                            //       children: [
                            //         Text(
                            //           'Creqted',
                            //           style: TextStyle(
                            //             fontWeight: FontWeight.w700,
                            //             color: AdaptiveTheme.of(context).theme.accentColor,
                            //             fontSize: 14,
                            //           ),
                            //         ),
                            //         Text(
                            //           '4',
                            //           style: TextStyle(
                            //             fontWeight: FontWeight.w700,
                            //             color: AdaptiveTheme.of(context).theme.accentColor,
                            //             fontSize: 18,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        // SingleLineTile(
                        //   id: '1',
                        //   title: 'Events created:',
                        //   subtitle: '4',
                        // ),
                        // SingleLineTile(
                        //   id: '1',
                        //   title: 'Events attended:',
                        //   subtitle: '12',
                        // ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}

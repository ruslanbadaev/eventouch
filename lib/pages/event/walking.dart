import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants/colors.dart';
import 'controller.dart';

class WalkingScreen extends StatefulWidget {
  String id;
  WalkingScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _WalkingScreenState createState() => _WalkingScreenState();
}

class _WalkingScreenState extends State<WalkingScreen> with TickerProviderStateMixin {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/animations/walking.json'),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 21.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Wish you have a ',
                      style: TextStyle(
                        color: AdaptiveTheme.of(context).theme.accentColor.withOpacity(.8),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'good',
                      style: TextStyle(
                        color: AdaptiveTheme.of(context).theme.accentColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: ' time',
                      style: TextStyle(
                        color: AdaptiveTheme.of(context).theme.accentColor.withOpacity(.8),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 128),
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
                onPressed: () => {},
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(AppColors.PURPLE),
                ),
                child: Text(
                  'Exit',
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

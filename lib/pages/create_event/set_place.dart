import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;

import '../../utils/constants/colors.dart';
import '../../utils/constants/icons.dart';
import '../../utils/event_type.dart';
import 'controller.dart';
import 'event_demonstration.dart';

class SetPlaceScreen extends StatefulWidget {
  SetPlaceScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SetPlaceScreenState createState() => _SetPlaceScreenState();
}

class _SetPlaceScreenState extends State<SetPlaceScreen> with TickerProviderStateMixin {
  MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateEventController>(
      init: CreateEventController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
              child: Stack(
            children: [
              FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  maxZoom: 18,
                  center: latLng.LatLng(51.52, -0.086),
                  zoom: 18.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 64.0,
                        height: 64.0,
                        rotate: true,
                        point: latLng.LatLng(51.52, -0.086),
                        builder: (ctx) => Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            gradient: RadialGradient(
                              colors: [
                                AppColors.BLUE!.withOpacity(.8),
                                AppColors.BLUE!.withOpacity(.5),
                                AppColors.PURPLE!.withOpacity(.5),
                                AppColors.PINK!,
                              ],
                            ),
                          ),
                          child: Icon(
                            Icons.directions_walk_rounded,
                            color: AppColors.PRIMARY,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  child: FadeInRight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FloatingActionButton(
                          backgroundColor: AdaptiveTheme.of(context).theme.primaryColor,
                          onPressed: () => {
                            _mapController.move(
                              _mapController.center,
                              _mapController.zoom + 1,
                            ),
                          },
                          child: Icon(
                            Icons.zoom_in_rounded,
                            color: AdaptiveTheme.of(context).theme.iconTheme.color,
                            size: 32,
                          ),
                        ),
                        SizedBox(height: 14),
                        FloatingActionButton(
                          backgroundColor: AdaptiveTheme.of(context).theme.primaryColor,
                          onPressed: () => {
                            _mapController.move(
                              _mapController.center,
                              _mapController.zoom - 1,
                            ),
                          },
                          child: Icon(
                            Icons.zoom_out_rounded,
                            color: AdaptiveTheme.of(context).theme.iconTheme.color,
                            size: 32,
                          ),
                        ),
                        SizedBox(height: 14),
                        FloatingActionButton(
                          backgroundColor: AppColors.PURPLE!.withOpacity(.8),
                          onPressed: () => {
                            _mapController.move(
                              latLng.LatLng(51.52, -0.086),
                              _mapController.zoom,
                            ),
                          },
                          child: Icon(
                            Icons.location_searching_rounded,
                            color: AppColors.WHITE,
                            size: 32,
                          ),
                        ),
                        SizedBox(height: 14),
                        FloatingActionButton.extended(
                          onPressed: () => {
                            Get.to(EventDemonstrationScreen(
                              creatorName: '',
                              creatorDescription: '',
                              eventName: '',
                              aboutEvent: '',
                              aboutYou: '',
                              aboutLocation: '',
                            )),
                          },
                          backgroundColor: AppColors.ORANGE,
                          extendedPadding: EdgeInsets.all(24),
                          elevation: 4,
                          label: Text(
                            'Set location',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.PRIMARY,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FadeInDown(
                child: Container(
                  padding: EdgeInsets.only(top: 48),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (EventType event in EventType.values.toList())
                          AppIcons.getFilterIcon(
                            context,
                            eventType: event,
                            onPressed: (selectedEventType) => {
                              controller.selectEventType(selectedEventType),
                            },
                            selectedEventFilter: controller.selectedEventType,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                child: Container(
                  height: 128,
                  width: 128,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    gradient: RadialGradient(
                      colors: [
                        AppColors.WHITE.withOpacity(.8),
                        AppColors.WHITE.withOpacity(.5),
                        _getColorBySelectedType(controller.selectedEventType),
                      ],
                    ),
                  ),
                  child: Icon(
                    Icons.place_rounded,
                    size: 36,
                    color: AppColors.RED,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  child: FadeInLeft(
                    child: FloatingActionButton.extended(
                      onPressed: () => {
                        Get.back(),
                      },
                      backgroundColor: AppColors.PINK,
                      extendedPadding: EdgeInsets.all(24),
                      elevation: 4,
                      label: Text(
                        '< Back',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.PRIMARY,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
        );
      },
    );
  }

  Color _getColorBySelectedType(EventType type) {
    switch (type) {
      case EventType.extravert:
        return AppColors.PURPLE!;
      case EventType.politic:
        return AppColors.PINK!;
      case EventType.tourist:
        return AppColors.BLUE!;
      case EventType.nurd:
        return AppColors.ORANGE!;

      default:
        return AppColors.PURPLE!;
    }
  }
}

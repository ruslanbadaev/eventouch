import 'dart:math';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

import '../../models/event_marker.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/icons.dart';
import '../../utils/event_type.dart';
import '../event/event.dart';
import 'controller.dart';
import 'widgets/cloud_marker.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapScreenController>(
      init: MapScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
              child: Stack(
            children: [
              FlutterMap(
                mapController: controller.mapController,
                options: MapOptions(
                  maxZoom: 17,
                  center: controller.currentLocation,
                  zoom: 13.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        'https://api.mapbox.com/styles/v1/ruslanbadaev/cl5ajqicy000214lib6iwbrjh/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicnVzbGFuYmFkYWV2IiwiYSI6ImNsNWFqNzVvcjA1bzIzaW9kOTNsNno0aXUifQ.q0yLIKTEKmLuqLSYXLsSEQ',
                    subdomains: ['a', 'b', 'c'],
                    backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
                    retinaMode: true,
                    fastReplace: true,
                    overrideTilesWhenUrlChanges: true,
                  ),
                  MarkerLayerOptions(
                    markers: [
                      for (EventMarkerModel event in controller.events)
                        if (controller.selectedEventFilter == event.eventType || controller.selectedEventFilter == null)
                          Marker(
                            width: 156.0,
                            height: 56.0,
                            rotate: true,
                            point: event.latLng,
                            builder: (ctx) => event.latLng.longitude < controller.mapController.center.longitude
                                ? FadeInLeft(
                                    duration: Duration(
                                      milliseconds: 300 + Random().nextInt(500),
                                    ),
                                    child: CloudMarker(
                                      id: event.id,
                                      title: event.title,
                                      eventType: event.eventType,
                                      onPressed: () => {
                                        Get.to(
                                          () => EventScreen(
                                            id: event.id,
                                          ),
                                          transition: Transition.downToUp,
                                        ),
                                      },
                                    ),
                                  )
                                : FadeInRight(
                                    duration: Duration(
                                      milliseconds: 300 + Random().nextInt(500),
                                    ),
                                    child: CloudMarker(
                                      id: event.id,
                                      title: event.title,
                                      isLeftSide: true,
                                      eventType: event.eventType,
                                      onPressed: () => {
                                        Get.to(
                                          () => EventScreen(
                                            id: event.id,
                                          ),
                                          transition: Transition.downToUp,
                                        ),
                                      },
                                    ),
                                  ),
                          ),
                      Marker(
                        width: 64.0,
                        height: 64.0,
                        rotate: true,
                        point: controller.currentLocation,
                        builder: (ctx) => Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            gradient: RadialGradient(
                              colors: [
                                AppColors.PURPLE!.withOpacity(.6),
                                AppColors.PURPLE!.withOpacity(.5),
                                AppColors.PURPLE!.withOpacity(.9),
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
              FadeInDown(
                child: Container(
                  padding: EdgeInsets.only(bottom: 96),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (EventType event in EventType.values.toList())
                          AppIcons.getFilterIcon(
                            context,
                            eventType: event,
                            onPressed: controller.selectEventFilter,
                            selectedEventFilter: controller.selectedEventFilter,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: FadeInLeft(
                  child: AppIcons.getFilterIcon(
                    context,
                    onPressed: controller.selectEventFilter,
                    selectedEventFilter: controller.selectedEventFilter,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FadeInRight(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 12,
                        ),
                        child: FloatingActionButton(
                          backgroundColor: AdaptiveTheme.of(context).theme.primaryColor,
                          onPressed: () => {
                            controller.mapController.move(
                              controller.mapController.center,
                              controller.mapController.zoom + 1,
                            ),
                          },
                          child: Icon(
                            Icons.zoom_in_rounded,
                            color: AdaptiveTheme.of(context).theme.iconTheme.color,
                            size: 32,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        child: FloatingActionButton(
                          backgroundColor: AdaptiveTheme.of(context).theme.primaryColor,
                          onPressed: () => {
                            controller.mapController.move(
                              controller.mapController.center,
                              controller.mapController.zoom - 1,
                            ),
                          },
                          child: Icon(
                            Icons.zoom_out_rounded,
                            color: AdaptiveTheme.of(context).theme.iconTheme.color,
                            size: 32,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 12,
                        ),
                        child: FloatingActionButton(
                          backgroundColor: AppColors.PURPLE!.withOpacity(.8),
                          onPressed: () => {
                            controller.mapController.move(
                              controller.currentLocation,
                              controller.mapController.zoom,
                            ),
                          },
                          child: Icon(
                            Icons.location_searching_rounded,
                            color: AdaptiveTheme.of(context).theme.iconTheme.color,
                            size: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}

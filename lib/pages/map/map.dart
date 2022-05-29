import 'dart:math';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;

import '../../models/event_marker.dart';
import '../../utils/constants/colors.dart';
import '../create_event/create_event.dart';
import '../event/event.dart';
import 'controller.dart';
import 'widgets/cloud_marker.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapController _mapController = MapController();
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
                mapController: _mapController,
                options: MapOptions(
                  maxZoom: 18,
                  center: latLng.LatLng(51.5, -0.09),
                  zoom: 13.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                    backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
                    retinaMode: true,
                    fastReplace: true,
                    overrideTilesWhenUrlChanges: true,
                  ),
                  MarkerLayerOptions(
                    markers: [
                      for (EventMarkerModel event in controller.fetchEvents(latLng.LatLng(51.52, -0.093)))
                        if (controller.selectedEventFilter == event.eventType || controller.selectedEventFilter == null)
                          Marker(
                            width: 156.0,
                            height: 56.0,
                            rotate: true,
                            point: event.latLng,
                            builder: (ctx) => event.latLng.longitude < _mapController.center.longitude
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
                                          EventScreen(
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
                                          EventScreen(
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
                        point: latLng.LatLng(51.52, -0.086),
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
                          _getFilterIcon(
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
                  child: _getFilterIcon(
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
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        child: FloatingActionButton(
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
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 12,
                        ),
                        child: FloatingActionButton(
                          backgroundColor: AppColors.PURPLE!.withOpacity(.8),
                          onPressed: () => {
                            _mapController.move(
                              latLng.LatLng(51.52, -0.086),
                              _mapController.zoom,
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

  Widget _getFilterIcon({
    EventType? eventType,
    EventType? selectedEventFilter,
    required Function(EventType) onPressed,
  }) {
    Widget? _avatarContent;
    Color? _avatarColor = AppColors.SECONDARY;
    String title = '';
    switch (eventType) {
      case EventType.tourist:
        _avatarContent = Icon(
          Icons.pedal_bike_rounded,
          color: AppColors.BLACK,
        );
        title = 'Tourists';
        _avatarColor = AppColors.BLUE;
        break;
      case EventType.politic:
        _avatarContent = Icon(
          Icons.flag_rounded,
          color: AppColors.BLACK,
        );
        _avatarColor = AppColors.PINK;
        title = 'Politics';
        break;
      case EventType.extravert:
        _avatarContent = Icon(
          Icons.skateboarding_rounded,
          color: AppColors.BLACK,
        );
        _avatarColor = AppColors.PURPLE;
        title = 'Extraverts';
        break;
      case EventType.nurd:
        _avatarContent = Icon(
          Icons.computer_rounded,
          color: AppColors.BLACK,
        );
        _avatarColor = AppColors.ORANGE;
        title = 'Nurds';
        break;
      default:
        _avatarContent = Icon(
          Icons.add_rounded,
          color: AdaptiveTheme.of(context).theme.textTheme.bodyText1!.color,
        );
        _avatarColor = AdaptiveTheme.of(context).theme.primaryColor;
        title = 'Create celebration';
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 12,
      ),
      child: FloatingActionButton.extended(
        backgroundColor: _avatarColor!.withOpacity(
            (selectedEventFilter == eventType || selectedEventFilter == null || eventType == null) ? 1 : .5),
        onPressed: () => eventType == null
            ? Get.to(
                CreateEventScreen(),
                transition: Transition.upToDown,
              )
            : onPressed(eventType),
        icon: _avatarContent,
        label: Text(
          title,
          style: AdaptiveTheme.of(context).theme.textTheme.bodyText1!.copyWith(
                color: eventType == null ? null : AppColors.PRIMARY,
              ),
        ),
      ),
    );
  }
}

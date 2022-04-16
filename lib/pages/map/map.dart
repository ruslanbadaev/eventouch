import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;

import '../../models/event_marker.dart';
import '../../utils/constants/colors.dart';
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
  Widget build(BuildContext context) {
    return GetBuilder<MapScreenController>(
      init: MapScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: FlutterMap(
              options: MapOptions(
                center: latLng.LatLng(51.5, -0.09),
                zoom: 13.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
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
                          builder: (ctx) => CloudMarker(
                            id: event.id,
                            title: event.title,
                            eventType: event.eventType,
                            onPressed: () => {
                              Get.to(
                                EventScreen(
                                  id: event.id,
                                ),
                              ),
                            },
                          ),
                        ),
                  ],
                ),
              ],
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () => {},
          //   child: Icon(
          //     Icons.add_rounded,
          //     size: 36,
          //     color: AppColors.PRIMARY,
          //   ),
          // ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
          floatingActionButton: Container(
            // width: MediaQuery.of(context).size.width,

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
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
        );
      },
    );
  }

  Widget _getFilterIcon({
    required EventType eventType,
    EventType? selectedEventFilter,
    required Function(EventType) onPressed,
  }) {
    Widget? _avatarContent;
    Color? _avatarColor = AppColors.SECONDARY;
    String title = '';
    switch (eventType) {
      case EventType.tourist:
        _avatarContent = Icon(
          Icons.computer_rounded,
          color: AppColors.BLACK,
        );
        title = 'Tourists';
        _avatarColor = AppColors.BLUE;
        break;
      case EventType.politic:
        _avatarContent = Icon(
          Icons.pedal_bike_rounded,
          color: AppColors.BLACK,
        );
        _avatarColor = AppColors.PINK;
        title = 'Politics';
        break;
      case EventType.extravert:
        _avatarContent = Icon(
          Icons.music_note_rounded,
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
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 12,
      ),
      child: FloatingActionButton.extended(
        backgroundColor:
            _avatarColor!.withOpacity((selectedEventFilter == eventType || selectedEventFilter == null) ? 1 : .5),
        onPressed: () => onPressed(eventType),
        icon: _avatarContent,
        label: Text(title),
      ),
    );
  }
}

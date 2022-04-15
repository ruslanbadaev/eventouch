import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;

import '../../utils/constants/colors.dart';
import '../event/event.dart';
import 'controller.dart';
import 'widgets/cloud_marker.dart';

enum EventType { tourist, politic, extravert, nurd }

class Maps extends StatefulWidget {
  Maps({Key? key}) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapsController>(
      init: MapsController(),
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
                    Marker(
                      width: 156.0,
                      height: 56.0,
                      point: latLng.LatLng(51.52, -0.093),
                      builder: (ctx) => CloudMarker(
                        id: '1',
                        title: 'Title example',
                        introText: 'introText',
                        eventType: EventType.tourist,
                        onPressed: () => {},
                      ),
                    ),
                    Marker(
                      width: 156.0,
                      height: 56.0,
                      point: latLng.LatLng(51.524, -0.091),
                      builder: (ctx) => CloudMarker(
                        id: '1',
                        title: 'Title example',
                        introText: 'introText',
                        eventType: EventType.extravert,
                        onPressed: () => {
                          Get.to(Event()),
                        },
                      ),
                    ),
                    Marker(
                      width: 156.0,
                      height: 56.0,
                      point: latLng.LatLng(51.521, -0.083),
                      builder: (ctx) => CloudMarker(
                        id: '1',
                        title: 'Title example',
                        introText: 'introText',
                        eventType: EventType.nurd,
                        onPressed: () => {},
                      ),
                    ),
                    Marker(
                      width: 156.0,
                      height: 56.0,
                      point: latLng.LatLng(51.511, -0.086),
                      builder: (ctx) => CloudMarker(
                        id: '1',
                        title: 'Title example',
                        introText: 'introText',
                        eventType: EventType.politic,
                        onPressed: () => {},
                      ),
                    ),
                    Marker(
                      width: 156.0,
                      height: 56.0,
                      point: latLng.LatLng(51.516, -0.08),
                      builder: (ctx) => CloudMarker(
                        id: '1',
                        title: 'Title example',
                        introText: 'introText',
                        eventType: EventType.nurd,
                        onPressed: () => {},
                      ),
                    ),
                    Marker(
                      width: 156.0,
                      height: 56.0,
                      point: latLng.LatLng(51.526, -0.07),
                      builder: (ctx) => CloudMarker(
                        id: '1',
                        title: 'Title example',
                        introText: 'introText',
                        eventType: EventType.extravert,
                        onPressed: () => {},
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 12,
                    ),
                    child: FloatingActionButton.extended(
                      backgroundColor: AppColors.BLUE,
                      onPressed: () {},
                      icon: Icon(Icons.pedal_bike_rounded),
                      label: Text('Tourists'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 12,
                    ),
                    child: FloatingActionButton.extended(
                      backgroundColor: AppColors.PINK,
                      onPressed: () {},
                      icon: Icon(Icons.flag),
                      label: Text('Politics'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 12,
                    ),
                    child: FloatingActionButton.extended(
                      backgroundColor: AppColors.PURPLE,
                      onPressed: () {},
                      icon: Icon(Icons.music_note_rounded),
                      label: Text('Extraverts'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 12,
                    ),
                    child: FloatingActionButton.extended(
                      backgroundColor: AppColors.ORANGE,
                      onPressed: () {},
                      icon: Icon(Icons.computer_rounded),
                      label: Text('Nurds'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:latlong2/latlong.dart';

import '../../models/event_marker.dart';
import '../../utils/app_dialog.dart';
import '../../utils/event_type.dart';

class MapScreenController extends GetxController {
  MapController mapController = MapController();

  late LocationSettings locationSettings;
  EventType? _selectedEventFilter;
  LatLng _currentLocation = LatLng(0, 0);
  List<EventMarkerModel> events = [];
  @override
  void onInit() {
    super.onInit();
    determinePositionStream();
    fetchEvents(LatLng(51.521, -0.083));
  }

  EventType? get selectedEventFilter => _selectedEventFilter;
  LatLng get currentLocation => _currentLocation;

  List<EventMarkerModel> fetchEvents(LatLng center) {
    List<EventMarkerModel> events = [];
    List<Map<String, dynamic>> jsonData = [
      {
        "id": "1",
        "title": "Title Example First",
        "lat": "51.52",
        "lng": "-0.093",
        "type": "tourist",
      },
      {
        "id": "2",
        "title": "Title Example Second",
        "lat": "51.521",
        "lng": "-0.083",
        "type": "extravert",
      },
      {
        "id": "3",
        "title": "Title Example",
        "lat": "51.526",
        "lng": "-0.088",
        "type": "nurd",
      },
      {
        "id": "4",
        "title": "Title Example",
        "lat": "51.511",
        "lng": "-0.086",
        "type": "politic",
      },
      {
        "id": "5",
        "title": "Title Example",
        "lat": "51.516",
        "lng": "-0.08",
        "type": "nurd",
      },
      {
        "id": "6",
        "title": "Title Example Last",
        "lat": "51.526",
        "lng": "-0.07",
        "type": "extravert",
      },
    ];

    for (Map<String, dynamic> event in jsonData) events.add(EventMarkerModel.fromJson(event));

    return events;
  }

  void selectEventFilter(EventType event) {
    print(event);
    if (_selectedEventFilter == event) {
      _selectedEventFilter = null;
    } else {
      _selectedEventFilter = event;
    }
    update();
  }

  Future<void> getLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // return 'LOCATION_SERVICE_DISABLED';
      AppDialog.getErrorDialog(
        'LOCATION_SERVICE_DISABLED',
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // return 'LOCATION_PERMISSION_DENIED';
        AppDialog.getErrorDialog('LOCATION_PERMISSION_DENIED');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // return 'LOCATION_PERMISSIONS_ARE_PERMANENTLY_DENIED';
      AppDialog.getErrorDialog(
        'LOCATION_PERMISSIONS_ARE_PERMANENTLY_DENIED',
        eventText: 'Settings',
        details: 'details',
        onEventPressed: () {
          try {
            AppSettings.openLocationSettings();
          } catch (e) {
            print(e);
            AppSettings.openAppSettings();
          }
        },
      );
    }
  }

  Future<Position?> determinePosition() async {
    await getLocationPermission();

    return await Geolocator.getCurrentPosition();
  }

  void determinePositionStream() async {
    getLocationPermission();
    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
          forceLocationManager: true,
          intervalDuration: const Duration(seconds: 10),
          //(Optional) Set foreground notification config to keep the app alive
          //when going to the background
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText: "Example app will continue to receive your location even when you aren't using it",
            notificationTitle: "Running in Background",
            enableWakeLock: true,
          ));
    } else if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
        // Only set to true if our app will be started up in the background.
        showBackgroundLocationIndicator: false,
      );
    } else {
      locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
    }

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings).listen((Position? position) {
      try {
        if (position != null) {
          _currentLocation = LatLng(position.latitude, position.longitude);
          mapController.move(_currentLocation, 10);
        }
        update();
      } catch (e) {
        print(e);
      }
    });
    positionStream.onData((data) {
      _currentLocation = LatLng(data.latitude, data.longitude);
      mapController.move(_currentLocation, 17);
      update();
      print(data);
    });
  }
}

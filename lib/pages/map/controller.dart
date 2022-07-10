import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:latlong2/latlong.dart';

import '../../controllers/network_controller.dart';
import '../../models/event_marker.dart';
import '../../models/response.dart';
import '../../utils/app_dialog.dart';
import '../../utils/event_type.dart';

class MapScreenController extends GetxController {
  MapController mapController = MapController();

  late LocationSettings locationSettings;
  EventType? _selectedEventFilter;
  LatLng _currentLocation = LatLng(12.2807445, 109.2018961);
  List<EventMarkerModel> events = [];
  @override
  void onInit() {
    super.onInit();
    determinePositionStream();

    fetchEvents(_currentLocation);
  }

  EventType? get selectedEventFilter => _selectedEventFilter;
  LatLng get currentLocation => _currentLocation;

  void fetchEvents(LatLng center) async {
    ResponseModel<List<EventMarkerModel>> result = await NetworkController().getEventsByPosition(
      lat: center.latitude,
      lng: center.longitude,
    );
    if (result.response != null) {
      List<EventMarkerModel> testEvents = [
        EventMarkerModel(
          id: 'id',
          title: 'Hiking in the mountains',
          latLng: LatLng(12.29, 109.18),
          eventType: EventType.tourist,
        ),
        EventMarkerModel(
          id: 'id',
          title: 'Beach party',
          latLng: LatLng(12.243, 109.207),
          eventType: EventType.extravert,
        ),
        EventMarkerModel(
          id: 'id',
          title: 'Annual Hackathon',
          latLng: LatLng(12.24, 109.178),
          eventType: EventType.nurd,
        ),
        EventMarkerModel(
          id: 'id',
          title: 'Sports jogging',
          latLng: LatLng(12.26, 109.19),
          eventType: EventType.tourist,
        ),
      ];

      events = testEvents;
      // events = result.response!;

      update();
    } else if (result.error?.message != null) {
      throw result.error?.message ?? 'UNKNOWN_ERROR';
    } else if (result.error == null) {
      throw 'UNKNOWN_ERROR';
    } else {
      throw result.error.toString();
    }

    update();
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

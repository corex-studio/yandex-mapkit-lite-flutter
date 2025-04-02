import 'package:flutter/material.dart';
import 'package:yandex_mapkit_lite/yandex_mapkit_lite.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    Key? key,
    required this.mapObjects,
    this.onControllerCreated,
    this.onTrafficChanged,
    this.onUserLocationUpdated,
    this.onCameraPositionChanged,
    this.allowUserInteractions = true,
  }) : super(key: key);

  final List<MapObject> mapObjects;
  final MapCreatedCallback? onControllerCreated;
  final TrafficChangedCallback? onTrafficChanged;
  final UserLocationCallback? onUserLocationUpdated;
  final CameraPositionCallback? onCameraPositionChanged;
  final bool allowUserInteractions;

  @override
  Widget build(BuildContext context) {
    return YandexMap(
      tiltGesturesEnabled: allowUserInteractions,
      rotateGesturesEnabled: false,
      scrollGesturesEnabled: allowUserInteractions,
      zoomGesturesEnabled: allowUserInteractions,
      fastTapEnabled: true,
      onMapCreated: onControllerCreated,
      mapObjects: mapObjects,
      onTrafficChanged: onTrafficChanged,
      onUserLocationAdded: onUserLocationUpdated,
      onCameraPositionChanged: onCameraPositionChanged,
      nightModeEnabled: Theme.of(context).brightness == Brightness.dark,
      logoAlignment: const MapAlignment(
        horizontal: HorizontalAlignment.left,
        vertical: VerticalAlignment.top,
      ),
      // customLogoAlignment: const CustomMapAlignment(
      //   left: 0,
      //   right: 0,
      //   top: 0,
      //   bottom: 0,
      // ),
    );
  }
}

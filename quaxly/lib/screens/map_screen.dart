import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return MapboxMap(
      accessToken: 'YOUR_MAPBOX_ACCESS_TOKEN',
      initialCameraPosition: CameraPosition(
      target: LatLng(37.7749, -122.4194), // Set the initial location of the map
      zoom: 12.0, // Set the initial zoom level of the map
      ),
    );
  }
}
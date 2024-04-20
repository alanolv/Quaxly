import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';

class NavigationReponse {
  String? code;
  List<WayPoint>? waypoints;

  NavigationReponse({this.code, this.waypoints});

  NavigationReponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['waypoints'] != null) {
      waypoints = <WayPoint>[];
      json['waypoints'].forEach((v) {
        var waypoint = WayPoint.fromJson(v);
        waypoint.latitude = v['location'][1];
        waypoint.longitude = v['location'][0];
        waypoints!.add(waypoint);
      });
    }
  }
}
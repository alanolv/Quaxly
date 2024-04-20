import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'package:get/get.dart';
import 'package:quaxly/controllers/map_controller.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = Get.put(MapController());

  bool _isMultipleStop = false;
  MapBoxNavigationViewController? _controller;
  bool _routeBuilt = false;
  bool _isNavigating = false;
  late MapBoxOptions _navigationOption;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> initialize() async {
    if (!mounted) return;

    _navigationOption = MapBoxNavigation.instance.getDefaultOptions();
    _navigationOption.simulateRoute = true;
    _navigationOption.language = "es";
    MapBoxNavigation.instance.registerRouteEventListener(_onEmbeddedRouteEvent);

    if (_routeBuilt) {
      _controller?.clearRoute();
    } else {
      if (_mapController.response.value != null) {
        var wayPoints = <WayPoint>[];
        wayPoints = _mapController.response.value!.waypoints!.obs;
        _isMultipleStop = wayPoints.length > 2;
        _controller?.buildRoute(
            wayPoints: wayPoints, options: _navigationOption);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 600,
                    child: Container(
                      color: Colors.grey,
                      child: MapBoxNavigationView(
                          options: _navigationOption,
                          onRouteEvent: _onEmbeddedRouteEvent,
                          onCreated: (MapBoxNavigationViewController
                              controller) async {
                            _controller = controller;
                            controller.initialize();
                          }),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /*ElevatedButton(
                            child: const Text("Start A to B"),
                            onPressed: () async {
                              var wayPoints = <WayPoint>[];
                              wayPoints.add(_home);
                              wayPoints.add(_store);
                              var opt = MapBoxOptions.from(_navigationOption);
                              opt.simulateRoute = true;
                              opt.voiceInstructionsEnabled = true;
                              opt.bannerInstructionsEnabled = true;
                              opt.units = VoiceUnits.metric;
                              opt.language = "es-MX";
                              await MapBoxNavigation.instance
                                  .startNavigation(wayPoints: wayPoints, options: opt);
                            },
                          ),*/
                        const SizedBox(
                          width: 10,
                        ),
                        Obx(() {
                          if (_mapController.response.value != null) {
                            return ElevatedButton(
                              child: const Text("Iniciar ruta"),
                              onPressed: () async {
                                _isMultipleStop = true;
                                var wayPoints = <WayPoint>[];
                                wayPoints =
                                    _mapController.response.value!.waypoints!;

                                MapBoxNavigation.instance.startNavigation(
                                    wayPoints: wayPoints,
                                    options: MapBoxOptions(
                                        mode: MapBoxNavigationMode.driving,
                                        simulateRoute: true,
                                        language: "es",
                                        allowsUTurnAtWayPoints: true,
                                        units: VoiceUnits.metric));
                              },
                            );
                          } else {
                            return Container();
                          }
                        }),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() {
                        if (_mapController.response.value != null) {
                          return ElevatedButton(
                            onPressed: _isNavigating ? null : () {},
                            child: Text(_routeBuilt && !_isNavigating
                                ? "Clear Route"
                                : "Build Route"),
                          );
                        } else {
                          return Container();
                        }
                      }),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: _routeBuilt && !_isNavigating
                            ? () {
                                _controller?.startNavigation();
                              }
                            : null,
                        child: const Text('Iniciar'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: _isNavigating
                            ? () {
                                _controller?.finishNavigation();
                              }
                            : null,
                        child: const Text('Cancelar'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Future<void> _onEmbeddedRouteEvent(e) async {
    switch (e.eventType) {
      case MapBoxEvent.progress_change:
        var progressEvent = e.data as RouteProgressEvent;
        if (progressEvent.currentStepInstruction != null) {}
        break;
      case MapBoxEvent.route_building:
      case MapBoxEvent.route_built:
        setState(() {
          _routeBuilt = true;
        });
        break;
      case MapBoxEvent.route_build_failed:
        setState(() {
          _routeBuilt = false;
        });
        break;
      case MapBoxEvent.navigation_running:
        setState(() {
          _isNavigating = true;
        });
        break;
      case MapBoxEvent.on_arrival:
        if (!_isMultipleStop) {
          await Future.delayed(const Duration(seconds: 3));
          await _controller?.finishNavigation();
        } else {}
        break;
      case MapBoxEvent.navigation_finished:
      case MapBoxEvent.navigation_cancelled:
        setState(() {
          _routeBuilt = false;
          _isNavigating = false;
        });
        break;
      default:
        break;
    }
    setState(() {});
  }
}

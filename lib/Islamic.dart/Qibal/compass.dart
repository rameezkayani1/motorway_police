import 'dart:async';
import 'dart:math' show pi;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';

import 'location_error.dart';

class QiblaCompass extends StatefulWidget {
  const QiblaCompass({Key? key}) : super(key: key);

  @override
  State<QiblaCompass> createState() => _QiblaCompassState();

  static void checkLocationStatus(BuildContext context) {}
}

class _QiblaCompassState extends State<QiblaCompass> {
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  @override
  void initState() {
    super.initState();
    _checkLocationStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CupertinoActivityIndicator();
          }
          if (!snapshot.hasData) {
            return LocationErrorWidget(
              error: "Error fetching location status",
              callback: _checkLocationStatus,
            );
          }
          if (snapshot.data!.enabled == true) {
            switch (snapshot.data!.status) {
              case LocationPermission.always:
              case LocationPermission.whileInUse:
                return QiblahCompassWidget();

              case LocationPermission.denied:
                return LocationErrorWidget(
                  error: "Location service permission denied",
                  callback: _checkLocationStatus,
                );
              case LocationPermission.deniedForever:
                return LocationErrorWidget(
                  error: "Location service Denied Forever!",
                  callback: _checkLocationStatus,
                );
              default:
                return LocationErrorWidget(
                  error: "Unknown location permission status",
                  callback: _checkLocationStatus,
                );
            }
          } else {
            return LocationErrorWidget(
              error: "Please enable Location service",
              callback: _checkLocationStatus,
            );
          }
        },
      ),
    );
  }

  Future<void> _checkLocationStatus() async {
    try {
      final locationStatus = await FlutterQiblah.checkLocationStatus();
      if (locationStatus.enabled &&
          locationStatus.status == LocationPermission.denied) {
        await FlutterQiblah.requestPermissions();
        final updatedStatus = await FlutterQiblah.checkLocationStatus();
        _locationStreamController.sink.add(updatedStatus);
      } else {
        _locationStreamController.sink.add(locationStatus);
      }
    } catch (e) {
      print('Error checking location status: $e');
      _locationStreamController.sink.addError(e);
    }
  }

  @override
  void dispose() {
    _locationStreamController.close();
    super.dispose();
  }
}

class QiblahCompassWidget extends StatelessWidget {
  final _kaabaImage = Image.asset('assets/Images/4.png');

  QiblahCompassWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var platformBrightness = Theme.of(context).brightness;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      color: Colors.white, // Set your desired background color here
      child: StreamBuilder(
        stream: FlutterQiblah.qiblahStream,
        builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CupertinoActivityIndicator();
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No data from Qiblah stream'));
          }

          final qiblahDirection = snapshot.data!;
          var angle = ((qiblahDirection.qiblah) * (pi / 180) * -1);

          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Transform.rotate(
                angle: angle,
                child: Image.asset(
                  'assets/Images/5.png', // compass
                  color: platformBrightness == Brightness.dark
                      ? Colors.yellow
                      : Colors.orange,
                ),
              ),
              _kaabaImage,
              Image.asset(
                'assets/Images/3.png', // needle
                color: platformBrightness == Brightness.dark
                    ? Colors.yellow
                    : Colors.orange,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Qibal Direction",
                  textAlign: TextAlign.center,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

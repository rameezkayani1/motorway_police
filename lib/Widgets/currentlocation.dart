import 'package:geolocator/geolocator.dart';

class LocationHelper {
  /// Method to get the current location of the device
  static Future<Position> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Open location settings to enable services
        await Geolocator.openLocationSettings();
        throw Exception('Location services are disabled.');
      }

      // Check and request location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are permanently denied, can't access location
        throw Exception(
            'Location permissions are permanently denied. Cannot access location.');
      }

      // Get and return the current position
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      // Handle errors
      throw Exception('Error obtaining location: $e');
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationUtils {
  /// Memeriksa izin lokasi dan mengembalikan posisi saat ini
  static Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Layanan lokasi tidak diaktifkan. Aktifkan GPS.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Izin lokasi ditolak.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Izin lokasi ditolak secara permanen. Aktifkan di pengaturan.');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  /// Mendapatkan lokasi pengguna saat ini
  Future<Position?> getLocation() async {
    try {
      return await _getCurrentLocation();
    } catch (e) {
      if (kDebugMode) {
        print('Error mendapatkan lokasi: $e');
      }
      return null;
    }
  }

  /// Mendapatkan alamat berdasarkan koordinat
  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        return '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      }
      return 'Alamat tidak ditemukan';
    } catch (e) {
      return 'Gagal mendapatkan alamat: $e';
    }
  }

  /// Menghitung jarak antara lokasi pengguna dengan koordinat tujuan (meter)
  Future<double> calculateDistance(
      double destLatitude, double destLongitude) async {
    try {
      // Position currentPosition = await _getCurrentLocation();

      double distanceInMeters = Geolocator.distanceBetween(
        // currentPosition.latitude,
        // currentPosition.longitude,
        -0.0363906,
        109.3808071,
        destLatitude,
        destLongitude,
      );

      return distanceInMeters / 1000; // Konversi ke kilometer
    } catch (e) {
      if (kDebugMode) {
        print('Error menghitung jarak: $e');
      }
      return -1; // Mengembalikan -1 jika terjadi error
    }
  }
}

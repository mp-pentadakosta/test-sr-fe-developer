import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkerGoogleMaps {
  final String id;
  final double latitude;
  final double longitude;
  final String title;
  final String snippet;

  MarkerGoogleMaps({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.title,
    required this.snippet,
  });
}

class GoogleMapsUtils {
  Widget googleMap({
    required double latitude,
    required double longitude,
    double? zoom,
    required BorderRadius borderRadius,
    MarkerGoogleMaps? marker,
  }) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 15,
        ),
        zoomGesturesEnabled: true,
        myLocationButtonEnabled: false,
        onTap: (argument) async {
          final Uri googleMapsUrl = Uri.parse(
              'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

          if (await canLaunchUrl(googleMapsUrl)) {
            await launchUrl(googleMapsUrl,
                mode: LaunchMode.externalApplication);
          } else {
            if (kDebugMode) {
              print('Tidak dapat membuka Google Maps.');
            }
          }
        },
        onMapCreated: (GoogleMapController controller) {
          controller.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(latitude, longitude),
                zoom: zoom ?? 15,
              ),
            ),
          );
        },
        markers: marker == null
            ? {}
            : {
                Marker(
                  markerId: MarkerId(marker.id),
                  position: LatLng(marker.latitude, marker.longitude),
                  infoWindow: InfoWindow(
                    title: marker.title,
                    snippet: marker.snippet,
                  ),
                ),
              },
      ),
    );
  }
}

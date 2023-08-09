// ignore_for_file: file_names
import 'package:google_maps_webservice/directions.dart' as google_directions;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/distance.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchByMapPage extends StatefulWidget {
  const SearchByMapPage({super.key});

  @override
  State<SearchByMapPage> createState() => _SearchByMapPageState();
}

class _SearchByMapPageState extends State<SearchByMapPage> {
  String _currentAddress = 'Fetching address...';
  LatLng _currentLatLng = const LatLng(0, 0);
  BitmapDescriptor _currentLocationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor _hotelIcon = BitmapDescriptor.defaultMarker;
  GoogleMapController? _mapController;
  LatLng _hotelLatLng = const LatLng(0, 0); // Tọa độ khách sạn
  String hotelAddress = "19C Bùi Thị Xuân, phường Bến Thành, Thành phố Hồ Chí Minh";
   final List<Polyline> _polyLines = [];
  List<LatLng> routePoints = [];
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _getHotelLocation();
    _drawRoute();
    _loadIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Location'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: _currentLatLng,
              zoom: 15.0,
            ),
            // onMapCreated: (controller) {
            //   setState(() {
            //     _mapController = controller;
            //   });
            // _drawRoute2(); // Draw the route when the map is ready
            // },
            markers: {
              Marker(
                markerId: const MarkerId('current_location_marker'),
                position: _currentLatLng,
                icon: _currentLocationIcon,
                infoWindow: InfoWindow(title: 'Current Location', snippet: _currentAddress),
                ),

            Marker(
                  markerId: const MarkerId('hotel_marker'),
                  position: _hotelLatLng,
                  icon: _hotelIcon,
                  infoWindow: InfoWindow(title: 'Hotel', snippet: hotelAddress),
                  onTap: () {
                    _navigateToHotel();
                  },
                ),
              },
            // polylines: {
            //   if(routePoints.isNotEmpty)
            //     Polyline(polylineId: const PolylineId("route"),
            //     color: Colors.blue,
            //     points: routePoints)
            // },
            polylines: _polyLines.toSet(),
            onMapCreated: (controller) {
              setState(() {
                _mapController = controller;

              });
              _drawRoute(); // Draw the route when the map is ready
            },
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(_currentAddress),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    try {
      // Yêu cầu quyền truy cập vị trí từ người dùng trước khi lấy vị trí
      await _requestLocationPermission();

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<geocoding.Placemark> placemarks = await geocoding.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        geocoding.Placemark placemark = placemarks.first;
        String address = "${placemark.name}, ${placemark.locality}, ${placemark.country}";
        LatLng latLng = LatLng(position.latitude, position.longitude);
        setState(() {
          _currentAddress = address;
          _currentLatLng = latLng;
        });
        _mapController?.animateCamera(CameraUpdate.newLatLng(_currentLatLng));
      }
    } catch (e) {
      setState(() {
        _currentAddress = 'Error getting location';
      });
    }
  }

  Future<void> _requestLocationPermission() async {
    final PermissionStatus status = await Permission.location.request();
    if (!status.isGranted) {
      // Xử lý khi người dùng từ chối cấp quyền truy cập vị trí
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }

  Future<void> _getHotelLocation() async {
    List<geocoding.Location> locations = await geocoding.locationFromAddress(hotelAddress);
    if (locations.isNotEmpty) {
      geocoding.Location location = locations.first;
      LatLng hotelLatLng = LatLng(location.latitude, location.longitude);
      setState(() {
        _hotelLatLng = hotelLatLng;
      });
    }
  }

  Future<BitmapDescriptor> getMarkerIcon(String assetName) async {
    final imageConfig = createLocalImageConfiguration(context);
    final BitmapDescriptor bitmapDescriptor =
    await BitmapDescriptor.fromAssetImage(imageConfig, assetName);
    return bitmapDescriptor;
  }
  void _navigateToHotel() async {
    String origin = "${_currentLatLng.latitude},${_currentLatLng.longitude}";
    String destination = "${_hotelLatLng.latitude},${_hotelLatLng.longitude}";
    String url =
        "https://www.google.com/maps/dir/?api=1&origin=$origin&destination=$destination&travelmode=driving";

    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _loadIcons() async {
    final imageConfig = createLocalImageConfiguration(context);

    _currentLocationIcon = await BitmapDescriptor.fromAssetImage(
      imageConfig,
      'assets/location_marker_icon.png',
    );

    _hotelIcon = await BitmapDescriptor.fromAssetImage(
      imageConfig,
      'assets/hotel_marker_icon.png',
    );
  }
  Future<void> _drawRoute() async {
    final google_directions.GoogleMapsDirections directionsService = google_directions.GoogleMapsDirections(
      apiKey: 'AIzaSyAG3SSMXPUldPt4ogGe_lwZIFbqDF7KM6A',
    );

    final google_directions.DirectionsResponse response = await directionsService.directions(
      google_directions.Location(
        lat: _currentLatLng.latitude,
        lng: _currentLatLng.longitude,
      ),
      google_directions.Location(
        lat: _hotelLatLng.latitude,
        lng: _hotelLatLng.longitude,
      ),
      travelMode: google_directions.TravelMode.driving,
    );

    if (response.status == GoogleResponseStatus.okay) {
      final List<LatLng> routePoints = decodePolyline(response.routes[0].overviewPolyline.points);
      final LatLngBounds routeBounds = LatLngBounds(
        southwest: LatLng(
          response.routes[0].bounds.southwest.lat,
          response.routes[0].bounds.southwest.lng,
        ),
        northeast: LatLng(
          response.routes[0].bounds.northeast.lat,
          response.routes[0].bounds.northeast.lng,
        ),
      );
      _mapController?.animateCamera(CameraUpdate.newLatLngBounds(routeBounds, 100.0));

      setState(() {
        _polyLines.add(Polyline(
          polylineId: const PolylineId('route'),
          points: routePoints,
          color: Colors.blue,
          patterns: [
            PatternItem.dash(20.0),
            PatternItem.gap(10)
          ],
          width: 3,
        ));
      });
    }
  }


  List<LatLng> decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0;
    int lng = 0;

    while (index < len) {
      int b;
      int shift = 0;
      int result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      double latitude = lat / 1E5;
      double longitude = lng / 1E5;
      points.add(LatLng(latitude, longitude));
    }
    return points;
  }


}

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MyLocationScreen extends StatefulWidget {
  const MyLocationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyLocationScreenState createState() => _MyLocationScreenState();
}

class _MyLocationScreenState extends State<MyLocationScreen> {
  String _currentAddress = 'Fetching address...';
  LatLng _currentLatLng = const LatLng(0, 0);
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Location'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _currentLatLng,
              zoom: 15.0,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('current_location_marker'),
                position: _currentLatLng,
                infoWindow: InfoWindow(title: 'Current Location', snippet: _currentAddress),
              ),
            },
            onMapCreated: (controller) {
              setState(() {
                _mapController = controller;
              });
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

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
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
}

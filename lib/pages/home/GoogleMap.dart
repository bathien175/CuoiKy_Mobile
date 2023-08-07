

// ignore_for_file: file_names

import 'dart:async';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


class MyLocationScreen extends StatefulWidget {
  const MyLocationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyLocationScreenState createState() => _MyLocationScreenState();
}

class _MyLocationScreenState extends State<MyLocationScreen> {
  String _currentAddress = 'Fetching address...';
  LatLng _currentLatLng = const LatLng(37.7749, -122.4194); // Default location (San Francisco)
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
      if (kDebugMode) {
        print(e);
      }
      setState(() {
        _currentAddress = 'Error getting location';
      });
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: MyLocationScreen(),
  ));
}

class HotelMapScreen extends StatefulWidget {
  const HotelMapScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HotelMapScreenState createState() => _HotelMapScreenState();
}

class _HotelMapScreenState extends State<HotelMapScreen> {
  GoogleMapController? _mapController;
  LatLng _hotelLocation = const LatLng(0, 0); // Tọa độ khách sạn

  @override
  void initState() {
    super.initState();
    _getHotelLocationFromAddress();
  }

  Future<void> _getHotelLocationFromAddress() async {
    try {
      List<Location> locations = await locationFromAddress('Địa chỉ khách sạn');
      if (locations.isNotEmpty) {
        setState(() {
          _hotelLocation = LatLng(locations[0].latitude, locations[0].longitude);
        });
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error getting hotel location: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _hotelLocation,
          zoom: 15,
        ),
        // ignore: prefer_collection_literals
        markers: Set<Marker>.of([
          Marker(
            markerId: const MarkerId('hotel'),
            position: _hotelLocation,
            infoWindow: const InfoWindow(title: 'Khách sạn ABC'),
          ),
        ]),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
      ),
    );
  }
}
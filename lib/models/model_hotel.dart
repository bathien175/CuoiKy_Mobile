// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

class Hotel {
  String hotel_id;
  String hotel_name;
  String hotel_address;
  String hotel_city;
  int hotel_rating;
  int hotel_price;
  String hotel_image;
  String hotel_description;

  Hotel({required this.hotel_id,
    required this.hotel_name,
    required this.hotel_address,
    required this.hotel_city,
    required this.hotel_description,
    required this.hotel_rating,
    required this.hotel_price,
    required this.hotel_image});

}

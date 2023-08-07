import 'package:flutter/material.dart';

class FollowingItem {
  final String id;
  final String hotelName;
  int hotelPrice;
  String hotelImage;
  String hotelCity;

  FollowingItem(this.id, this.hotelName, this.hotelImage, this.hotelCity,
      this.hotelPrice);
}

class PostProvider extends ChangeNotifier {
  final List<FollowingItem> _followingList = [];

  List<FollowingItem> get followingList => _followingList;

  add(String id, String hotelName, String hotelImage, int hotelPrice,
      String hotelCity) {
    FollowingItem item =
        FollowingItem(id, hotelName, hotelImage, hotelCity, hotelPrice);
    _followingList.add(item);
    notifyListeners();
  }

  remove(String id) {
    _followingList.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}

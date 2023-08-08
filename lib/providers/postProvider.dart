import 'package:flutter/material.dart';

class FollowingItem {
  String id;
  String hotelName;
  int hotelPrice;
  String hotelImage;
  String hotelCity;

  FollowingItem(
    this.id,
    this.hotelName,
    this.hotelImage,
    this.hotelCity,
    this.hotelPrice,
  );
}

class PostProvider extends ChangeNotifier {
  final List<FollowingItem> _followingList = [];

  List<FollowingItem> get followingList => _followingList;

  void addFollowing(FollowingItem item) {
    _followingList.add(item);
    notifyListeners();
  }

  void removeFollowing(FollowingItem item) {
    _followingList.removeWhere((element) => element.id == item.id);
    notifyListeners();
  }
}

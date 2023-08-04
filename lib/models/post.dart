import 'package:flutter/material.dart';

// class Hotel {
//   String idPost;
//   String nameHotel;
//   int price;
//   String location;

//   Hotel(this.idPost, this.nameHotel, this.price, this.location);
// }

// class Post extends ChangeNotifier {
//   final List<dynamic> _postList = [];

//   List<dynamic> get postList => _postList; // Fix the getter here

//   void add(String idPost, String nameHotel, int price, String location) {
//     Hotel hotel = Hotel(idPost, nameHotel, price, location);
//     _postList.add(hotel);
//     notifyListeners();
//   }

//   void remove(String idPost) {
//     _postList.removeWhere(
//         (element) => element.idPost == idPost); // Fix the removeWhere here
//     notifyListeners();
//   }
// }

class Post extends ChangeNotifier {
  final List<String> _followingList = [];

  List<String> get followingList => _followingList;

  add(String name) {
    _followingList.add(name);
    notifyListeners();
  }

  remove(String name) {
    _followingList.removeWhere((element) => element == name);
    notifyListeners();
  }
}

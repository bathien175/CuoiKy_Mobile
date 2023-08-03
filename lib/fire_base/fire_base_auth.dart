// ignore_for_file: unused_import, deprecated_member_use, unused_element, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class fireAuth{
   FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void signUp (String Guest_Email, String Guest_Pass, String Guest_Name, String Guest_phone, String GuestID, String Gues_Description, String Guest_Image, String Guest_isBlocked, String Guest_Description, Function onSuccess){
    _firebaseAuth
        .createUserWithEmailAndPassword(email: Guest_Email, password: Guest_Pass).then((Guest)
    {
      _createGuest(Guest_Name, Guest_phone, GuestID, Guest_Description, Guest_Image, Guest_isBlocked, onSuccess);
      print(Guest);
    }).catchError((err){
    });
  }
  _createGuest(String Guest_Name, String Guest_phone, String GuestID, String Guest_Description, String Guest_Image, String Guest_isBlocked, Function onSuccess ){
    var guest = {
      "name": Guest_Name,
      "phone": Guest_phone,
      "image": Guest_Image,
      "isBlock": Guest_isBlocked,
      "id": GuestID,
      "description": Guest_Description
    };
    var ref = FirebaseDatabase.instance.reference().child("Guest");
    ref.child(GuestID).set(guest).then((guest){
      onSuccess();
    }).catchError((err){});
  }
  void signIn (String email, String pass){
    _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass ).then((Guest){
      print("on SigIn success");
    });
  }
}
import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
// ignore: unused_import
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:homelyn/models/current_user.dart';


class ProfileBadge extends StatefulWidget {
  final Widget? child;

  const ProfileBadge({Key? key, required this.child}) : super(key: key);

  @override
  State<ProfileBadge> createState() => _ProfileBadgeState();
}

class _ProfileBadgeState extends State<ProfileBadge> {

  // Function to handle selecting image from gallery or taking a new photo
  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage != null) {
      // Set the temporary image URL to display in the UI
      setState(() {
        CURRENT_USER_IMAGE_TEMP = pickedImage.path;
      });
    }
  }


  // Function to upload image to Firebase Storage
  // Future<String> _uploadImage(File imageFile) async {
  //   String fileName = DateTime.now().toString() + '.png';
  //   firebase_storage.Reference ref =
  //   firebase_storage.FirebaseStorage.instance.ref().child(fileName);
  //   await ref.putFile(imageFile);
  //   return await ref.getDownloadURL();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show a dialog with options to select image from gallery or take a new photo
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Choose an option'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
                child: const Text('Take a photo'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
                child: const Text('Choose from gallery'),
              ),
            ],
          ),
        );
      },
      child: badge.Badge(
        toAnimate: true,
        shape: badge.BadgeShape.circle,
        badgeColor: Colors.white,
        position: badge.BadgePosition.bottomEnd(),
        padding: REdgeInsets.all(3),
        badgeContent: Container(
          padding: REdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Color(0xFF3D5BF6),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset('assets/svg/camera_icon.svg'),
        ),
        child: widget.child,
      ),
    );
  }
}

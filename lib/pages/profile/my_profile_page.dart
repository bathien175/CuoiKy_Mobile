import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:homelyn/components/c_elevated_button.dart';
import 'package:homelyn/widgets/profile_badge.dart';
import 'package:homelyn/models/current_user.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../components/c_text_form_field.dart';
import '../../components/c_text_form_field_readonly.dart';
import '../../config/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../utils/routes.dart';
import '../../widgets/dropdown_custom.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final String initialValue = CURRENT_USER_PHONE;
  String selectedCityValue=CURRENT_USER_CITY;
  String selectedGenderValue=CURRENT_USER_SEX;

  final TextEditingController _fullNameController =
  TextEditingController(text: CURRENT_USER_NAME);

  final TextEditingController _birthdayController =
  TextEditingController(text: CURRENT_USER_BIRTHDAY);

  final TextEditingController _sexController =
  TextEditingController(text: CURRENT_USER_SEX);

  final TextEditingController _addressController =
  TextEditingController(text: CURRENT_USER_ADDRESS);

  final TextEditingController _cityController =
  TextEditingController(text: CURRENT_USER_CITY);

  bool showPhoneField = false;

  @override
  void initState() {
    super.initState();
    showPhoneField = CURRENT_USER_EMAIL.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          RPadding(
            padding: REdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(13.r),
                      decoration: BoxDecoration(
                          boxShadow: kDefaultBoxShadow,
                          color:
                          Theme.of(context).inputDecorationTheme.fillColor,
                          shape: BoxShape.circle),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          CURRENT_USER_IMAGE_TEMP = "";
                          CURRENT_USER_NAME_TEMP = "";
                          CURRENT_USER_BIRTHDAY_TEMP = "";
                          CURRENT_USER_SEX_TEMP = "";
                          CURRENT_USER_ADDRESS_TEMP = "";
                          CURRENT_USER_CITY_TEMP = "";
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).appBarTheme.iconTheme!.color,
                        ),
                      ),
                    ),
                    Text(
                      'My Profile',
                      style: Theme.of(context)
                          .textTheme
                      // ignore: deprecated_member_use
                          .headline4!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Container(
                      padding: EdgeInsets.all(15.r),
                      decoration: const BoxDecoration(
                          color: Colors.transparent, shape: BoxShape.circle),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: ProfileBadge(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50), // Để bo tròn ảnh, thay 50 bằng giá trị bạn muốn
                      child: Image.network(
                        CURRENT_USER_IMAGE_TEMP.isEmpty? CURRENT_USER_IMAGE : CURRENT_USER_IMAGE_TEMP,
                        width: 100, // Giới hạn chiều rộng của ảnh
                        height: 100, // Giới hạn chiều cao của ảnh
                        fit: BoxFit.cover, // Để điều chỉnh ảnh trong khu vực giới hạn
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Full Name',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CTextFormField(
                  hintText: 'Enter your full name',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  prefixIcon: Theme.of(context).brightness == Brightness.light
                      ? SvgPicture.asset('assets/svg/user_light_icon.svg',)
                      : SvgPicture.asset('assets/svg/user_dark_icon.svg',),
                  initialValue: CURRENT_USER_NAME,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      _fullNameController.text = CURRENT_USER_NAME;
                    } else {
                      _fullNameController.text = value;
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  CURRENT_USER_PHONE.isEmpty ? 'Email' : 'Phone Number',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CTextFormFieldReadOnly(
                  hintText: CURRENT_USER_PHONE.isEmpty ? 'Enter your email' : 'Enter your number',
                  textInputAction: TextInputAction.next,
                  keyboardType: CURRENT_USER_PHONE.isEmpty ? TextInputType.emailAddress : TextInputType.phone,
                  prefixIcon: Theme.of(context).brightness == Brightness.light
                      ? SvgPicture.asset(
                    CURRENT_USER_PHONE.isEmpty
                        ? 'assets/svg/email_icon_light.svg'
                        : 'assets/svg/call_icon_light.svg',
                  )
                      : SvgPicture.asset(
                    CURRENT_USER_PHONE.isEmpty
                        ? 'assets/svg/email_icon_dark.svg'
                        : 'assets/svg/call_icon_dark.svg',
                  ),
                  initialValue: CURRENT_USER_PHONE.isEmpty ? CURRENT_USER_EMAIL : CURRENT_USER_PHONE,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Gender',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                // CTextFormField(
                //   hintText: 'Select your gender',
                //   textInputAction: TextInputAction.next,
                //   keyboardType: TextInputType.multiline,
                //   prefixIcon: Theme.of(context).brightness == Brightness.light
                //       ? SvgPicture.asset('assets/svg/sex_icon_light.svg',)
                //       : SvgPicture.asset('assets/svg/sex_icon_dark.svg',),
                //   initialValue: CURRENT_USER_SEX,
                //   onChanged: (value) {
                //     if (value.isEmpty) {
                //       _sexController.text = CURRENT_USER_SEX;
                //     } else {
                //       _sexController.text = value;
                //     }
                //   },
                // ),
                CustomDropdownGender(key: const Key('listgenderselect'),CURRENT_USER_SEX,(selected) {
                  selectedGenderValue = selected;
                }),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Birthday',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CTextFormField(
                  hintText: 'Select your birthday',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.datetime,
                  prefixIcon: Theme.of(context).brightness == Brightness.light
                      ? SvgPicture.asset('assets/svg/birthday_icon_light.svg',)
                      : SvgPicture.asset('assets/svg/birthday_icon_dark.svg',),
                  initialValue: CURRENT_USER_BIRTHDAY,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      _birthdayController.text = CURRENT_USER_BIRTHDAY;
                    } else {
                      _birthdayController.text = value;
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Address',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CTextFormField(
                  hintText: 'Enter your address',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.streetAddress,
                  prefixIcon: Theme.of(context).brightness == Brightness.light
                      ? SvgPicture.asset('assets/svg/address_icon_light.svg',)
                      : SvgPicture.asset('assets/svg/address_icon_dark.svg',),
                  initialValue: CURRENT_USER_ADDRESS,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      _addressController.text = CURRENT_USER_ADDRESS;
                    } else {
                      _addressController.text = value;
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'City',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                // CTextFormField(
                //   hintText: 'Enter your city',
                //   textInputAction: TextInputAction.next,
                //   keyboardType: TextInputType.text,
                //   prefixIcon: Theme.of(context).brightness == Brightness.light
                //       ? SvgPicture.asset('assets/svg/city_icon_light.svg',)
                //       : SvgPicture.asset('assets/svg/city_icon_dark.svg',),
                //   initialValue: CURRENT_USER_CITY,
                //   onChanged: (value) {
                //     if (value.isEmpty) {
                //       _cityController.text = CURRENT_USER_CITY;
                //     } else {
                //       _cityController.text = value;
                //     }
                //   },
                // ),
                CustomDropdown(CURRENT_USER_CITY,key: const Key('ListCity'), (selectValue){
                  selectedCityValue = selectValue;
                }),
                SizedBox(
                  height: 50.h,
                ),
                CElevatedButton(
                    child: const Text('Save Changes'),
                    onPressed: () {
                      _updateUserProfile();
                    }),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteGenerator.changePasswordPage);
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Change Password?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: const Color(0xFF3D5BF6)),
                    ),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _updateUserProfile() async {
    String fullName = _fullNameController.text;
    String sex = selectedGenderValue;
    String birthday = _birthdayController.text;
    String address = _addressController.text;
    String city = selectedCityValue;
    if (fullName.isEmpty) {
      showToast('Please enter your full name.');
      return;
    }
    if (sex.isEmpty) {
      showToast('Please choose your gender.');
      return;
    }
    if (birthday.isEmpty) {
      showToast('Please enter your birthday.');
      return;
    }
    if (address.isEmpty) {
      showToast('Please enter your address.');
      return;
    }
    if (city.isEmpty) {
      showToast('Please enter your city.');
      return;
    }

    try {
      final databaseReference = FirebaseDatabase.instance;
      if (CURRENT_USER_ID.isNotEmpty) {
        String imageUrl = CURRENT_USER_IMAGE_TEMP.isEmpty
            ? CURRENT_USER_IMAGE
            : await _uploadImage(File(CURRENT_USER_IMAGE_TEMP));

        await databaseReference
            .ref()
            .child('guests')
            .child(CURRENT_USER_ID)
            .update({
              'fullname': fullName,
              'image': imageUrl,
              'sex' : sex,
              'birthday' : birthday,
              'address' : address,
              'city' :  city
            });

        showToast('Profile updated successfully!');
        setState(() {
          CURRENT_USER_IMAGE = imageUrl;
          CURRENT_USER_NAME = fullName;
          CURRENT_USER_SEX = sex;
          CURRENT_USER_BIRTHDAY = birthday;
          CURRENT_USER_ADDRESS = address;
          CURRENT_USER_CITY = city;
        });
      } else {
        showToast('User ID is empty. Cannot update the profile.');
      }
    } catch (e) {
      showToast('Error occurred while updating the profile: $e');
    }
  }

  Future<String> _uploadImage(File imageFile) async {
    String fileName = '${DateTime.now()}.png';
    firebase_storage.Reference ref =
    firebase_storage.FirebaseStorage.instance.ref().child(fileName);
    await ref.putFile(imageFile);
    return await ref.getDownloadURL();
  }

  void showToast(String ms){
    Fluttertoast.showToast(msg: ms, fontSize: 16, backgroundColor: Colors.black, textColor: Colors.white, gravity: ToastGravity.BOTTOM, toastLength: Toast.LENGTH_LONG);
  }

}

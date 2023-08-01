import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homelyn/components/c_elevated_button.dart';
import 'package:homelyn/widgets/profile_badge.dart';

import '../../components/c_text_form_field.dart';
import '../../config/constants.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
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
                        child:
                            Image.asset('assets/images/profile_image2.png'))),
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
                    hintText: 'Enter your username',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    prefixIcon: Theme.of(context).brightness == Brightness.light
                        ? SvgPicture.asset(
                            'assets/svg/user_light_icon.svg',
                          )
                        : SvgPicture.asset(
                            'assets/svg/user_dark_icon.svg',
                          )),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Phone Number',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CTextFormField(
                    hintText: 'Enter your number',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    prefixIcon: Theme.of(context).brightness == Brightness.light
                        ? SvgPicture.asset(
                            'assets/svg/call_icon_light.svg',
                          )
                        : SvgPicture.asset(
                            'assets/svg/call_icon_dark.svg',
                          )),
                SizedBox(
                  height: 200.h,
                ),
                CElevatedButton(
                    child: const Text('Save Changes'), onPressed: () {}),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Change Password?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: const Color(0xFF3D5BF6)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

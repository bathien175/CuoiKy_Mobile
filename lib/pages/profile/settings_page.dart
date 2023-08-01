import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homelyn/components/c_cupertino_switch.dart';

import '../../config/constants.dart';
import '../../utils/routes.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool valueFalse = false;
  bool valueTrue = false;
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                      'Settings',
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
                Text('Account Settings',
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.headline4),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                      boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RouteGenerator.myProfilePage);
                    },
                    contentPadding: REdgeInsets.all(0),
                    leading: Theme.of(context).brightness == Brightness.light
                        ? SvgPicture.asset('assets/svg/user_icon_light.svg')
                        : SvgPicture.asset('assets/svg/user_icon_dark.svg'),
                    title: Text(
                      'My Profile',
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                      boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RouteGenerator.notificationSettingsPage);
                    },
                    contentPadding: REdgeInsets.all(0),
                    leading: Theme.of(context).brightness == Brightness.light
                        ? SvgPicture.asset(
                            'assets/svg/notifications_icon_light.svg')
                        : SvgPicture.asset(
                            'assets/svg/notifications_icon_dark.svg'),
                    title: Text(
                      'Notifications',
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                      boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: ListTile(
                    //          onTap: (){
                    //    Navigator.of(context).pushNamed(
                    //                   RouteGenerator.myFavouritePage);
                    // },
                    contentPadding: REdgeInsets.all(0),
                    leading: Theme.of(context).brightness == Brightness.light
                        ? SvgPicture.asset('assets/svg/payouts_icon_light.svg')
                        : SvgPicture.asset('assets/svg/payouts_icon_dark.svg'),
                    title: Text(
                      'Payments and Payouts',
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text('Preferences',
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.headline4),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                      boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RouteGenerator.languagePage);
                    },
                    contentPadding: REdgeInsets.all(0),
                    leading: Theme.of(context).brightness == Brightness.light
                        ? SvgPicture.asset('assets/svg/language_icon_light.svg')
                        : SvgPicture.asset('assets/svg/language_icon_dark.svg'),
                    title: Text(
                      'Language',
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    trailing: SizedBox(
                      width: 80.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('English',
                              // ignore: deprecated_member_use
                              style: Theme.of(context).textTheme.bodyText1),
                          const Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                      boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: ListTile(
                    //          onTap: (){
                    //    Navigator.of(context).pushNamed(
                    //                   RouteGenerator.myFavouritePage);
                    // },
                    contentPadding: REdgeInsets.all(0),
                    leading: Theme.of(context).brightness == Brightness.light
                        ? SvgPicture.asset('assets/svg/moon_icon_light.svg')
                        : SvgPicture.asset('assets/svg/moon_icon_dark.svg'),
                    title: Text(
                      'Dark Mode',
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    trailing: CCupertinoSwitch(
                      valueBool: valueTrue,
                      onChanged: (value) {
                        valueTrue = value;
                        setState(() {});
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                      boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: ListTile(
                    //          onTap: (){
                    //    Navigator.of(context).pushNamed(
                    //                   RouteGenerator.myFavouritePage);
                    // },
                    contentPadding: REdgeInsets.all(0),
                    leading: Theme.of(context).brightness == Brightness.light
                        ? SvgPicture.asset('assets/svg/privacy_icon_light.svg')
                        : SvgPicture.asset('assets/svg/privacy_icon_dark.svg'),
                    title: Text(
                      'Privacy Settings',
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                      boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: ListTile(
                    contentPadding: REdgeInsets.all(0),
                    leading: SvgPicture.asset('assets/svg/logout_icon.svg'),
                    title: Text(
                      'Log Out',
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .subtitle2!
                          .copyWith(color: const Color(0xFFFF4747)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homelyn/config/constants.dart';

import '../../utils/routes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController textControllor = TextEditingController();

  @override
  void initState() {
    super.initState();
    textControllor.addListener(_printLatestValue);
  }

  _printLatestValue() {
    log("text field: ${textControllor.text}");
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    textControllor.dispose();

    super.dispose();
  }

  // mocking a future
  Future<List> fetchSimpleData() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    // ignore: no_leading_underscores_for_local_identifiers
    List _list = <dynamic>[];
    // create a list from the text input of three items
    // to mock a list of items from an http call
    _list.add('Test' ' Item 1');
    _list.add('yes' ' welcome');
    _list.add('Test' ' Item 3');
    return _list;
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
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Profile',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    InkWell(
                       onTap: (){
               Navigator.of(context).pushNamed(
                              RouteGenerator.settingsPage);
            },
                      child: Container(
                        padding: EdgeInsets.all(13.r),
                        decoration: BoxDecoration(
                          boxShadow: kDefaultBoxShadow,
                            color:
                                Theme.of(context).inputDecorationTheme.fillColor,
                            shape: BoxShape.circle),
                        child:Theme.of(context).brightness == Brightness.light
                            ? SvgPicture.asset('assets/svg/settings_icon_light.svg') : 
                            SvgPicture.asset('assets/svg/settings_icon_dark.svg'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 36.h,
                ),
                Image.asset('assets/images/profile_image2.png'),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Marrine Gustav',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                  height: 11.h,
                ),
                Text(
                  'Purwokerto, Indonesia',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 26.h,
                ),
                Container(
                  padding:
                      REdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '26',
                            style: Theme.of(context)
                                .textTheme
                                // ignore: deprecated_member_use
                                .headline1!
                                .copyWith(color: const Color(0xFF3D5BF6)),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            'Transaction',
                            // ignore: deprecated_member_use
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '12',
                            style: Theme.of(context)
                                .textTheme
                                // ignore: deprecated_member_use
                                .headline1!
                                .copyWith(color: const Color(0xFF3D5BF6)),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            'Review',
                            // ignore: deprecated_member_use
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '4',
                            style: Theme.of(context)
                                .textTheme
                                // ignore: deprecated_member_use
                                .headline1!
                                .copyWith(color: const Color(0xFF3D5BF6)),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            'Bookings',
                            // ignore: deprecated_member_use
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Option',
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
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
                     onTap: (){
               Navigator.of(context).pushNamed(
                              RouteGenerator.myFavouritePage);
            },
                    contentPadding: REdgeInsets.all(0),
                    leading: Theme.of(context).brightness == Brightness.light
                          ? SvgPicture.asset('assets/svg/favourite_icon_light.svg') : 
                          SvgPicture.asset('assets/svg/favourite_icon_dark.svg'),
                    title: Text(
                      'My Favourite',
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
                  height: 20.h,
                ),
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                     boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: ListTile(
                     onTap: (){
               Navigator.of(context).pushNamed(
                              RouteGenerator.transactionHistoryPage);
            },
                    contentPadding: REdgeInsets.all(0),
                    leading: Theme.of(context).brightness == Brightness.light
                        ? SvgPicture.asset('assets/svg/clock_light.svg')
                        : SvgPicture.asset('assets/svg/clock_dark.svg'),
                    title: Text(
                      'Transaction',
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
                  height: 20.h,
                ),
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                     boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: ListTile(
                     onTap: (){
               Navigator.of(context).pushNamed(
                              RouteGenerator.myCuponPage);
            },
                    contentPadding: REdgeInsets.all(0),
                    leading: Theme.of(context).brightness == Brightness.light
                        ? SvgPicture.asset(
                            'assets/svg/discount_shape_light.svg')
                        : SvgPicture.asset(
                            'assets/svg/discount_shape_dark.svg'),
                    title: Text(
                      'My Cupon',
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
                  height: 20.h,
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
        ]));
  }
}

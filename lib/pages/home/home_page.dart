import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyn/components/search_text_field.dart';
import 'package:homelyn/config/constants.dart';
import 'package:homelyn/widgets/notifications_badge.dart';

import '../../utils/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textControllor = TextEditingController();

  @override
  void initState() {
    super.initState();
    textControllor.addListener(_printLatestValue);
  }

  _printLatestValue() {
    log("text field: ${textControllor.text}");
  }

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is removed from the
  //   // widget tree.
  //   textControllor.dispose();

  //   super.dispose();
  // }

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // width: 200.w,
                      padding: REdgeInsets.all(14),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color:
                              Theme.of(context).inputDecorationTheme.fillColor,
                          boxShadow: kDefaultBoxShadow),
                      child: Row(
                        children: [
                          Theme.of(context).brightness == Brightness.light
                              ? SvgPicture.asset(
                                  'assets/svg/location_icon_light.svg')
                              : SvgPicture.asset(
                                  'assets/svg/location_icon_light.svg'),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Purwokerto, IND',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF3F6DF6),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                          boxShadow: kDefaultBoxShadow,
                          color:
                              Theme.of(context).inputDecorationTheme.fillColor,
                          shape: BoxShape.circle),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(RouteGenerator.notificationPage);
                          },
                          child: NotificationsBadge(
                            child: Icon(
                              Icons.notifications_outlined,
                              color: Theme.of(context)
                                  .appBarTheme
                                  .iconTheme!
                                  .color,
                            ),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Hello, Marrine!',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: const Color(0xFFA7AEC1)),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  'Let’s find best hotel',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(
                  height: 33.h,
                ),
                SearchTextField(
                  textControllor: textControllor,
                  label: 'Search hotel',
                  hintText: 'Search hotel',
                  future: () {
                    return fetchSimpleData();
                  },
                  prefixIcon: Theme.of(context).brightness == Brightness.light
                      ? SvgPicture.asset('assets/svg/search_icon_light.svg')
                      : SvgPicture.asset('assets/svg/search_icon_light.svg'),
                  suffixIcon: Theme.of(context).brightness == Brightness.light
                      ? SvgPicture.asset('assets/svg/sort_light_icon.svg')
                      : SvgPicture.asset('assets/svg/sort_dark_icon.svg'),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recomended Hotel',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'See All',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          RPadding(
            padding: REdgeInsets.only(left: 24.w),
            child: SizedBox(
              height: 240.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteGenerator.detailPage);
                  },
                  child: Container(
                    width: 240.w,
                    margin: REdgeInsets.only(right: 15.w),
                    padding: REdgeInsets.all(6),
                    decoration: BoxDecoration(
                        boxShadow: kDefaultBoxShadow,
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                        borderRadius: BorderRadius.all(Radius.circular(15.r))),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100.h,
                          width: 228.w,
                          child: Stack(
                            children: [
                              Positioned(
                                  child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)),
                                child: Image.asset(
                                  'assets/images/hotel_image.png',
                                  height: 100.h,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              )),
                              Positioned(
                                  top: 6.h,
                                  right: 6.w,
                                  child: Container(
                                    padding: REdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 6.h),
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            21, 27, 51, 0.2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(60.r))),
                                    child: Text.rich(
                                      textAlign: TextAlign.left,
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '\$46',
                                            style: GoogleFonts.dmSans(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xFFFFFFFF),
                                            ),
                                          ),
                                          TextSpan(
                                            text: '/Night',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFFE2E4EA),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        RPadding(
                          padding: REdgeInsets.symmetric(horizontal: 6.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Diamond Heart Hotel',
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                'Purwokerto, Street No 31, Central Java',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Divider(
                                height: 1.h,
                                thickness: 1,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? const Color(0xFFE7E7E7)
                                    : const Color(0xFF636777),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svg/bed_icon.svg'),
                                      SizedBox(
                                        width: 7.w,
                                      ),
                                      Text(
                                        '2 Beds',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? const Color(0xFFE7E7E7)
                                        : const Color(0xFF636777),
                                    size: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.wifi,
                                        color: Color(0xFF3D5BF6),
                                      ),
                                      SizedBox(
                                        width: 7.w,
                                      ),
                                      Text(
                                        'Wifi',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? const Color(0xFFE7E7E7)
                                        : const Color(0xFF636777),
                                    size: 10,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svg/gym_icon.svg'),
                                      SizedBox(
                                        width: 7.w,
                                      ),
                                      Text(
                                        'Gym',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          RPadding(
            padding: REdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nearby Hotels',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'See All',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                    margin: REdgeInsets.only(bottom: 15.h),
                    padding: REdgeInsets.all(10),
                    decoration: BoxDecoration(
                        boxShadow: kDefaultBoxShadow,
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                        borderRadius: BorderRadius.all(Radius.circular(15.r))),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                            child: Image.asset(
                              'assets/images/hotel_image1.png',
                              width: 76.w,
                              height: 76.h,
                              fit: BoxFit.fill,
                            )),
                        SizedBox(
                          width: 12.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hyatt Washington Hotel',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text('Purwokerto, Glempang',
                                style: Theme.of(context).textTheme.bodyMedium),
                            SizedBox(
                              width: 8.w,
                            ),
                            Row(
                              children: [
                                Text.rich(
                                  textAlign: TextAlign.left,
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\$38',
                                        style: GoogleFonts.dmSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                          color: kBlueColor,
                                        ),
                                      ),
                                      TextSpan(
                                          text: '/Night',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 21.w,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: kYellowColor,
                                      size: 16.r,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text.rich(
                                      textAlign: TextAlign.left,
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '4.7 ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                          TextSpan(
                                              text: '186 Reviews)',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

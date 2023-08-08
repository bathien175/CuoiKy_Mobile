// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyn/components/search_text_field.dart';
import 'package:homelyn/config/constants.dart';

import '../../utils/routes.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textControllor = TextEditingController();

  @override
  void initState() {
    super.initState();
    textControllor.addListener(_printLatestValue);
  }

  _printLatestValue() {
    log("text field: ${textControllor.text}");
  }

  // mocking a future
  Future<List> fetchSimpleData() async {
    await Future.delayed(const Duration(milliseconds: 2000));
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
                    Text(
                      'Search',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Container(
                      padding: EdgeInsets.all(13.r),
                      decoration: BoxDecoration(
                          boxShadow: kDefaultBoxShadow,
                          color:
                              Theme.of(context).inputDecorationTheme.fillColor,
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.notifications_outlined,
                        color: Theme.of(context).appBarTheme.iconTheme!.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 36.h,
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
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Searches',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'Clear All',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: kRedColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                ListTile(
                  contentPadding: REdgeInsets.all(0),
                  leading: Theme.of(context).brightness == Brightness.light
                      ? SvgPicture.asset('assets/svg/clock_light_icon.svg')
                      : SvgPicture.asset('assets/svg/clock_dark_icon.svg'),
                  title: Text(
                    'Semarang',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  subtitle: Text(
                    'Dominic Hotel, Luxury Royale Hotel, Hotel Santika...',
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const Divider(),
                ListTile(
                  contentPadding: REdgeInsets.all(0),
                  leading: Theme.of(context).brightness == Brightness.light
                      ? SvgPicture.asset('assets/svg/clock_light_icon.svg')
                      : SvgPicture.asset('assets/svg/clock_dark_icon.svg'),
                  title: Text(
                    'Bandung',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  subtitle: Text(
                    'Hilton Bandung, Namin Hotel, Clove Garden Hotel...',
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const Divider(),
                ListTile(
                  contentPadding: REdgeInsets.all(0),
                  leading: Theme.of(context).brightness == Brightness.light
                      ? SvgPicture.asset('assets/svg/clock_light_icon.svg')
                      : SvgPicture.asset('assets/svg/clock_dark_icon.svg'),
                  title: Text(
                    'Purwokerto',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  subtitle: Text(
                    'Diamond Heart Hotel, Infinity Castle Hotel, Horizon...',
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recently Viewed',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.searchTypingPage);
                      },
                      child: Text(
                        'See All',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
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
              height: 250.h,
              child: ListView.builder(
                //'notification.metrics.axis == widget.axis': is not true.
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => Container(
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
                                      color:
                                          const Color.fromRGBO(21, 27, 51, 0.2),
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
                              'Rimuru Milim Hotel',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              'Bandung, Sukasari',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            const Divider(),
                            SizedBox(
                              height: 14.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/svg/bed_icon.svg'),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    Text(
                                      '2 Beds',
                                      style:
                                          Theme.of(context).textTheme.bodyMedium,
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
                                      color: kBlueColor,
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    Text(
                                      'Wifi',
                                      style:
                                          Theme.of(context).textTheme.bodyMedium,
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
                                    SvgPicture.asset('assets/svg/gym_icon.svg'),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    Text(
                                      'Gym',
                                      style:
                                          Theme.of(context).textTheme.bodyMedium,
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
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}

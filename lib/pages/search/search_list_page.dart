import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyn/widgets/filter.dart';

import '../../components/search_text_field.dart';
import '../../config/constants.dart';
import '../../utils/routes.dart';

class SearchListPage extends StatefulWidget {
  const SearchListPage({super.key});

  @override
  State<SearchListPage> createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {
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
    List list = <dynamic>[];
    // create a list from the text input of three items
    // to mock a list of items from an http call
    list.add('Test' ' Item 1');
    list.add('yes' ' welcome');
    list.add('Test' ' Item 3');
    return list;
  }

  void _filter(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: ctx,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      builder: (_) {
        return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: const Filter());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: REdgeInsets.symmetric(horizontal: 24.w),
              children: [
                SizedBox(
                  height: 74.h,
                ),
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
                      'Search',
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .headline4!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {
                        _filter(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(13.r),
                        decoration: BoxDecoration(
                            boxShadow: kDefaultBoxShadow,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .fillColor,
                            shape: BoxShape.circle),
                        child: Theme.of(context).brightness == Brightness.light
                            ? SvgPicture.asset(
                                'assets/svg/search_setting_light.svg')
                            : SvgPicture.asset(
                                'assets/svg/search_setting_dark.svg'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
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
                Text(
                  'Popular Hotels',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 20.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                    width: double.infinity,
                    margin: REdgeInsets.only(bottom: 15.h),
                    decoration: BoxDecoration(
                        boxShadow: kDefaultBoxShadow,
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                        borderRadius: BorderRadius.all(Radius.circular(15.r))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 115.h,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Positioned(
                                  child: Image.asset(
                                'assets/images/hotel.png',
                                height: 115.h,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              )),
                              Positioned(
                                  top: 12.h,
                                  right: 12.w,
                                  child: Container(
                                      padding: REdgeInsets.symmetric(
                                          horizontal: 13.w, vertical: 8.h),
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              21, 27, 51, 0.25),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(60.r))),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: kYellowColor,
                                            size: 13.r,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            '4.6',
                                            style: GoogleFonts.dmSans(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: kWhiteColor,
                                            ),
                                          ),
                                        ],
                                      )))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        RPadding(
                          padding: REdgeInsets.symmetric(horizontal: 12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Diamond Heart Hotel',
                                    style:
                                        Theme.of(context).textTheme.headlineSmall,
                                  ),
                                  Text(
                                    '\$46',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Theme.of(context).brightness ==
                                              Brightness.light
                                          ? SvgPicture.asset(
                                              'assets/svg/location_icon_light.svg')
                                          : SvgPicture.asset(
                                              'assets/svg/location_icon_dark.svg'),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Text('Bandung, Sukasari',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                    ],
                                  ),
                                  Text('Per Night',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              const Divider(),
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
                                        color: kBlueColor,
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
                                          'assets/svg/breakfast_icon.svg'),
                                      SizedBox(
                                        width: 7.w,
                                      ),
                                      Text(
                                        'Breakfast',
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
                )
              ],
            ),
          ),
          Positioned(
              bottom: 50.h,
              left: 160,
              right: 160,
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(RouteGenerator.searchByMapPage);
                },
                child: Container(
                  padding:
                      REdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? const Color(0xFF151B33)
                        : kWhiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(40.r)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Theme.of(context).brightness == Brightness.light
                          ? SvgPicture.asset('assets/svg/map_icon_light.svg')
                          : SvgPicture.asset('assets/svg/map_icon_dark.svg'),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Map',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? kWhiteColor
                                    : const Color(0xFF151B33)),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

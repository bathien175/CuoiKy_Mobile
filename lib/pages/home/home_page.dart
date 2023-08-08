import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyn/components/search_text_field.dart';
import 'package:homelyn/config/constants.dart';
import 'package:homelyn/models/current_user.dart';
import 'package:homelyn/widgets/notifications_badge.dart';
import 'package:intl/intl.dart';
import '../../models/current_hotel.dart';
import '../../models/model_hotel.dart';
import '../../utils/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> firebaseData = [];

  void fetchDataFromFirebase() async {
    try {
      print('CHAY DI CON');
      final databaseReference = FirebaseDatabase.instance.reference();

      DatabaseEvent snapshot = await databaseReference.child('hotels').once();

      firebaseData.clear();

      DataSnapshot data = snapshot.snapshot;

      Map<dynamic, dynamic> values = data.value as Map<dynamic, dynamic>;

      values.forEach((key, value) {
        firebaseData.add(Map<String, dynamic>.from(value));
      });
    } catch (e) {
      print('Error fetching data from Firebase: $e');
    }
  }

  TextEditingController textControllor = TextEditingController();
  List<String> listFind = [];
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    textControllor.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromFirebase();
  }

  _printLatestValue() {
    log("text field: ${textControllor.text}");
  }

  // mocking a future
  Future<List> fetchSimpleData() async {
    // ignore: no_leading_underscores_for_local_identifiers
    List _list = <dynamic>[];
    // create a list from the text input of three items
    // to mock a list of items from an http call
    for (var item in listFind) {
      _list.add(item);
    }
    return _list;
  }

  // mocking a future
  Future<List<Hotel>> fetchDataRecomment() async {
    listFind.clear();
    // ignore: deprecated_member_use
    final databaseReference = FirebaseDatabase.instance.reference();
    DataSnapshot snapshot =
        (await databaseReference.child('hotels').once()).snapshot;
    List<Hotel> hotels = [];
    Map<dynamic, dynamic>? hotelData = snapshot.value as Map?;
    if (hotelData != null) {
      hotelData.forEach((key, item) {
        listFind.add(item['hotel_id'] + ': ' + item['hotel_name']);
        hotels.add(
          Hotel(
              hotel_id: item['hotel_id'],
              hotel_name: item['hotel_name'],
              hotel_address: item['hotel_address'],
              hotel_city: item['hotel_city'],
              hotel_rating: item['hotel_rating'].toDouble(),
              count_rating: item['count_rating'],
              hotel_price: item['hotel_price'],
              hotel_image: item['hotel_image'],
              hotel_description: item['hotel_description']),
        );
      });
    }
    return hotels;
  }

  // mocking a future
  Future<List<Hotel>> fetchDataNearby() async {
    // ignore: deprecated_member_use
    final databaseReference = FirebaseDatabase.instance.reference();
    DataSnapshot snapshot = (await databaseReference
            .child('hotels')
            .orderByChild('hotel_city')
            .equalTo(CURRENT_USER_CITY)
            .once())
        .snapshot;
    List<Hotel> hotels = [];
    Map<dynamic, dynamic>? hotelData = snapshot.value as Map?;
    if (hotelData != null) {
      hotelData.forEach((key, item) {
        hotels.add(
          Hotel(
              hotel_id: item['hotel_id'],
              hotel_name: item['hotel_name'],
              hotel_address: item['hotel_address'],
              hotel_city: item['hotel_city'],
              hotel_rating: item['hotel_rating'].toDouble(),
              count_rating: item['count_rating'],
              hotel_price: item['hotel_price'],
              hotel_image: item['hotel_image'],
              hotel_description: item['hotel_description']),
        );
      });
    }
    return hotels;
  }

  @override
  Widget build(BuildContext context) {
    String formatCurrencyVND(double amount) {
      final formatter = NumberFormat.currency(
        locale: 'vi_VN',
        symbol: 'đ',
      );
      return formatter.format(amount);
    }

    fetchDataFromFirebase();
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
                  'Hello, $CURRENT_USER_NAME!', //Tên user
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
              child: FutureBuilder<List<Hotel>>(
                future: fetchDataRecomment(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Hotel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No data available.'),
                    );
                  } else {
                    List<Hotel> hotels = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) => InkWell(
                        //chuyển form detail cho hotel
                        onTap: () {
                          CURRENT_HOTEL = hotels[index].hotel_id;
                          CURRENT_HOTEL_NAME = hotels[index].hotel_name;
                          CURRENT_HOTEL_ADDRESS = hotels[index].hotel_address;
                          CURRENT_HOTEL_DESCRIPTION =
                              hotels[index].hotel_description;
                          CURRENT_HOTEL_IMAGE = hotels[index].hotel_image;
                          CURRENT_HOTEL_CITY = hotels[index].hotel_city;
                          CURRENT_HOTEL_PRICE = hotels[index].hotel_price;
                          CURRENT_HOTEL_RATING =
                              hotels[index].hotel_rating.toDouble();
                          CURRENT_HOTEL_COUNT_RATING =
                              hotels[index].count_rating;
                          Navigator.of(context)
                              .pushNamed(RouteGenerator.detailPage);
                        },
                        child: Container(
                          width: 240.w,
                          margin: REdgeInsets.only(right: 15.w),
                          padding: REdgeInsets.all(6),
                          decoration: BoxDecoration(
                              boxShadow: kDefaultBoxShadow,
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .fillColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r))),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.r)),
                                      child: Image.network(
                                        hotels[index].hotel_image,
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
                                                  text: formatCurrencyVND(
                                                      hotels[index]
                                                          .hotel_price
                                                          .toDouble()),
                                                  style: GoogleFonts.dmSans(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '/Night',
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        const Color(0xFFE2E4EA),
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
                                    //tên khách sạn
                                    Text(
                                      hotels[index].hotel_name,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      hotels[index].hotel_address,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
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
                    );
                  }
                },
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
                FutureBuilder<List<Hotel>>(
                  future: fetchDataNearby(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Hotel>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No data available.'),
                      );
                    } else {
                      List<Hotel> hotels = snapshot.data!;
                      return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemCount: hotels.length,
                          itemBuilder: (context, index) => InkWell(
                              //chuyển form detail cho hotel
                              onTap: () {
                                CURRENT_HOTEL = hotels[index].hotel_id;
                                CURRENT_HOTEL_NAME = hotels[index].hotel_name;
                                CURRENT_HOTEL_ADDRESS =
                                    hotels[index].hotel_address;
                                CURRENT_HOTEL_DESCRIPTION =
                                    hotels[index].hotel_description;
                                CURRENT_HOTEL_IMAGE = hotels[index].hotel_image;
                                CURRENT_HOTEL_CITY = hotels[index].hotel_city;
                                CURRENT_HOTEL_PRICE = hotels[index].hotel_price;
                                CURRENT_HOTEL_RATING =
                                    hotels[index].hotel_rating.toDouble();
                                CURRENT_HOTEL_COUNT_RATING =
                                    hotels[index].count_rating;
                                Navigator.of(context)
                                    .pushNamed(RouteGenerator.detailPage);
                              },
                              child: Container(
                                margin: REdgeInsets.only(bottom: 15.h),
                                padding: REdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  boxShadow: kDefaultBoxShadow,
                                  color: Theme.of(context)
                                      .inputDecorationTheme
                                      .fillColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r)),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.r)),
                                      child: Image.network(
                                        hotels[index].hotel_image,
                                        width: 76.w,
                                        height: 76.h,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          hotels[index].hotel_name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          "${hotels[index].hotel_address.substring(0, 35)}...",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        SizedBox(width: 8.w),
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.r)),
                                              child: Image.network(
                                                hotels[index].hotel_image,
                                                width: 76.w,
                                                height: 76.h,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  hotels[index].hotel_name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                                SizedBox(width: 2.w),
                                                Text(
                                                  hotels[index].hotel_address,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                                SizedBox(width: 8.w),
                                                const Row(
                                                  children: [],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )));
                    }
                  },
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

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}

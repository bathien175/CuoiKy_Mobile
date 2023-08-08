import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyn/models/current_user.dart';
import 'package:homelyn/models/model_hotel.dart';
import 'package:intl/intl.dart';

import '../../config/constants.dart';

class MyFavouritePage extends StatelessWidget {
  const MyFavouritePage({super.key});

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
                      'Favourite',
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
                Text('$CURRENT_USER_FAVOURITES Favourite Items',
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(
                  height: 20.h,
                ),
                FutureBuilder<List<Hotel>>(
                  future: getListFavourites(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Show loading indicator while fetching data
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('No data available.');
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Hotel model = snapshot.data![index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            // Rest of your list item UI code
                            child: Row(
                              children: [
                                ClipRRect(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)),
                                    child: Image.network(
                                      model.hotel_image,
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
                                      model.hotel_name,
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(subStringAddress(model.hotel_address),
                                        style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis,maxLines: 1,),
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
                                                text: formatCurrencyVND(model.hotel_price.toDouble()),
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
                                                    text: '${model.hotel_rating} ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge,
                                                  ),
                                                  TextSpan(
                                                      text: '(${model.count_rating} Reviews)',
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
                          );
                        },
                      );
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

  String subStringAddress(String address){
    if(address.length>40){
      return '${address.substring(0,40)}...';
    }else{
      return address;
    }
  }
  Future<List<Hotel>> getListFavourites() async {
    // ignore: deprecated_member_use
    final databaseReference = FirebaseDatabase.instance.reference();
    DataSnapshot snapshot = (await databaseReference.child('Favourites').orderByChild('user_id').equalTo(CURRENT_USER_ID).once()).snapshot;
    List<String> idHotels = [];
    List<Hotel> hotels = [];
    Map<dynamic, dynamic>? hotelFavourites = snapshot.value as Map?;
    if(hotelFavourites != null){
      hotelFavourites.forEach((key, item) {
        idHotels.add(item['hotel_id']);
      });

      for (var element in idHotels) {
        DataSnapshot snapshot = (await databaseReference.child('hotels').orderByChild('hotel_id').equalTo(element).once()).snapshot;
        Map<dynamic, dynamic> hotelData = snapshot.value as Map;
        hotelData.forEach((key, value) {
          hotels.add(
            Hotel(
                hotel_id: value['hotel_id'],
                hotel_name: value['hotel_name'],
                hotel_address: value['hotel_address'],
                hotel_city: value['hotel_city'],
                hotel_rating: value['hotel_rating'].toDouble(),
                count_rating: value['count_rating'],
                hotel_price: value['hotel_price'],
                hotel_image: value['hotel_image'],
                hotel_description: value['hotel_description']
            ),
          );
        });
      }
    }
    return hotels;
  }
  String formatCurrencyVND(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
    );
    return formatter.format(amount);
  }
}

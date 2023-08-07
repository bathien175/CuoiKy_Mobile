import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyn/providers/postProvider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';

class MyFavouritePage extends StatelessWidget {
  const MyFavouritePage({super.key});
  @override
  Widget build(BuildContext context) {
    String formatCurrencyVND(double amount) {
      final formatter = NumberFormat.currency(
        locale: 'vi_VN',
        symbol: 'đ',
      );
      return formatter.format(amount);
    }

    return Scaffold(
      body: Column(
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
              ],
            ),
          ),
          Consumer<PostProvider>(
            builder: (BuildContext context, PostProvider value, Widget? child) {
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: value.followingList.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Text(
                        "Save recently:",
                        style: TextStyle(
                            color: Color.fromARGB(255, 24, 25, 26),
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  } else {
                    final FollowingItem item = value.followingList[index - 1];
                    return Container(
                      margin: REdgeInsets.only(bottom: 15.h),
                      padding: REdgeInsets.all(10),
                      decoration: BoxDecoration(
                        boxShadow: kDefaultBoxShadow,
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                            child: Image.network(
                              item.hotelImage,
                              width: 76.w,
                              height: 76.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.hotelName,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                item.hotelCity,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(width: 8.w),
                              Row(
                                children: [
                                  Text.rich(
                                    textAlign: TextAlign.left,
                                    TextSpan(
                                      text: formatCurrencyVND(
                                          item.hotelPrice.toDouble()),
                                      style: GoogleFonts.dmSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFFFFFFFF),
                                      ),
                                      children: [
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
                                  SizedBox(width: 21.w),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: kYellowColor,
                                        size: 16.r,
                                      ),
                                      SizedBox(width: 5.w),
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
                                                  .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyn/components/profile_elevated_button.dart';

import '../../config/constants.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

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
                      'Transaction History',
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
                Text('My Bookings',
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.headline4),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: REdgeInsets.only(bottom: 15.h),
                  padding:
                      REdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                  decoration: BoxDecoration(
                      boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('22 Mar 2022, Thu',
                              // ignore: deprecated_member_use
                              style: Theme.of(context).textTheme.bodyText2),
                          Container(
                            padding: REdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 5.h),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(34.r)),
                              color: const Color.fromRGBO(255, 187, 13, 0.1),
                            ),
                            child: Text(
                              'Waiting',
                              style: GoogleFonts.dmSans(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: kYellowColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
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
                                // ignore: deprecated_member_use
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text('2 Guests, 1 Room',
                                  // ignore: deprecated_member_use
                                  style: Theme.of(context).textTheme.bodyText2),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Price',
                                  // ignore: deprecated_member_use
                                  style: Theme.of(context).textTheme.bodyText2),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                '\$184',
                                style: GoogleFonts.dmSans(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: kBlueColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              width: 120.w,
                              height: 35.h,
                              child: ProfileElevatedButton(
                                  child: const Text('Check In'),
                                  onPressed: () {}))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text('Past Transaction',
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.headline4),
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
                    padding:
                        REdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                    decoration: BoxDecoration(
                        boxShadow: kDefaultBoxShadow,
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                        borderRadius: BorderRadius.all(Radius.circular(15.r))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('22 Mar 2022, Thu',
                                style: Theme.of(context).textTheme.bodyMedium),
                            Container(
                              padding: REdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(34.r)),
                                  color:
                                      const Color.fromRGBO(19, 185, 125, 0.1)),
                              child: Text(
                                'Finished',
                                style: GoogleFonts.dmSans(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: kGreenColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
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
                                Text('2 Guests, 1 Room',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total Price',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  '\$184',
                                  style: GoogleFonts.dmSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kBlueColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120.w,
                              height: 35.h,
                              child: ProfileElevatedButton(
                                  child: const Text('Ratings'),
                                  onPressed: () {}),
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

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
                Text('8 Favourite Items',
                    style: Theme.of(context).textTheme.headlineMedium),
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

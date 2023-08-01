import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/constants.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

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
                      'Reviews',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Container(
                        padding: EdgeInsets.all(13.r),
                        decoration: BoxDecoration(
                            boxShadow: kDefaultBoxShadow,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .fillColor,
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.more_vert,
                          color: Theme.of(context).appBarTheme.iconTheme!.color,
                        )),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  margin: REdgeInsets.only(bottom: 10.h),
                  padding: REdgeInsets.all(10),
                  decoration: BoxDecoration(
                      boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          child: Image.asset(
                            'assets/images/hotel_image.png',
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
                            'Diamond Heart Hotel',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            'Purwokerto, Karang Lewas',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
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
                                      style:
                                          Theme.of(context).textTheme.bodyMedium,
                                    ),
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
                                    size: 13.r,
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
                                              .bodyMedium,
                                        ),
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
                SizedBox(
                  height: 30.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 15,
                  padding: REdgeInsets.all(0),
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        contentPadding: REdgeInsets.all(0),
                        leading: Container(
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            'assets/images/notification_image.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Kim Borrdy',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Row(
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
                                  '4.5',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Text(
                          'Amazing! The room is good than the picture. Thanks for amazing experience!',
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Divider(),
                    ],
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

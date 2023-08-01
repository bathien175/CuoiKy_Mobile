import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyn/components/send_text_field.dart';
import 'package:homelyn/widgets/online_badge.dart';

import '../../config/constants.dart';

class MessagesDetailPage extends StatefulWidget {
  const MessagesDetailPage({super.key});

  @override
  State<MessagesDetailPage> createState() => _MessagesDetailPageState();
}

class _MessagesDetailPageState extends State<MessagesDetailPage> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: ListView(
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
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(13.r),
                                decoration: BoxDecoration(
                                    boxShadow: kDefaultBoxShadow,
                                    color: Theme.of(context)
                                        .inputDecorationTheme
                                        .fillColor,
                                    shape: BoxShape.circle),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .iconTheme!
                                        .color,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14.w,
                              ),
                              OnlineBadge(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: Image.asset(
                                    'assets/images/notification_image.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kim Hayo',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text('Online',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              )
                            ],
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
                                color: Theme.of(context)
                                    .appBarTheme
                                    .iconTheme!
                                    .color,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        padding: REdgeInsets.all(10),
                        decoration: BoxDecoration(
                            boxShadow: kDefaultBoxShadow,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .fillColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
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
                                Text(
                                  'Purwokerto, Glempang',
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
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
                      Container(
                        margin: REdgeInsets.only(left: 60.w),
                        padding: REdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: kBlueColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.r),
                              bottomLeft: Radius.circular(15.r),
                              bottomRight: Radius.circular(15.r),
                            )),
                        child: Text(
                          'Hi, is there any room left? I’ll make an order if room is available',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: kWhiteColor),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('8:12 Am',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        margin: REdgeInsets.only(right: 60.w),
                        padding: REdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? const Color(0xFFF9F9F9)
                                    : const Color(0xFF292E32),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.r),
                              bottomLeft: Radius.circular(15.r),
                              bottomRight: Radius.circular(15.r),
                            )),
                        child: Text(
                          'Hello Marine, Yes the room is available, so you can make an order.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: const Color(0xFF8A8D99)),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        margin: REdgeInsets.only(right: 60.w),
                        padding: REdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? const Color(0xFFF9F9F9)
                                    : const Color(0xFF292E32),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.r),
                            )),
                        child: Text(
                          'Thank You! 😁',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: const Color(0xFF8A8D99)),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('8:12 Am',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      SizedBox(
                        height: 600.h,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            // top: 400.h,
            bottom: 50.h,
            left: 24.w,
            right: 24.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                visible
                    ? SizedBox(
                        width: 50.w,
                        height: 132.h,
                        child: Stack(
                          children: [
                            Positioned(
                                child: SvgPicture.asset(
                                    'assets/svg/union_light.svg')),
                            Positioned(
                                top: 12.h,
                                left: 16.w,
                                right: 16.w,
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/svg/gallery_icon.svg'),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Divider(
                                      color: kWhiteColor.withOpacity(0.5),
                                      thickness: 1,
                                      height: 1.h,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SvgPicture.asset(
                                        'assets/svg/message_location.svg'),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Divider(
                                      color: kWhiteColor.withOpacity(0.5),
                                      thickness: 1,
                                      height: 1.h,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SvgPicture.asset(
                                        'assets/svg/document_text.svg'),
                                  ],
                                ))
                          ],
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 12.h,
                ),
                SendTextFormField(
                  hintText: 'Write a reply',
                  prefixIcon: Theme.of(context).brightness == Brightness.light
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              visible = true;
                            });
                          },
                          child: SvgPicture.asset(
                              'assets/svg/paperclip_icon_light.svg'))
                      : InkWell(
                          onTap: () {
                            setState(() {
                              visible = true;
                            });
                          },
                          child: SvgPicture.asset(
                              'assets/svg/paperclip_icon_dark.svg')),
                  suffixIcon: RPadding(
                    padding: REdgeInsets.all(4.0),
                    child: Container(
                      padding: REdgeInsets.all(13),
                      decoration: const BoxDecoration(
                        color: kBlueColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.send,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      //    bottomNavigationBar: Container(

      //     padding: REdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      //    width: double.infinity,
      //       height: 80.h,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(8),
      //         color: Theme.of(context).inputDecorationTheme.fillColor,
      //         boxShadow: kDefaultBoxShadow,
      //       ),
      //       child: SendTextFormField(
      //               hintText: 'Write a reply',
      //               prefixIcon: Theme.of(context).brightness == Brightness.light?
      //               SvgPicture.asset('assets/svg/paperclip_icon_light.svg'):
      //                SvgPicture.asset('assets/svg/paperclip_icon_dark.svg'),
      //                suffixIcon: RPadding(
      //                  padding: REdgeInsets.all(4.0),
      //                  child: Container(
      //                   padding: REdgeInsets.all(13),
      //                   decoration: const BoxDecoration(
      //                     color: Color(0xFF3D5BF6),
      //                     shape: BoxShape.circle,

      //                   ),
      //                   child: const Icon(Icons.send,
      //                   color: Colors.white,
      //                   ),
      //                  ),
      //                ),
      //             ),  ),
    );
  }
}

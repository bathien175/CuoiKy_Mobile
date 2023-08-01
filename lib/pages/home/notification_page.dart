import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyn/config/constants.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
                      'Notification',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Container(
                      padding: EdgeInsets.all(13.r),
                      decoration: BoxDecoration(
                          boxShadow: kDefaultBoxShadow,
                          color:
                              Theme.of(context).inputDecorationTheme.fillColor,
                          shape: BoxShape.circle),
                      child: Theme.of(context).brightness == Brightness.light
                          ? SvgPicture.asset(
                              'assets/svg/settings_icon_light.svg')
                          : SvgPicture.asset(
                              'assets/svg/settings_icon_dark.svg'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 31.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Recent',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          padding: EdgeInsets.all(5.r),
                          decoration: const BoxDecoration(
                              color: kRedColor, shape: BoxShape.circle),
                          child: Text(
                            '4',
                            style: GoogleFonts.dmSans(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                              color: kWhiteColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Mark All Read',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.h,
                ),
                ListTile(
                  contentPadding: REdgeInsets.all(0),
                  leading: Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      'assets/images/notification_image.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kim Hayo Send You a Message',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        '1 m ago',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  subtitle: Text(
                    'Hi mariana, are you looking for hotel in Purwokerto? You can check our hotel',
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Divider(),
                ListTile(
                  contentPadding: REdgeInsets.all(0),
                  leading: Container(
                      padding: REdgeInsets.all(12),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: kYellowColor),
                      child: SvgPicture.asset('assets/svg/system_alert.svg')),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'System Alert',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        '2 m ago',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  subtitle: Text(
                    'Please complete your profile! To make a sure that you remain our user.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Divider(),
                ListTile(
                  contentPadding: REdgeInsets.all(0),
                  leading: Container(
                      padding: REdgeInsets.all(12),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: kGreenColor),
                      child: SvgPicture.asset('assets/svg/user_discount.svg')),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New User Discount',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        '2 m ago',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  subtitle: Text(
                    'Special for new user! You will get 50% off discount in every places.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Divider(),
                ListTile(
                  contentPadding: REdgeInsets.all(0),
                  leading: Container(
                      padding: REdgeInsets.all(12),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: kBlueColor),
                      child:
                          SvgPicture.asset('assets/svg/booking_completed.svg')),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Booking Completed',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        '2 m ago',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  subtitle: Text(
                    'You’ve booked in Invinity Castle Hotel. Please don’t be late to check in.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

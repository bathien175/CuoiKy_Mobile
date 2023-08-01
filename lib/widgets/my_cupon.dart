import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:homelyn/components/c_elevated_button.dart';
import 'package:homelyn/components/radio_list_tile.dart';

import '../config/constants.dart';

class MyCupon extends StatefulWidget {
  const MyCupon({super.key});

  @override
  State<MyCupon> createState() => _MyCuponState();
}

enum SingingCharacter { a, b, c }

class _MyCuponState extends State<MyCupon> {
  SingingCharacter? _groupValue = SingingCharacter.a;
  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: REdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      child: ListView(
        children: [
          Divider(
            color: Theme.of(context).dividerColor,
            thickness: 6,
            height: 6.h,
            endIndent: 120.w,
            indent: 120.w,
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Cupon',
                // ignore: deprecated_member_use
                style: Theme.of(context).textTheme.headline2,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            padding: REdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                boxShadow: kDefaultBoxShadow,
                color: Theme.of(context).inputDecorationTheme.fillColor,
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                border: Border.all(
                    width: 1.5,
                    color: _groupValue == SingingCharacter.a
                        ? kBlueColor
                        : Colors.transparent)),
            child: CRadioListTile(
              secondary: SvgPicture.asset('assets/svg/discount_icon.svg'),
              title: Text(
                '50% Cashback',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: Text.rich(
                textAlign: TextAlign.left,
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Expired in 2 days',
                        style: Theme.of(context).textTheme.bodyMedium),
                    TextSpan(
                      text: ' See Detail',
                      style: GoogleFonts.dmSans(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kBlueColor,
                      ),
                    ),
                  ],
                ),
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              value: SingingCharacter.a,
              groupValue: _groupValue,
              onChanged: (dynamic value) {
                setState(() {
                  _groupValue = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            padding: REdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                boxShadow: kDefaultBoxShadow,
                color: Theme.of(context).inputDecorationTheme.fillColor,
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                border: Border.all(
                    width: 1.5,
                    color: _groupValue == SingingCharacter.b
                        ? kBlueColor
                        : Colors.transparent)),
            child: CRadioListTile(
              secondary: SvgPicture.asset('assets/svg/discount_icon.svg'),
              title: Text(
                '15% Discount',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: Text.rich(
                textAlign: TextAlign.left,
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Expired in 2 days',
                        style: Theme.of(context).textTheme.bodyMedium),
                    TextSpan(
                      text: ' See Detail',
                      style: GoogleFonts.dmSans(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kBlueColor,
                      ),
                    ),
                  ],
                ),
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              value: SingingCharacter.b,
              groupValue: _groupValue,
              onChanged: (dynamic value) {
                setState(() {
                  _groupValue = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            padding: REdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                boxShadow: kDefaultBoxShadow,
                color: Theme.of(context).inputDecorationTheme.fillColor,
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                border: Border.all(
                    width: 1.5,
                    color: _groupValue == SingingCharacter.c
                        ? kBlueColor
                        : Colors.transparent)),
            child: CRadioListTile(
              secondary: SvgPicture.asset('assets/svg/discount_icon.svg'),
              title: Text(
                '10% Cashback',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: Text.rich(
                textAlign: TextAlign.left,
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Expired in 2 days',
                        style: Theme.of(context).textTheme.bodyMedium),
                    TextSpan(
                      text: ' See Detail',
                      style: GoogleFonts.dmSans(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kBlueColor,
                      ),
                    ),
                  ],
                ),
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              value: SingingCharacter.c,
              groupValue: _groupValue,
              onChanged: (dynamic value) {
                setState(() {
                  _groupValue = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          CElevatedButton(child: const Text('Use Cupon'), onPressed: () {}),
        ],
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homelyn/components/c_elevated_button.dart';

class ActionSuccessBottomSheet extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget image;
  final String action;
  void Function() onPressed;

  ActionSuccessBottomSheet(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image,
      required this.action,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(
              color: Theme.of(context).dividerColor,
              thickness: 6,
              height: 6.h,
              endIndent: 120.w,
              indent: 120.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            // issue in svg widget its not center aligned
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 200.h,
                width: 200.w,
                child: image,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              title,
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 14.h,
            ),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40.h,
            ),
            CElevatedButton(onPressed: onPressed, child: Text(action)),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}

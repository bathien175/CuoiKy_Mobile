import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homelyn/components/c_checkbox.dart';
import 'package:homelyn/components/c_elevated_button.dart';

import '../config/constants.dart';
import '../utils/routes.dart';
import 'action_success_bottom_sheet.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  bool value1 = true;
  bool value2 = false;

  void _bookingSuccessful(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: ctx,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: ActionSuccessBottomSheet(
              title: 'Booking Successfull',
              subTitle:
                  'Congratulations! Please check in on the appropriate date. Enjoy your trip!',
              image: Theme.of(context).brightness == Brightness.light
                  ? SvgPicture.asset('assets/svg/booking_successful_light.svg')
                  : Image.asset('assets/images/booking_successful_dark.png'),
              action: 'Close',
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.loginPage,
                );
              }),
        );
      },
    );
  }

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
                'Payment Method',
                style: Theme.of(context).textTheme.displayMedium,
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
                  borderRadius: BorderRadius.all(Radius.circular(15.r))),
              child: CCheckBoxListTile(
                title: Text(
                  'Master Card',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                secondary: SvgPicture.asset('assets/svg/master_card.svg'),
                controlAffinity: ListTileControlAffinity.trailing,
                value: value1,
                onChanged: (bool? checked) {
                  setState(() {
                    value1 = !value1;
                  });
                },
              )),
          SizedBox(
            height: 15.h,
          ),
          Container(
              padding: REdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                  boxShadow: kDefaultBoxShadow,
                  color: Theme.of(context).inputDecorationTheme.fillColor,
                  borderRadius: BorderRadius.all(Radius.circular(15.r))),
              child: CCheckBoxListTile(
                title: Text(
                  'Visa',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                secondary: SvgPicture.asset('assets/svg/visa_icon.svg'),
                controlAffinity: ListTileControlAffinity.trailing,
                value: value2,
                onChanged: (bool? checked) {
                  setState(() {
                    value2 = !value2;
                  });
                },
              )),
          SizedBox(
            height: 15.h,
          ),
          Container(
              decoration: BoxDecoration(
                  boxShadow: kDefaultBoxShadow,
                  color: Theme.of(context).inputDecorationTheme.fillColor,
                  borderRadius: BorderRadius.all(Radius.circular(15.r))),
              child: ListTile(
                title: Text(
                  'Add Debit Card',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                leading: Container(
                  padding: REdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? const Color(0xFFF9F9F9)
                          : kWhiteColor.withOpacity(0.1),
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: kBlueColor, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.add,
                      color: kWhiteColor,
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 30.h,
          ),
          CElevatedButton(
              child: const Text('Confirm and Pay'),
              onPressed: () {
                _bookingSuccessful(context);
              }),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyn/widgets/my_cupon.dart';
import 'package:homelyn/widgets/payment_method.dart';
import 'package:homelyn/widgets/room_and_guests.dart';
import '../../components/c_elevated_button.dart';
import '../../config/constants.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  void _roomAndGuests(BuildContext ctx) {
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
            child: const RoomAndGuests());
      },
    );
  }

  void _selectPayment(BuildContext ctx) {
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
            child: const PaymentMethod());
      },
    );
  }

  void _myCupon(BuildContext ctx) {
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
            child: const MyCupon());
      },
    );
  }

  DateTimeRange dateTimeRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    final start = dateTimeRange.start;
    final end = dateTimeRange.end;
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
                      'Checkout',
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
                  height: 20.h,
                ),
                Text(
                  'Dates',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      border: Border.all(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? const Color(0xFFE2E4EA)
                                  : const Color(0xFF292E32),
                          width: 1.w)),
                  child: ListTile(
                    onTap: () {
                      pickDateRange();
                    },
                    leading: SvgPicture.asset('assets/svg/calender_icon.svg'),
                    title: Text(
                      '${start.day} - ${end.day} ${end.month} ${end.year}',
                      // '${start.day} - ' + DateFormat('dd/MM/yyyy').format(end),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_down),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Guests',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      border: Border.all(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? const Color(0xFFE2E4EA)
                                  : const Color(0xFF292E32),
                          width: 1.w)),
                  child: ListTile(
                    onTap: () {
                      _roomAndGuests(context);
                    },
                    leading: SvgPicture.asset('assets/svg/user_icon.svg'),
                    title: Text(
                      '2 Guests (1 Room)',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_down),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Promo',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      border: Border.all(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? const Color(0xFFE2E4EA)
                                  : const Color(0xFF292E32),
                          width: 1.w)),
                  child: ListTile(
                    onTap: () {
                      _myCupon(context);
                    },
                    leading: SvgPicture.asset('assets/svg/discount_icon.svg'),
                    title: Text(
                      '1 Promo Used',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Divider(),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Payment Details',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$46 x 3 Nights',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('\$138', style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cleaning Fee',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('\$4', style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total (USD)',
                        style: Theme.of(context).textTheme.headlineSmall),
                    Text('\$142', style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: REdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        width: double.infinity,
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).inputDecorationTheme.fillColor,
          boxShadow: kDefaultBoxShadow,
        ),
        child: CElevatedButton(
            child: const Text(
              'Select Payment',
            ),
            onPressed: () {
              _selectPayment(context);
            }),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateTimeRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      saveText: 'Save',
    );
    if (newDateRange == null) return; //pressed x/ calcel
    setState(() {
      dateTimeRange = newDateRange;
    });
  }
}

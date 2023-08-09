import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyn/models/current_hotel.dart';
import 'package:homelyn/widgets/my_cupon.dart';
import 'package:homelyn/widgets/payment_method.dart';
import 'package:homelyn/widgets/room_and_guests.dart';
import 'package:intl/intl.dart';
import '../../components/c_elevated_button.dart';
import '../../config/constants.dart';
import '../../models/current_save_booking.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String guestandRoom = GUEST_AND_ROOM;
  void _roomAndGuests(BuildContext ctx) {
    showModalBottomSheetWithCallback(ctx);
  }
  Future<void> showModalBottomSheetWithCallback(BuildContext ctx) async {
    await showModalBottomSheet(
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
          child: const RoomAndGuests(),
        );
      },
    );
    // Form đã đóng, gọi lại setState() ở đây
    setState(() {
      // Cập nhật trạng thái của guests
      guestandRoom = GUEST_AND_ROOM;
      updateTotalDate();
    });
  }

  String subStringAddress(String address){
    if(address.length>40){
      return '${address.substring(0,35)}...';
    }else{
      return address;
    }
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

  String formatCurrencyVND(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
    );
    return formatter.format(amount);
  }

  // DateTime start = DateTime.now();
  // DateTime end = DateTime.now().add(const Duration(days: 1));

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(const Duration(days: 1)),
  );

  late int totaldDate = dateRange.end.difference(dateRange.start).inDays;

  int cleaningFee = 50000;
  // late int priceRoom = CURRENT_HOTEL_PRICE * totaldDate;
  // late int totalPrice = (CURRENT_HOTEL_PRICE * totaldDate) + cleaningFee;

  late int priceRoom = 0;
  late int totalPrice;

  @override
  void initState() {
    super.initState();
    updateTotalDate(); // Call updateTotalDate in initState
  }

  void updateTotalDate() {
    totaldDate = dateRange.end.difference(dateRange.start).inDays;
    DATE_START = dateRange.start;
    DATE_END = dateRange.end;
    DATE_NIGHTS = totaldDate;
    priceRoom = CURRENT_HOTEL_PRICE * totaldDate * CURRENT_ROOM;
    totalPrice = priceRoom + cleaningFee;
  }

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
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
                          CURRENT_ROOM = 1;
                          CURRENT_CHILDREN = 0;
                          CURRENT_ADULT = 0;
                          GUEST_AND_ROOM = "0 Guests (1 Room)";
                           DATE_START = DateTime.now();
                           DATE_END = DateTime.now().add(const Duration(days: 1));
                           DATE_NIGHTS = 1;
                           CLEANING_FEE = 50000;
                           TOTAL_PRICE = 0;
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
                          child: Image.network(
                            CURRENT_HOTEL_IMAGE,
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
                            CURRENT_HOTEL_NAME,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            subStringAddress(CURRENT_HOTEL_ADDRESS),
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
                                      text: formatCurrencyVND(
                                          CURRENT_HOTEL_PRICE.toDouble()),
                                      style: GoogleFonts.dmSans(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                        color: kBlueColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '/Night',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
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
                                          text: '$CURRENT_HOTEL_RATING ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        TextSpan(
                                          text:
                                              '$CURRENT_HOTEL_COUNT_RATING Reviews)',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
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
                    onTap: () async {
                      await pickDateRange();
                      updateTotalDate();
                    },
                    leading: SvgPicture.asset('assets/svg/calender_icon.svg'),
                    title: Text(
                      // '${start.day}/${start.month}/${start.year} - ${end.day}/${end.month}/${end.year}',
                      '${start.day}/${start.month}/${start.year}',
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
                    onTap: () async {
                      await pickDateRange();
                      updateTotalDate();
                    },
                    leading: SvgPicture.asset('assets/svg/calender_icon.svg'),
                    title: Text(
                      // '${start.day}/${start.month}/${start.year} - ${end.day}/${end.month}/${end.year}',
                      '${end.day}/${end.month}/${end.year}',
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
                      guestandRoom,
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
                    // Text('$CURRENT_HOTEL_PRICE x $totaldDate Nights',
                    //     style: Theme.of(context).textTheme.titleMedium),
                    Text(
                      '${formatCurrencyVND(CURRENT_HOTEL_PRICE.toDouble())}  x $CURRENT_ROOM Room x $totaldDate Nights',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    Text(formatCurrencyVND(priceRoom.toDouble()),
                        style: Theme.of(context).textTheme.titleMedium),
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
                    Text(formatCurrencyVND(cleaningFee.toDouble()),
                        style: Theme.of(context).textTheme.titleMedium),
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
                    Text(formatCurrencyVND(totalPrice.toDouble()),
                        style: Theme.of(context).textTheme.titleMedium),
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
              TOTAL_PRICE = totalPrice;
              _selectPayment(context);
            }),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? selectedDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(2200),
    );

    if (selectedDateRange == null) return;

    setState(() {
      dateRange = selectedDateRange; // Assign the selectedDateRange directly
    });
  }
}

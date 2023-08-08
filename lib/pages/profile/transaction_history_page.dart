
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyn/components/profile_elevated_button.dart';
import 'package:homelyn/models/model_booking.dart';
import 'package:intl/intl.dart';
import '../../config/constants.dart';
import '../../models/current_user.dart';

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
                  padding: REdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    boxShadow: kDefaultBoxShadow,
                    color: Theme.of(context).inputDecorationTheme.fillColor,
                    borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  ),
                  child: FutureBuilder<List<Trans>>(
                    future: getListTrans(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator(); // Show loading indicator while fetching data
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        // ignore: prefer_const_constructors
                        return Text('No transactions available.');
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Trans transaction = snapshot.data![index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                              decoration: BoxDecoration(
                                boxShadow: kDefaultBoxShadow,
                                color: Theme.of(context).inputDecorationTheme.fillColor,
                                borderRadius: const BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // ignore: deprecated_member_use
                                      Text(transaction.date_bookings, style: Theme.of(context).textTheme.bodyText2),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(34)),
                                          color: Color.fromRGBO(255, 187, 13, 0.1),
                                        ),
                                        child: Text(
                                          transaction.status == 1
                                              ? 'Waiting'
                                              : transaction.status == 2
                                              ? 'Success'
                                              : transaction.status == 3
                                              ? 'Error'
                                              : 'Unknown',
                                          style: GoogleFonts.dmSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: transaction.status == 1
                                                ? kYellowColor
                                                : transaction.status == 2
                                                ? kGreenColor
                                                : transaction.status == 3
                                                ? kRedColor
                                                : kDefaultIconLightColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                        child: Image.network(
                                          transaction.hotel_image,
                                          width: 76,
                                          height: 76,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            transaction.hotel_name,
                                            style: Theme.of(context).textTheme.headlineSmall,
                                          ),
                                          const SizedBox(width: 4),
                                          Text('${transaction.guests.toString()} Guests, ${transaction.rooms.toString()} Room', style: Theme.of(context).textTheme.bodyMedium),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Total Price', style: Theme.of(context).textTheme.bodyMedium),
                                          const SizedBox(height: 4),
                                          Text(
                                            formatCurrencyVND(transaction.total_price.toDouble()),
                                            style: GoogleFonts.dmSans(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: kBlueColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 120,
                                        height: 35,
                                        child: ProfileElevatedButton(
                                          child: const Text('Check In'),
                                          onPressed: () {
                                            showToast("Không có gì cả");
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
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
  void showToast(String ms){
    Fluttertoast.showToast(msg: ms, fontSize: 16, backgroundColor: Colors.black, textColor: Colors.white, gravity: ToastGravity.BOTTOM, toastLength: Toast.LENGTH_LONG);
  }
  Future<List<Trans>> getListTrans() async {
    // ignore: deprecated_member_use
    final databaseReference = FirebaseDatabase.instance.reference();
    DataSnapshot snapshot = (await databaseReference.child('Bookings').orderByChild('user_id').equalTo(CURRENT_USER_ID).once()).snapshot;
    List<Trans> trans = [];
    Map<dynamic, dynamic>? hotelBooking = snapshot.value as Map?;
    if(hotelBooking != null){
      hotelBooking.forEach((key, value) {
        trans.add(
          Trans(date_bookings: value['date_bookings'].toString(),
              guests: value['guests'],
              hotel_id: value['hotel_id'].toString(),
              hotel_image: value['hotel_image'].toString(),
              hotel_name: value['hotel_name'].toString(),
              iid: value['iid'].toString(),
              rooms: value['rooms'],
              status: value['status'],
              timestamp: value['timestamp'].toString(),
              total_day: value['total_day'],
              total_price: value['total_price'],
              user_id: value['user_id'].toString())
        );
      });
    }
    return trans;
  }
  String formatCurrencyVND(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
    );
    return formatter.format(amount);
  }
}

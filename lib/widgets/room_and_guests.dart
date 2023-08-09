import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homelyn/components/c_elevated_button.dart';
import 'package:homelyn/config/constants.dart';
import 'package:homelyn/models/current_save_booking.dart';

class RoomAndGuests extends StatefulWidget {
  const RoomAndGuests({super.key});

  @override
  State<RoomAndGuests> createState() => _RoomAndGuestsState();
}

class _RoomAndGuestsState extends State<RoomAndGuests> {

  // int total1 = 0;
  // int total2 = 0;
  // int total3 = 0;
  int roomCount = CURRENT_ROOM;
  int adultCount = CURRENT_ADULT;
  int childrenCount = CURRENT_CHILDREN;

  // ignore: non_constant_identifier_names
  void RoomAndGuestsState() {
    CURRENT_ROOM = roomCount;
    CURRENT_ADULT = adultCount;
    CURRENT_CHILDREN = childrenCount;
    int total = CURRENT_ADULT + CURRENT_CHILDREN;
    GUEST_AND_ROOM = "$total Guests ($CURRENT_ROOM Room)";
  }

  void _saveData() {
    RoomAndGuestsState();
    Navigator.pop(context);
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
                'Room and Guests',
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
          ListTile(
            contentPadding: REdgeInsets.all(0),
            title: Text(
              'Room',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            subtitle: Text('Minimum contains 4 people',
                style: Theme.of(context).textTheme.bodyMedium),
            trailing: SizedBox(
              width: 80.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      roomCount > 1 ? roomCount-- : roomCount;
                      setState(() {});
                    },
                    child: Container(
                      padding: REdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? const Color(0xFFE7E7E7)
                                  : const Color(0xFF636777)),
                      child: Icon(
                        Icons.remove,
                        color: Theme.of(context).appBarTheme.iconTheme!.color,
                        size: 13,
                      ),
                    ),
                  ),
                  Text(roomCount.toString(),
                      style: Theme.of(context).textTheme.titleMedium),
                  InkWell(
                    onTap: () {
                      setState(() {
                        roomCount++;
                      });
                    },
                    child: Container(
                      padding: REdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: kBlueColor),
                      child: const Icon(
                        Icons.add,
                        color: kWhiteColor,
                        size: 13,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Divider(),
          ListTile(
            contentPadding: REdgeInsets.all(0),
            title: Text(
              'Adults',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            subtitle:
                Text('Age 15+', style: Theme.of(context).textTheme.bodyMedium),
            trailing: SizedBox(
              width: 80.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      adultCount > 0 ? adultCount-- : adultCount;
                      setState(() {});
                    },
                    child: Container(
                      padding: REdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? const Color(0xFFE7E7E7)
                                  : const Color(0xFF636777)),
                      child: Icon(
                        Icons.remove,
                        color: Theme.of(context).appBarTheme.iconTheme!.color,
                        size: 13,
                      ),
                    ),
                  ),
                  Text(adultCount.toString(),
                      style: Theme.of(context).textTheme.titleMedium),
                  InkWell(
                    onTap: () {
                      setState(() {
                        adultCount++;
                      });
                    },
                    child: Container(
                      padding: REdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: kBlueColor),
                      child: const Icon(
                        Icons.add,
                        color: kWhiteColor,
                        size: 13,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Divider(),
          ListTile(
            contentPadding: REdgeInsets.all(0),
            title: Text(
              'Childern',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            subtitle: Text('Age 2 - 12',
                style: Theme.of(context).textTheme.bodyMedium),
            trailing: SizedBox(
              width: 80.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      childrenCount > 0 ? childrenCount-- : childrenCount;
                      setState(() {});
                    },
                    child: Container(
                      padding: REdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? const Color(0xFFE7E7E7)
                                  : const Color(0xFF636777)),
                      child: Icon(
                        Icons.remove,
                        color: Theme.of(context).appBarTheme.iconTheme!.color,
                        size: 13,
                      ),
                    ),
                  ),
                  Text(childrenCount.toString(),
                      style: Theme.of(context).textTheme.titleMedium),
                  InkWell(
                    onTap: () {
                      setState(() {
                        childrenCount++;
                      });
                    },
                    child: Container(
                      padding: REdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: kBlueColor),
                      child: const Icon(
                        Icons.add,
                        color: kWhiteColor,
                        size: 13,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          CElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                _saveData();
              }),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}

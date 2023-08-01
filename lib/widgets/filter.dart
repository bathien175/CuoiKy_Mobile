import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homelyn/components/c_cupertino_switch.dart';
import 'package:homelyn/components/c_elevated_button.dart';
import 'package:homelyn/config/constants.dart';
import 'package:homelyn/widgets/sort_by.dart';

import '../components/c_checkbox.dart';
import '../components/c_dropdown_b.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool valueFalse = false;
  bool valueTrue = false;
  bool value1 = true;
  bool value2 = false;
  bool value3 = true;
  bool value4 = false;
  List<DropdownMenuItem<String>> get guests {
    return [
      const DropdownMenuItem<String>(
        value: '1',
        child: Text('3 Guest (2 Adult, 1 Childern )'),
      ),
      const DropdownMenuItem<String>(
        value: '2',
        child: Text('3 Guest (1 Adult, 1 Childern )'),
      ),
    ];
  }

  void _sortBy(BuildContext ctx) {
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
            child: const SortBy());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 700.h,
      padding: REdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  'Filter',
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
            CDropdownButtonFormField(
                hintText: 'Select', items: guests, onChanged: (_) {}),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Price Range',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: CDropdownButtonFormField(
                        hintText: 'Min', items: guests, onChanged: (_) {}),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: CDropdownButtonFormField(
                        hintText: 'Max', items: guests, onChanged: (_) {}),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Divider(),
            ListTile(
                contentPadding: REdgeInsets.all(0),
                title: Text(
                  'Instant Book',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                subtitle: Text('Book without waiting for the host to respond',
                    style: Theme.of(context).textTheme.bodyMedium),
                trailing: CCupertinoSwitch(
                  valueBool: valueTrue,
                  onChanged: (value) {
                    valueTrue = value;
                    setState(() {});
                  },
                )),
            const Divider(),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Facilities',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 16.h,
            ),
            CCheckBoxListTile(
              title: Text(
                'Free Wifi',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              value: value1,
              onChanged: (bool? checked) {
                setState(() {
                  value1 = !value1;
                });
              },
            ),
            CCheckBoxListTile(
              title: Text(
                'Swimming Pool',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              value: value2,
              onChanged: (bool? checked) {
                setState(() {
                  value2 = !value2;
                });
              },
            ),
            CCheckBoxListTile(
              title: Text(
                'TV',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              value: value3,
              onChanged: (bool? checked) {
                setState(() {
                  value3 = !value3;
                });
              },
            ),
            CCheckBoxListTile(
              title: Text(
                'Laundry',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              value: value4,
              onChanged: (bool? checked) {
                setState(() {
                  value4 = !value4;
                });
              },
            ),
            const Divider(),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Ratings',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: REdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      border: Border.all(
                          width: 1.w,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? const Color(0xFFE2E4EA)
                                  : const Color(0xFF202427))),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: kYellowColor,
                        size: 15.r,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text('5', style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                ),
                Container(
                  padding: REdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      border: Border.all(
                          width: 1.w,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? const Color(0xFFE2E4EA)
                                  : const Color(0xFF202427))),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: kYellowColor,
                        size: 15.r,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text('4', style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                ),
                Container(
                  padding: REdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      border: Border.all(
                          width: 1.w,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? const Color(0xFFE2E4EA)
                                  : const Color(0xFF202427))),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: kYellowColor,
                        size: 15.r,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text('3', style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                ),
                Container(
                  padding: REdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      border: Border.all(
                          width: 1.w,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? const Color(0xFFE2E4EA)
                                  : const Color(0xFF202427))),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: kYellowColor,
                        size: 15.r,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text('2', style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                ),
                Container(
                  padding: REdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      border: Border.all(
                          width: 1.w,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? const Color(0xFFE2E4EA)
                                  : const Color(0xFF202427))),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: kYellowColor,
                        size: 15.r,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text('1', style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            CElevatedButton(
                child: const Text('Show 8 Results'),
                onPressed: () {
                  _sortBy(context);
                }),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}

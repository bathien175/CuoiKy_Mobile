import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homelyn/components/c_elevated_button.dart';

import '../components/c_checkbox.dart';

class SortBy extends StatefulWidget {
  const SortBy({super.key});

  @override
  State<SortBy> createState() => _SortByState();
}

class _SortByState extends State<SortBy> {
  bool value1 = true;
  bool value2 = false;
  bool value3 = true;
  bool value4 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
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
                'Sort By',
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
          CCheckBoxListTile(
            title: Text(
              'Lower to Higher Price',
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
              'Near by',
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
              'Free Cancelations',
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
              'Reviews',
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
          SizedBox(
            height: 30.h,
          ),
          CElevatedButton(child: const Text('Apply'), onPressed: () {})
        ],
      ),
    );
  }
}

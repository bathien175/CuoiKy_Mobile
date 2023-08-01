import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homelyn/components/c_cupertino_switch.dart';

import '../../config/constants.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool valueFalse = false;
  bool valueTrue = false;
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
                      'Notification Settings',
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
                ListTile(
                  contentPadding: REdgeInsets.all(0),
                  title: Text(
                    'Newesletter',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('Alerts for the most important stories',
                      style: Theme.of(context).textTheme.bodyMedium),
                  trailing: CCupertinoSwitch(
                    valueBool: valueTrue,
                    onChanged: (value) {
                      valueTrue = value;
                      setState(() {});
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  contentPadding: REdgeInsets.all(0),
                  title: Text(
                    'Recommendation',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('Get info newest promotion',
                      style: Theme.of(context).textTheme.bodyMedium),
                  trailing: CCupertinoSwitch(
                    valueBool: valueFalse,
                    onChanged: (value) {
                      valueFalse = value;
                      setState(() {});
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  contentPadding: REdgeInsets.all(0),
                  title: Text(
                    'Invoice and Payment',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('Information about your payment',
                      style: Theme.of(context).textTheme.bodyMedium),
                  trailing: CCupertinoSwitch(
                    valueBool: valueFalse,
                    onChanged: (value) {
                      valueFalse = value;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

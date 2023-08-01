import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/radio_list_tile.dart';
import '../../config/constants.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

enum SingingCharacter { a, b, c, d }

class _LanguagePageState extends State<LanguagePage> {
  SingingCharacter? _groupValue = SingingCharacter.a;
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
                      'Language',
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
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                      boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      border: Border.all(
                          width: 1.5,
                          color: _groupValue == SingingCharacter.a
                              ? const Color(0xFF3D5BF6)
                              : Colors.transparent)),
                  child: CRadioListTile(
                    secondary: SvgPicture.asset('assets/svg/english_flag.svg'),
                    title: Text(
                      'English',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w500),
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
                              ? const Color(0xFF3D5BF6)
                              : Colors.transparent)),
                  child: CRadioListTile(
                    secondary:
                        SvgPicture.asset('assets/svg/indonesia_flag.svg'),
                    title: Text(
                      'Bahasa Indonesia',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w500),
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
                              ? const Color(0xFF3D5BF6)
                              : Colors.transparent)),
                  child: CRadioListTile(
                    secondary: SvgPicture.asset('assets/svg/chinese_flag.svg'),
                    title: Text(
                      'Chinese',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w500),
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
                          color: _groupValue == SingingCharacter.d
                              ? const Color(0xFF3D5BF6)
                              : Colors.transparent)),
                  child: CRadioListTile(
                    secondary: SvgPicture.asset('assets/svg/deutsch_flag.svg'),
                    title: Text(
                      'Deutsch',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: SingingCharacter.d,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}

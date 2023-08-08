import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/search_text_field.dart';
import '../../config/constants.dart';
import '../../utils/routes.dart';

class SearchTypingPage extends StatefulWidget {
  const SearchTypingPage({super.key});

  @override
  State<SearchTypingPage> createState() => _SearchTypingPageState();
}

class _SearchTypingPageState extends State<SearchTypingPage> {
  TextEditingController textControllor = TextEditingController();

  @override
  void initState() {
    super.initState();
    textControllor.addListener(_printLatestValue);
  }

  _printLatestValue() {
    log("text field: ${textControllor.text}");
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    textControllor.dispose();

    super.dispose();
  }

  // mocking a future
  Future<List> fetchSimpleData() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    List list = <dynamic>[];
    // create a list from the text input of three items
    // to mock a list of items from an http call
    list.add('Test' ' Item 1');
    list.add('yes' ' welcome');
    list.add('Test' ' Item 3');
    return list;
  }

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
                      'Search',
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .headline4!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Container(
                      padding: EdgeInsets.all(13.r),
                      decoration: BoxDecoration(
                          boxShadow: kDefaultBoxShadow,
                          color:
                              Theme.of(context).inputDecorationTheme.fillColor,
                          shape: BoxShape.circle),
                      child: Theme.of(context).brightness == Brightness.light
                          ? SvgPicture.asset(
                              'assets/svg/search_setting_light.svg')
                          : SvgPicture.asset(
                              'assets/svg/search_setting_dark.svg'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                SearchTextField(
                    textControllor: textControllor,
                    label: 'Search hotel',
                    hintText: 'Search hotel',
                    future: () {
                      return fetchSimpleData();
                    },
                    prefixIcon: Theme.of(context).brightness == Brightness.light
                        ? SvgPicture.asset('assets/svg/search_icon_light.svg')
                        : SvgPicture.asset('assets/svg/search_icon_light.svg'),
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      child: Icon(
                        Icons.close,
                        color: Theme.of(context).brightness == Brightness.light
                            ? kWhiteColor
                            : Colors.black,
                      ),
                    )),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Related Result',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RouteGenerator.searchByMapPage);
                  },
                  contentPadding: REdgeInsets.all(0),
                  leading: SvgPicture.asset('assets/svg/location.svg'),
                  title: Text(
                    'Adela Boutique Hotel',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  subtitle: Text(
                    '10 An Thượng 36, My An, Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng',
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                  ),
                ),
                const Divider(),
                ListTile(
                  contentPadding: REdgeInsets.all(0),
                  leading: SvgPicture.asset('assets/svg/location.svg'),
                  title: Text(
                    'Annata Beach Hotel',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  subtitle: Text(
                    '165 Thùy Vân, Thắng Tam, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu',
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                  ),
                ),
                const Divider(),
                ListTile(
                  contentPadding: REdgeInsets.all(0),
                  leading: SvgPicture.asset('assets/svg/location.svg'),
                  title: Text(
                    'Classy Boutique Hotel',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  subtitle: Text(
                    '21 Hàng Cá, Hàng Đào, Quận Hoàn Kiếm, Hà Nội',
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
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

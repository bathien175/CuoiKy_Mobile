import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homelyn/components/search_text_field.dart';
import 'package:homelyn/config/constants.dart';

import '../../utils/routes.dart';

class MessagesEmptyStatePage extends StatefulWidget {
  const MessagesEmptyStatePage({super.key});

  @override
  State<MessagesEmptyStatePage> createState() => _MessagesEmptyStatePageState();
}

class _MessagesEmptyStatePageState extends State<MessagesEmptyStatePage> {
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
    // ignore: no_leading_underscores_for_local_identifiers
    List _list = <dynamic>[];
    // create a list from the text input of three items
    // to mock a list of items from an http call
    _list.add('Test' ' Item 1');
    _list.add('yes' ' welcome');
    _list.add('Test' ' Item 3');
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            shrinkWrap: true,
            //scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            children: [
          // SizedBox(
          //   height: 10.h,
          // ),
          RPadding(
            padding: REdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Messages',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    InkWell(
                      onTap: (){
                                           Navigator.of(context).pushNamed(
                              RouteGenerator.messagesPage);
                      },
                      child: Container(
                        padding: EdgeInsets.all(13.r),
                        decoration: BoxDecoration(
                          boxShadow: kDefaultBoxShadow,
                            color:
                                Theme.of(context).inputDecorationTheme.fillColor,
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.notifications_outlined,
                          color: Theme.of(context).appBarTheme.iconTheme!.color,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 36.h,
                ),
                SearchTextField(
                  textControllor: textControllor,
                  label: 'Search or start new chat',
                  hintText: 'Search or start new chat',
                  future: () {
                    return fetchSimpleData();
                  },
                  prefixIcon: Theme.of(context).brightness == Brightness.light
                          ? SvgPicture.asset('assets/svg/search_icon_light.svg') : 
                          SvgPicture.asset('assets/svg/search_icon_light.svg'),
                 
                ),
                SizedBox(
                  height: 103.h,
                ),
                Center(
                    child: Theme.of(context).brightness == Brightness.light
                        ? SvgPicture.asset(
                            'assets/svg/messages_empty_state_light.svg')
                        : SvgPicture.asset(
                            'assets/svg/messages_empty_state_dark.svg')),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: Text(
                    'No Messages Here',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Center(
                  child: Text(
                    'Let’s start messaging with others or with seller',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

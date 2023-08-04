import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homelyn/models/post.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';

class MyFavouritePage extends StatelessWidget {
  const MyFavouritePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      'Favourite',
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
              ],
            ),
          ),
          Consumer<Post>(
            builder: (BuildContext context, Post value, Widget? child) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: value.followingList.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Text(
                        "You are favourite:",
                        style: TextStyle(
                          color: Color.fromARGB(
                              255, 217, 8, 8), // Thay đổi màu chữ
                          fontSize: 20, // Thay đổi kích thước font
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(value.followingList[index - 1]),
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

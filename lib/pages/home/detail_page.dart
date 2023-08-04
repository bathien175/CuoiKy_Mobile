import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homelyn/models/post.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final CarouselController _controller = CarouselController();
  ListTile eachTile(Post post, String name, String initials) {
    return ListTile(
      title: Text(name),
      leading: CircleAvatar(
        child: Text(initials),
      ),
      trailing: IconButton(
        icon: (post.followingList.contains(name))
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
        onPressed: () {
          if (post.followingList.contains(name)) {
            post.remove(name);
          } else {
            post.add(name);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Replace Post with PostProvider here
    Post post = Provider.of<Post>(context);

    final List<String> imageList = [
      'assets/images/detail_image.png',
      'assets/images/detail_image.png',
      'assets/images/detail_image.png',
      'assets/images/detail_image.png',
    ];
    final List<Widget> imagesSlider = imageList
        .map((item) => Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              width: double.infinity,
              height: 360.h,
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset(
                      item,
                      width: double.infinity,
                      height: 360.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 25.h,
                    right: 0,
                    left: 0,
                    child: RPadding(
                      padding: REdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(13.r),
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(21, 27, 51, 0.35),
                              shape: BoxShape.circle,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: kWhiteColor,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(13.r),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(21, 27, 51, 0.35),
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset(
                                      'assets/svg/upload_icon.svg'),
                                ),
                              ),
                              SizedBox(
                                width: 17.w,
                              ),
                              Container(
                                padding: EdgeInsets.all(13.r),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(21, 27, 51, 0.35),
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset(
                                      'assets/svg/favourite_icon_dark.svg'),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ))
        .toList();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 360,
              width: double.infinity,
              child: CarouselSlider(
                items: imagesSlider,
                carouselController: _controller,
                options: CarouselOptions(
                  height: 360,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    // Không cần gọi setState ở đây.
                  },
                ),
              ),
            ),
            Consumer<Post>(
              builder: (BuildContext context, Post value, Widget? child) {
                return ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    eachTile(value, "Ba Thien", "EM"),
                    eachTile(value, "Van Trung", "KW"),
                    eachTile(value, "Tuan Kiet", "KK"),
                    eachTile(value, "Quang Huy", "KB"),
                    eachTile(value, "Tien Dung", "TH"),
                    eachTile(value, "Trong Huynh", "LJ"),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar code...
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyn/components/c_elevated_button.dart';

import '../../config/constants.dart';
import '../../utils/routes.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'assets/images/detail_image.png',
      'assets/images/detail_image.png',
      'assets/images/detail_image.png',
      'assets/images/detail_image.png',
    ];
    final List<Widget> imagesSlider = imageList
        .map((item) => Container(
              margin: REdgeInsets.symmetric(horizontal: 10.w),
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
                  )),
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
                                  shape: BoxShape.circle),
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
                                      shape: BoxShape.circle),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: SvgPicture.asset(
                                          'assets/svg/upload_icon.svg')),
                                ),
                                SizedBox(
                                  width: 17.w,
                                ),
                                Container(
                                  padding: EdgeInsets.all(13.r),
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(21, 27, 51, 0.35),
                                      shape: BoxShape.circle),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: SvgPicture.asset(
                                          'assets/svg/favourite_icon_dark.svg')),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
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
              height: 360.h,
              width: double.infinity,
              child: CarouselSlider(
                items: imagesSlider,
                carouselController: _controller,
                options: CarouselOptions(
                    height: 360.h,
                    autoPlay: true,
                    //  // enlargeCenterPage: true,
                    //   //aspectRatio: 2.0,
                    //   disableCenter: true,
                    //   padEnds: true,
                    onPageChanged: (index, reason) {
                      setState(() {});
                    }),
              ),
            ),
            RPadding(
              padding: REdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Diamond Heart Hotel',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Theme.of(context).brightness == Brightness.light
                              ? SvgPicture.asset(
                                  'assets/svg/location_icon_light.svg')
                              : SvgPicture.asset(
                                  'assets/svg/location_icon_light.svg'),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text('Purwokerto, Karang Lewas',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: kYellowColor,
                            size: 16.r,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text.rich(
                            textAlign: TextAlign.left,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '4.7 ',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                TextSpan(
                                  text: '186 Reviews)',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Text.rich(
                    textAlign: TextAlign.left,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '\$38',
                          style: GoogleFonts.dmSans(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: kBlueColor,
                          ),
                        ),
                        TextSpan(
                          text: ' Per Night',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text.rich(
                    textAlign: TextAlign.left,
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'Diamond Heart Hotel is high rated hotels in Middle Java Purwokerto with 120+ reviews and have high attitude service.',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        TextSpan(
                          text: '  Read More',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Theme.of(context).brightness == Brightness.light
                              ? SvgPicture.asset(
                                  'assets/svg/wifi_icon_light.svg')
                              : SvgPicture.asset(
                                  'assets/svg/wifi_icon_dark.svg'),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text('Wifi',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Theme.of(context).brightness == Brightness.light
                              ? SvgPicture.asset(
                                  'assets/svg/shower_icon_light.svg')
                              : SvgPicture.asset(
                                  'assets/svg/shower_icon_dark.svg'),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text('Shower',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Theme.of(context).brightness == Brightness.light
                              ? SvgPicture.asset(
                                  'assets/svg/breakfast_icon_light.svg')
                              : SvgPicture.asset(
                                  'assets/svg/breakfast_icon_dark.svg'),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text('Breakfast',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Theme.of(context).brightness == Brightness.light
                              ? SvgPicture.asset(
                                  'assets/svg/gym_icon_light.svg')
                              : SvgPicture.asset(
                                  'assets/svg/gym_icon_dark.svg'),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text('Gym',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Location',
                          style: Theme.of(context).textTheme.headlineMedium),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteGenerator.locationDetailsPage);
                        },
                        child: Text('View Detail',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding: REdgeInsets.all(6),
                    decoration: BoxDecoration(
                        boxShadow: kDefaultBoxShadow,
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                        borderRadius: BorderRadius.all(Radius.circular(15.r))),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 120.h,
                          width: 317.w,
                          child: Stack(
                            children: [
                              Positioned(
                                  child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)),
                                child: Image.asset(
                                  'assets/images/map_image.png',
                                  height: 120.h,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              )),
                              Positioned(
                                  top: 29.h,
                                  right: 0,
                                  left: 0,
                                  child: Container(
                                      padding: REdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: kBlueColor.withOpacity(0.3),
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                          'assets/svg/location_icon.svg')))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        RPadding(
                          padding: REdgeInsets.symmetric(horizontal: 6.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Theme.of(context).brightness ==
                                          Brightness.light
                                      ? SvgPicture.asset(
                                          'assets/svg/location_icon_light.svg')
                                      : SvgPicture.asset(
                                          'assets/svg/location_icon_light.svg'),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                      'Haight Streetm Purwokerto, Karang Lewas',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                'View Details',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: kBlueColor),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Reviews',
                          style: Theme.of(context).textTheme.headlineMedium),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteGenerator.reviewsPage);
                        },
                        child: Text('See All',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    padding: REdgeInsets.all(0),
                    itemBuilder: (context, index) => Column(
                      children: [
                        ListTile(
                          contentPadding: REdgeInsets.all(0),
                          leading: Container(
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: Image.asset(
                              'assets/images/notification_image.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Kim Borrdy',
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: kYellowColor,
                                    size: 13.r,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    '4.5',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          subtitle: Text(
                            'Amazing! The room is good than the picture. Thanks for amazing experience!',
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: REdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        width: double.infinity,
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).inputDecorationTheme.fillColor,
          boxShadow: kDefaultBoxShadow,
        ),
        child: Row(
          children: [
            Container(
                padding: REdgeInsets.all(15),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Theme.of(context).brightness == Brightness.light
                            ? const Color(0xFF9FB6FA)
                            : const Color(0xFF808080),
                        width: 1.w)),
                child: SvgPicture.asset('assets/svg/message_icon.svg')),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
                child: CElevatedButton(
                    child: const Text(
                      'Book Now',
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(RouteGenerator.checkoutPage);
                    }))
          ],
        ),
      ),
    );
  }
}

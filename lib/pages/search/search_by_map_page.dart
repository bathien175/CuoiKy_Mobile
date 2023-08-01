import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homelyn/components/search_text_field.dart';

import '../../config/constants.dart';

class SearchByMapPage extends StatefulWidget {
  const SearchByMapPage({super.key});

  @override
  State<SearchByMapPage> createState() => _SearchByMapPageState();
}

class _SearchByMapPageState extends State<SearchByMapPage> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  final Completer<GoogleMapController> _controller = Completer();
  LatLng initialLocation = const LatLng(10.895618, 106.610761);

  TextEditingController textControllor = TextEditingController();
  @override
  void initState() {
    addCustomIcon;
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/location_marker_icon.png")
        .then((icon) {
      setState(() {
        markerIcon = icon;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: initialLocation,
                zoom: 15,
              ),
              onMapCreated: (controller) {
                _controller.complete(controller);
              },
              markers: {
                Marker(
                    markerId: const MarkerId("1"),
                    position: initialLocation,
                    draggable: true,
                    onDragEnd: (value) {},
                    icon: markerIcon),
              },
              // circles: {
              //   Circle(
              //     circleId: CircleId("2"),
              //      center: initialLocation,
              //      radius: 450,
              //      strokeWidth: 0,
              //      fillColor: Color(0xFF9FB6FA).withOpacity(0.2)
              //     )
              // },
            ),
          ),
          Positioned(
              top: 30.h,
              right: 24.w,
              left: 24.w,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(13.r),
                          decoration: BoxDecoration(
                              boxShadow: kDefaultBoxShadow,
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .fillColor,
                              shape: BoxShape.circle),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Theme.of(context)
                                  .appBarTheme
                                  .iconTheme!
                                  .color,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                            child: SearchTextField(
                          textControllor: textControllor,
                          label: 'Search location',
                          hintText: 'Search location',
                          future: () {},
                          prefixIcon:
                              Theme.of(context).brightness == Brightness.light
                                  ? SvgPicture.asset(
                                      'assets/svg/search_icon_light.svg')
                                  : SvgPicture.asset(
                                      'assets/svg/search_icon_light.svg'),
                          suffixIcon:
                              Theme.of(context).brightness == Brightness.light
                                  ? SvgPicture.asset(
                                      'assets/svg/map_search_icon_light.svg')
                                  : SvgPicture.asset(
                                      'assets/svg/map_search_icon_dark.svg'),
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 530.h,
                  ),
                  Container(
                    padding: REdgeInsets.all(10),
                    decoration: BoxDecoration(
                        boxShadow: kDefaultBoxShadow,
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                        borderRadius: BorderRadius.all(Radius.circular(15.r))),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                            child: Image.asset(
                              'assets/images/hotel_image1.png',
                              width: 76.w,
                              height: 76.h,
                              fit: BoxFit.fill,
                            )),
                        SizedBox(
                          width: 12.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hyatt Washington Hotel',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text('Purwokerto, Glempang',
                                style: Theme.of(context).textTheme.bodyMedium),
                            SizedBox(
                              width: 8.w,
                            ),
                            Row(
                              children: [
                                Text.rich(
                                  textAlign: TextAlign.left,
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\$38',
                                        style: GoogleFonts.dmSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                          color: kBlueColor,
                                        ),
                                      ),
                                      TextSpan(
                                          text: '/Night',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 21.w,
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                          TextSpan(
                                              text: '186 Reviews)',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

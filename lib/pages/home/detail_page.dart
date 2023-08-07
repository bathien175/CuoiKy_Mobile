import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyn/components/c_elevated_button.dart';
import 'package:intl/intl.dart';

import '../../config/constants.dart';
import '../../models/current_hotel.dart';
import '../../models/model_hotel.dart';
import '../../models/model_rating.dart';
import '../../utils/routes.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final CarouselController _controller = CarouselController();
  bool showFullDescription = false;
  late Future<Hotel> _currentHotel;

  @override
  void initState() {
    super.initState();
    _currentHotel = getCurrentHotel(CURRENT_HOTEL);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Hotel>(
      future: _currentHotel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Hiển thị tiến trình tải dữ liệu hoặc hình ảnh thay thế
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Xử lý lỗi nếu có
          return Text('Error: ${snapshot.error}');
        } else {
          final currentHotel = snapshot.data!;
          // Tiếp tục xây dựng giao diện dựa trên dữ liệu currentHotel
          final List<String> imageList = [
            currentHotel.hotel_image,
            currentHotel.hotel_image,
            currentHotel.hotel_image,
            currentHotel.hotel_image,
          ];
          final List<Widget> imagesSlider = imageList
              .map((item) => Container(
            margin: REdgeInsets.symmetric(horizontal: 10.w),
            width: double.infinity,
            height: 360.h,
            child: Stack(
              children: [
                Positioned(
                    child: Image.network(
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
                          currentHotel.hotel_name,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Column(
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
                                Text(subStringAddress(currentHotel.hotel_address),
                                    style: Theme.of(context).textTheme.bodyLarge,),
                              ],
                            ),
                            const SizedBox(height: 10,),
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
                                        text: '${currentHotel.hotel_rating.toDouble()} ',
                                        style: Theme.of(context).textTheme.titleLarge,
                                      ),
                                      TextSpan(
                                        text: '(${currentHotel.count_rating} Reviews)',
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
                                text: formatCurrencyVND(currentHotel.hotel_price.toDouble()),
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
                                showFullDescription
                                    ? currentHotel.hotel_description
                                    : currentHotel.hotel_description.substring(
                                    0, 100), // Chỉ hiển thị 100 ký tự đầu tiên
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              if (!showFullDescription)
                                TextSpan(
                                  text: '  ...Read More',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                    color: Colors
                                        .blue, // Màu xanh dương cho phần Read More
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        showFullDescription =
                                        true; // Cập nhật biến showFullDescription khi nhấn vào "Read More"
                                      });
                                    },
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
                                    .pushNamed(RouteGenerator.locationDetailsPage); //trang tọa độ
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
                                            subStringAddress(CURRENT_HOTEL_ADDRESS),
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
                        FutureBuilder<List<RatingHotel>>(
                          future: getListComment(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const CircularProgressIndicator(); // Hiển thị tiến trình đang chờ dữ liệu
                            } else if (snapshot.hasError) {
                              return const Text('Đã xảy ra lỗi'); // Hiển thị lỗi nếu có
                            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return const Text('Không có dữ liệu'); // Hiển thị nếu không có dữ liệu
                            } else {
                              final commentList = snapshot.data!;
                              return ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const BouncingScrollPhysics(),
                                itemCount: getCountList(commentList.length), // Số lượng phần tử trong danh sách đánh giá
                                padding: REdgeInsets.all(0),
                                itemBuilder: (context, index) {
                                  final comment = commentList[index]; // Lấy đánh giá tương ứng với chỉ số index
                                  return Column(
                                    children: [
                                      ListTile(
                                        contentPadding: REdgeInsets.all(0),
                                        leading: Container(
                                          decoration: const BoxDecoration(shape: BoxShape.circle),
                                          child: Image.network(
                                            comment.user_image, // Đặt đường dẫn ảnh người dùng từ đánh giá
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              comment.user_name, // Lấy tên người dùng từ đánh giá
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
                                                  comment.rating.toString(), // Lấy rating từ đánh giá
                                                  style: Theme.of(context).textTheme.titleLarge,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        subtitle: Text(
                                          comment.comment, // Lấy bình luận từ đánh giá
                                          style: Theme.of(context).textTheme.bodyMedium,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const Divider(),
                                    ],
                                  );
                                },
                              );
                            }
                          },
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
                        //Muốn lấy được id hotel thì dùng
                        //currentHotel.hotel_id
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
          // Đoạn mã bạn đã viết trong hàm build ở trên
        }
      },
    );
  }

  Future<Hotel> getCurrentHotel(String hotelID) async {
    // ignore: deprecated_member_use
    final databaseReference = FirebaseDatabase.instance.reference();
    // Kiểm tra xem email đã tồn tại trong bảng "guests" chưa
    DataSnapshot snapshot = (await databaseReference.child('hotels').orderByChild('hotel_id').equalTo(hotelID).once()).snapshot;
    Map<dynamic, dynamic> hotelData = snapshot.value as Map;
    List<Hotel> listHotel = <Hotel>[];
    hotelData.forEach((key, value) {
      listHotel.add(Hotel(
        hotel_address: value['hotel_address'].toString(),
        hotel_city: value['hotel_city'].toString(),
        hotel_description: value['hotel_description'].toString(),
        hotel_id: value['hotel_id'].toString(),
        hotel_image: value['hotel_image'].toString(),
        hotel_name: value['hotel_name'].toString(),
        hotel_rating: value['hotel_rating'].toDouble(),
        count_rating: value['count_rating'],
        hotel_price: value['hotel_price'],
      ));
    });
      return listHotel[0];
  }

  Future<List<RatingHotel>> getListComment() async {
    List<RatingHotel> listH = <RatingHotel>[];
    // ignore: deprecated_member_use
    final databaseReference = FirebaseDatabase.instance.reference();
    // Kiểm tra xem email đã tồn tại trong bảng "guests" chưa
    DataSnapshot snapshot = (await databaseReference.child('Reviews').orderByChild('hotel_id').equalTo(CURRENT_HOTEL).once()).snapshot;
    Map<dynamic, dynamic>? hotelData = snapshot.value as Map?;
    if(hotelData!=null){
      hotelData.forEach((key, value) {
        listH.add(RatingHotel(iid: value['iid'],
            user_name: value['user_name'],
            comment: value['review'],
            rating: value['rating'],
            user_image: value['user_image']));
      });
    }
    return listH;
  }

  int getCountList(int countl){
    if(countl>5){
      return 5;
    }else{
      return countl;
    }
  }
  String subStringAddress(String address){
    if(address.length>40){
      return '${address.substring(0,40)}...';
    }else{
      return address;
    }
  }

  String formatCurrencyVND(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
    );
    return formatter.format(amount);
  }
}

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyn/models/model_rating.dart';
import 'package:intl/intl.dart';

import '../../config/constants.dart';
import '../../models/current_hotel.dart';
import '../../models/current_user.dart';
import '../../models/model_hotel.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  final _reviewController = TextEditingController();


  @override
  void initState() {
    super.initState();
    loadRating();
  }
  // ignore: non_constant_identifier_names
  String _rating_id = "";
  bool _isUpdate = false;
  double _rating = 0;
  String _review = "";
  int _visibleItemCount = 5;
  // ignore: non_constant_identifier_names
  int list_range = 0;

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
                      'Reviews',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Container(
                        padding: EdgeInsets.all(13.r),
                        decoration: BoxDecoration(
                            boxShadow: kDefaultBoxShadow,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .fillColor,
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.more_vert,
                          color: Theme.of(context).appBarTheme.iconTheme!.color,
                        )),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
            Container(
              margin: REdgeInsets.only(bottom: 10.h),
              padding: REdgeInsets.all(10),
              decoration: BoxDecoration(
                  boxShadow: kDefaultBoxShadow,
                  color: Theme.of(context).inputDecorationTheme.fillColor,
                  borderRadius: BorderRadius.all(Radius.circular(15.r))),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      child: Image.network(
                        // hotel.hotel_image,
                        CURRENT_HOTEL_IMAGE,
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
                        // hotel.hotel_name,
                        CURRENT_HOTEL_NAME,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        // subStringAddress(hotel.hotel_address),
                        subStringAddress(CURRENT_HOTEL_ADDRESS),
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
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
                                  // text: formatCurrencyVND(hotel.hotel_price.toDouble()),
                                  text: formatCurrencyVND(CURRENT_HOTEL_PRICE.toDouble()),
                                  style: GoogleFonts.dmSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kBlueColor,
                                  ),
                                ),
                                TextSpan(
                                  text: '/Night',
                                  style:
                                  Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
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
                              Text.rich(
                                textAlign: TextAlign.left,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      // text: hotel.hotel_rating.toString(),
                                      text: CURRENT_HOTEL_RATING.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    TextSpan(
                                      // text: ' ${hotel.count_rating} Reviews)',
                                      text: ' ($CURRENT_HOTEL_COUNT_RATING Reviews)',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
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
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Đánh giá:',
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: List.generate(5, (index) {
                    final starCount = index + 1;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _rating = starCount.toDouble();
                        });
                      },
                      child: Icon(
                        _rating >= starCount ? Icons.star : Icons.star_border,
                        size: 60.r,
                        color: kYellowColor,
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Bình luận:',
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 8.h),
                TextField(
                  controller: _reviewController,
                  maxLength: 255,
                  onChanged: (value) {
                    setState(() {
                      _review = value;
                    }
                    );
                  },
                  decoration: const InputDecoration(
                    hintText: 'Nhập bình luận của bạn...',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Thực hiện lưu đánh giá và bình luận vào cơ sở dữ liệu của bạn
                    // Có thể gọi API hoặc thực hiện xử lý tương tự ở đây
                    reviewHotel();
                  },
                  child: const Text('Gửi đánh giá'),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Bình luận trước đó:',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: FutureBuilder<List<RatingHotel>>(
                    future: getListComment(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator(); // Hiển thị tiến trình đang chờ dữ liệu
                      } else if (snapshot.hasError) {
                        return const Text('Đã xảy ra lỗi'); // Hiển thị lỗi nếu có
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text('Không có dữ liệu'); // Hiển thị nếu không có dữ liệu
                      } else {
                        List<RatingHotel> commentList = snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
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
                                Divider(
                                  height: 10.h,
                                  thickness: 1,
                                  color: Colors.grey.withOpacity(0.5),
                                  indent: 10.w,
                                  endIndent: 10.w,
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  )
                ),
                RPadding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _visibleItemCount += 5;
                          if (_visibleItemCount > list_range) {
                            _visibleItemCount = list_range;
                          }
                        });
                      },
                      child: const Text('Xem thêm'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
// hàm
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
        list_range++;
      });
    }
    return listH;
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
        hotel_rating: value['hotel_rating'],
        count_rating: value['count_rating'],
        hotel_price: value['hotel_price'],
      ));
    });
    return listHotel[0];
  }

  String formatCurrencyVND(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
    );
    return formatter.format(amount);
  }

  String subStringAddress(String address){
    if(address.length>40){
      return '${address.substring(0,35)}...';
    }else{
      return address;
    }
  }


  Future<void> reviewHotel() async {
    String cmt = _review;
    if(cmt==""){
      showToast('Bạn chưa viết review của bạn!');
    }else{
      if(cmt.length < 10){
        showToast('Viết ít nhất 10 ký tự!');
      }else{
         if(_rating==0){
           showToast('Hãy chọn ít nhất 1 sao!');
         }else{
           try {
             //code thêm vào firebase
             if (_isUpdate==true) {
               // Code update
               // ignore: deprecated_member_use
               final DatabaseReference reviewRef = FirebaseDatabase.instance.reference()
                   .child('Reviews/$_rating_id');

               await reviewRef.update({
                 'rating': _rating,
                 'review': cmt,
                 'timestamp': ServerValue.timestamp,
               });
             } else {
               // Code thêm mới
               // ignore: deprecated_member_use
               final DatabaseReference reviewRef = FirebaseDatabase.instance.reference()
                   .child('Reviews');
               DatabaseReference newreviewRef = reviewRef.push(); // Tạo mới một child node trong 'Reviews'
               String newReviewKey = newreviewRef.key!;

               await reviewRef.child(newReviewKey).set({
                 'iid': newReviewKey,
                 'hotel_id': CURRENT_HOTEL,
                 'user_id': CURRENT_USER_ID,
                 'user_image': CURRENT_USER_IMAGE,
                 'user_name': CURRENT_USER_NAME,
                 'rating': _rating,
                 'review': cmt,
                 'timestamp': ServerValue.timestamp,
               });
               _rating_id = newReviewKey;
               _isUpdate = true;
             }
             showToast('Đánh giá thành công!');
             //gọi hàm đếm lại rating
             reLoadRating();
           } catch (e){
             showToast('Hệ thống đang quá tải');
           }
         }
      }
    }
  }

  void showToast(String ms){
    Fluttertoast.showToast(msg: ms, fontSize: 16, backgroundColor: Colors.black, textColor: Colors.white, gravity: ToastGravity.BOTTOM, toastLength: Toast.LENGTH_LONG);
  }


  Future<void> loadRating() async {
    bool update = false;
    // Kiểm tra xem user có đánh giá khách sạn này chưa
    // ignore: deprecated_member_use
    DataSnapshot snapshot = (await FirebaseDatabase.instance.reference().child('Reviews').orderByChild('user_id').equalTo(CURRENT_USER_ID).once()).snapshot;
    Map<dynamic, dynamic>? ratingData = snapshot.value as Map?;
    if(ratingData!=null){
      ratingData.forEach((key, value) {
        if(value['hotel_id']==CURRENT_HOTEL){
          setState(() {
            _rating_id = value['iid'];
            update = true;
            _rating = value['rating'].toDouble();
            _reviewController.text = value['review'];
          });
        }
      }
      );
      _isUpdate = update;
    }
  }

  Future<void> reLoadRating() async {
    int countReview = 0;
    double rating = 0;
    // Kiểm tra xem khách sạn đã có được rating chưa
    // ignore: deprecated_member_use
    DataSnapshot snapshot = (await FirebaseDatabase.instance.reference().child('Reviews').orderByChild('hotel_id').equalTo(CURRENT_HOTEL).once()).snapshot;
    Map<dynamic, dynamic>? ratingData = snapshot.value as Map?;

    if(ratingData!=null){
      ratingData.forEach((key, value) {
        countReview++;
        rating += value['rating'];
      });
      rating = rating / countReview;
      // ignore: deprecated_member_use
      final DatabaseReference reviewRef = FirebaseDatabase.instance.reference()
          .child('hotels/$CURRENT_HOTEL_NAME');

      await reviewRef.update({
        'hotel_rating': rating,
        'count_rating': countReview
      });

      setState(() {
        CURRENT_HOTEL_RATING = rating;
        CURRENT_HOTEL_COUNT_RATING = countReview;
      });
    }
  }

  int getCountList(int count){
    if(count>=_visibleItemCount){
      return _visibleItemCount;
    }else{
      return count;
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: ReviewsPage(),
  ));
}

import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homelyn/config/constants.dart';
import 'package:homelyn/models/current_user.dart';
import '../../utils/routes.dart';
import '../welcome/welcome_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController textControllor = TextEditingController();
  @override
  void initState() {
    super.initState();
    textControllor.addListener(_printLatestValue);
    loadProfileUser();
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
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Profile',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    InkWell(
                       onTap: (){
                           Navigator.of(context).pushNamed(
                                          RouteGenerator.settingsPage);
                        },
                      child: Container(
                        padding: EdgeInsets.all(13.r),
                        decoration: BoxDecoration(
                          boxShadow: kDefaultBoxShadow,
                            color:
                                Theme.of(context).inputDecorationTheme.fillColor,
                            shape: BoxShape.circle),
                        child:Theme.of(context).brightness == Brightness.light
                            ? SvgPicture.asset('assets/svg/settings_icon_light.svg') : 
                            SvgPicture.asset('assets/svg/settings_icon_dark.svg'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 36.h,
                ),
                // Image.asset('assets/images/profile_image2.png'),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50), // Để bo tròn ảnh, thay 50 bằng giá trị bạn muốn
                  child: Image.network(
                    CURRENT_USER_IMAGE,
                    width: 100, // Giới hạn chiều rộng của ảnh
                    height: 100, // Giới hạn chiều cao của ảnh
                    fit: BoxFit.cover, // Để điều chỉnh ảnh trong khu vực giới hạn
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  CURRENT_USER_NAME,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                // SizedBox(
                //   height: 11.h,
                // ),
                // Text(
                //   CURRENT_USER_ID,
                //   style: Theme.of(context).textTheme.bodyLarge,
                // ),
                SizedBox(
                  height: 26.h,
                ),
                Container(
                  padding:
                      REdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            CURRENT_USER_TRANS.toString(),
                            style: Theme.of(context)
                                .textTheme
                                // ignore: deprecated_member_use
                                .headline1!
                                .copyWith(color: const Color(0xFF3D5BF6)),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            'Transactions',
                            // ignore: deprecated_member_use
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            CURRENT_USER_REVIEWS.toString(),
                            style: Theme.of(context)
                                .textTheme
                                // ignore: deprecated_member_use
                                .headline1!
                                .copyWith(color: const Color(0xFF3D5BF6)),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            'Reviews',
                            // ignore: deprecated_member_use
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            CURRENT_USER_FAVOURITES.toString(),
                            style: Theme.of(context)
                                .textTheme
                                // ignore: deprecated_member_use
                                .headline1!
                                .copyWith(color: const Color(0xFF3D5BF6)),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            'Favourites',
                            // ignore: deprecated_member_use
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Option',
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                     boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: ListTile(
                     onTap: (){
               Navigator.of(context).pushNamed(
                              RouteGenerator.myFavouritePage);
            },
                    contentPadding: REdgeInsets.all(0),
                    leading: Theme.of(context).brightness == Brightness.light
                          ? SvgPicture.asset('assets/svg/favourite_icon_light.svg') : 
                          SvgPicture.asset('assets/svg/favourite_icon_dark.svg'),
                    title: Text(
                      'My Favourite',
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                     boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: ListTile(
                     onTap: (){
                         Navigator.of(context).pushNamed(
                                        RouteGenerator.transactionHistoryPage);
                      },
                    contentPadding: REdgeInsets.all(0),
                    leading: Theme.of(context).brightness == Brightness.light
                        ? SvgPicture.asset('assets/svg/clock_light.svg')
                        : SvgPicture.asset('assets/svg/clock_dark.svg'),
                    title: Text(
                      'Transaction',
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                     boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: ListTile(
                     onTap: (){
               Navigator.of(context).pushNamed(
                              RouteGenerator.myCuponPage);
            },
                    contentPadding: REdgeInsets.all(0),
                    leading: Theme.of(context).brightness == Brightness.light
                        ? SvgPicture.asset(
                            'assets/svg/discount_shape_light.svg')
                        : SvgPicture.asset(
                            'assets/svg/discount_shape_dark.svg'),
                    title: Text(
                      'My Cupon',
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                     boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: ListTile(
                    onTap: () {
                      CURRENT_USER_ID = "";
                      CURRENT_USER_NAME = "";
                      CURRENT_USER_IMAGE = "";
                      CURRENT_USER_CITY = "";
                      CURRENT_USER_ADDRESS = "";
                      CURRENT_USER_EMAIL = "";
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const WelcomePage()),
                      );
                    },
                    contentPadding: REdgeInsets.all(0),
                    leading: SvgPicture.asset('assets/svg/logout_icon.svg'),
                    title: Text(
                      'Log Out',
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .subtitle2!
                          .copyWith(color: const Color(0xFFFF4747)),
                    ),
                  ),
                )
              ],
            ),
          )
        ]));
  }

  Future<void> loadProfileUser() async {
    int trans = 0;
    int reviews = 0;
    int favourites = 0;
    // ignore: deprecated_member_use
    final databaseReference = FirebaseDatabase.instance.reference();
    DataSnapshot snapshotTrans = (await databaseReference.child('Bookings').orderByChild('user_id').equalTo(CURRENT_USER_ID).once()).snapshot;
    Map<dynamic, dynamic>? transData = snapshotTrans.value as Map?;
    if(transData!=null){
      transData.forEach((key, value) {
        trans++;
      });
    }

    DataSnapshot snapshotReviews = (await databaseReference.child('Reviews').orderByChild('user_id').equalTo(CURRENT_USER_ID).once()).snapshot;
    Map<dynamic, dynamic>? reviewsData = snapshotReviews.value as Map?;
    if(reviewsData!=null){
      reviewsData.forEach((key, value) {
        reviews++;
      });
    }

    DataSnapshot snapshotFavourites = (await databaseReference.child('Favourites').orderByChild('user_id').equalTo(CURRENT_USER_ID).once()).snapshot;
    Map<dynamic, dynamic>? reviewsFavourties = snapshotFavourites.value as Map?;
    if(reviewsFavourties!=null){
      reviewsFavourties.forEach((key, value) {
        favourites++;
      });
    }

    CURRENT_USER_TRANS = trans;
    CURRENT_USER_REVIEWS = reviews;
    CURRENT_USER_FAVOURITES = favourites;
  }
}

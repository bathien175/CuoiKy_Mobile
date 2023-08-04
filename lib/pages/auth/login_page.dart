import 'package:homelyn/models/current_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../config/constants.dart';
import '../../providers/password_provider.dart';
import '../../utils/routes.dart';
import '/components/c_elevated_button.dart';
import '/components/c_text_form_field.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  void showToast(String ms){
    Fluttertoast.showToast(msg: ms, fontSize: 16, backgroundColor: Colors.black, textColor: Colors.white, gravity: ToastGravity.BOTTOM, toastLength: Toast.LENGTH_LONG);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.all(7.r),
            decoration: BoxDecoration(
                boxShadow: kDefaultBoxShadow,
                color: Theme.of(context).inputDecorationTheme.fillColor,
                shape: BoxShape.circle),
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).appBarTheme.iconTheme!.color,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: REdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(
            height: 30.h,
          ),
          Text(
            'Welcome to Valcursa',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            'Please login to your account',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            'Phone Number',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10.h,
          ),
          CTextFormField(
              hintText: 'Enter your number',
              textControllor: _phoneController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              prefixIcon: Theme.of(context).brightness == Brightness.light
                  ? SvgPicture.asset(
                      'assets/svg/call_icon_light.svg',
                    )
                  : SvgPicture.asset(
                      'assets/svg/call_icon_dark.svg',
                    )),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Password',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10.h,
          ),
          Consumer<PasswordProvider>(
            builder: (context, pp, child) {
              return CTextFormField(
                textControllor: _passwordController,
                //..text = 'test421',
                obscureText: pp.isObscure,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                hintText: 'Enter your password',
                prefixIcon: Theme.of(context).brightness == Brightness.light
                    ? SvgPicture.asset(
                        'assets/svg/lock_icon_light.svg',
                      )
                    : SvgPicture.asset(
                        'assets/svg/lock_icon_dark.svg',
                      ),
                suffixIcon: IconButton(
                  onPressed: () {
                    pp.toggleIsObscure();
                  },
                  icon: Icon(pp.isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                ),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter password';
                //   } else if (value.length < 7) {
                //     return 'Please enter at least 8 characters password';
                //   }
                //   return null;
                // },
              );
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                RouteGenerator.forgotPasswordPage,
              );
            },
            child: Text(
              'Forgot Password?',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: const Color(0xFF3D5BF6),
                  ),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(
            height: 75.h,
          ),
          CElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                // Navigator.of(context).pushNamed(
                //   RouteGenerator.navigationPage,
                // );}
                signInWithPhoneNumber();}
              ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Or login with',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    await handleSignInWithGoogle();

                    setState(() {

                    });
                  },
                  child: Container(
                    padding: REdgeInsets.symmetric(vertical: 14.h),
                    decoration: BoxDecoration(
                      boxShadow: kDefaultBoxShadow,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.all(Radius.circular(28.r)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/google_icon.svg'),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          'Google',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                padding: REdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                    color: const Color(0xFF486AB1),
                    borderRadius: BorderRadius.all(Radius.circular(28.r))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/facebook_icon.svg'),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text('Facebook',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontWeight: FontWeight.w500)),
                  ],
                ),
              ))
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                RouteGenerator.registerPage,
              );
            },
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Don’t have an account?  ',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextSpan(
                    text: 'Register',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: const Color(0xFF3D5BF6)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      showToast("Đăng nhập không thành công");
      return null;
    }
  }
  // Loại bỏ số 0 ở đầu sđt người dùng nhập 0123 -> 123 để hệ thống gửi tin nhắn đến +84 123
  String _removeLeadingZero(String phoneNumber) {
    if (phoneNumber.startsWith('0')) {
      return phoneNumber.substring(1);
    }
    return phoneNumber;
  }

  Future<void> signInWithPhoneNumber() async {
    String phone = "+84 ${_removeLeadingZero(_phoneController.text)}";
    // ignore: deprecated_member_use
    final databaseReference = FirebaseDatabase.instance.reference();

    DataSnapshot snapshot = (await databaseReference.child('guests')
        .orderByChild('phoneNumber')
        .equalTo(phone)
        .once()).snapshot;

    Map<dynamic, dynamic>? usersData = snapshot.value as Map?;

    if(usersData!=null){
      //có tồn tài một số điện thoại
      // Lọc kết quả theo điều kiện mật khẩu
      Map<dynamic, dynamic> filteredUsers = {};
      usersData.forEach((key, userData) {
        if (userData['password'] == _passwordController.text) {
          // Xử lý lấy dữ liệu người dùng

          showToast("Đăng nhập thành công!");
          CURRENT_USER_ID = userData['uid'].toString();
          CURRENT_USER_NAME = userData['fullname'].toString();
          CURRENT_USER_IMAGE = userData['image'].toString();
          Navigator.of(context).pushNamed(
            RouteGenerator.navigationPage,
          );
        }else{
          showToast("Sai mật khẩu!");
        }
      });
    }else {
      showToast("Tài khoản chưa được đăng ký!");
    }
  }

  Future<void> handleSignInWithGoogle() async {
    try {
      // Thực hiện đăng nhập bằng Google
      UserCredential? userCredential = await signInWithGoogle();

      // Kiểm tra xem đăng nhập có thành công hay không
      if (userCredential != null) {
        // Đăng nhập thành công
        User? user = userCredential.user;
        String? displayName = user?.displayName;
        String? email = user?.email;

        // Lưu dữ liệu vào Firebase Realtime Database
        if (displayName != null && email != null) {
          // ignore: deprecated_member_use
          final databaseReference = FirebaseDatabase.instance.reference();

          // Kiểm tra xem email đã tồn tại trong bảng "guests" chưa
          DataSnapshot snapshot = (await databaseReference.child('guests').orderByChild('email').equalTo(email).once()).snapshot;

          if (snapshot.value != null) {
            // Nếu email đã tồn tại, báo đăng nhập thành công
            Fluttertoast.showToast(msg: "Đăng nhập thành công", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, textColor: Colors.black, fontSize: 16);
            CURRENT_USER_ID = userCredential.user!.uid;
            CURRENT_USER_NAME = displayName;
            CURRENT_USER_IMAGE = userCredential.user!.photoURL!;
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushNamed(
              RouteGenerator.navigationPage,
            );
          } else {
            // Nếu email chưa tồn tại, tiến hành lưu tài khoản và thông báo đăng ký thành công
            await databaseReference.child('guests').push().set({
              'uid': userCredential.user!.uid,
              'fullname': displayName,
              'email': email,
              'image': userCredential.user!.photoURL
            });
            Fluttertoast.showToast(msg: "Tạo tài khoản thành công", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, textColor: Colors.black, fontSize: 16);
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushNamed(
              RouteGenerator.navigationPage,
            );
            CURRENT_USER_ID = userCredential.user!.uid;
            CURRENT_USER_NAME = displayName;
            CURRENT_USER_IMAGE = userCredential.user!.photoURL!;
          }
        }
      } else {
        // Đăng nhập thất bại
        showToast('Đăng nhập không thành công.');
      }
    } catch (e) {
      // Xử lý lỗi nếu có
      showToast('Đã xảy ra lỗi phía server');
    }
  }

}

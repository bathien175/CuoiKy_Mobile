import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homelyn/pages/auth/register_page.dart';
import 'package:homelyn/widgets/action_success_bottom_sheet.dart';
import '../../config/constants.dart';
import '../../utils/routes.dart';
import '/components/c_elevated_button.dart';
import '/components/c_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyAccountPage extends StatefulWidget {
  const VerifyAccountPage({super.key});

  @override
  State<VerifyAccountPage> createState() => _VerifyAccountPageState();
}

class _VerifyAccountPageState extends State<VerifyAccountPage> {
  final _verificationCodeController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  void _accountCreated(BuildContext ctx) async {
    try {
      // Get the current user from Firebase Auth
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Get the phone number and password entered by the user
        String phoneNumber = '+84 ${RegisterPage.phone}';
        String password = RegisterPage.password;
        String fullname = RegisterPage.fullname;

        // Save the user data to the database
        await saveUserDataToDatabase(user.uid,fullname ,phoneNumber, password);

        // ignore: use_build_context_synchronously
        showModalBottomSheet(
          // ignore: use_build_context_synchronously
          backgroundColor: Theme
              .of(context)
              .scaffoldBackgroundColor,
          context: ctx,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
          ),
          builder: (_) {
            return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: ActionSuccessBottomSheet(
                  title: 'Account Created',
                  subTitle:
                  'Congratulations! your account already created. Enjoy the features',
                  image: SvgPicture.asset(
                      Theme
                          .of(context)
                          .brightness == Brightness.light
                          ? 'assets/svg/bottom_sheet_light.svg'
                          : 'assets/svg/bottom_sheet_dark.svg'),
                  action: 'Login',
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      RouteGenerator.loginPage,
                    );
                  }

              ),
            );
          },
        );
      }
    } catch (e) {
      showToast('Lỗi phía server');
    }
  }

  Future<void> saveUserDataToDatabase(String uid,String fullname, String phoneNumber, String password) async {
    try {
      // Get a reference to the Firebase Realtime Database
      // ignore: deprecated_member_use
      final databaseReference = FirebaseDatabase.instance.reference();

      // Save the user data under the "users" node using the UID as the key
      await databaseReference.child('guests').child(uid).set({
        'fullname': fullname,
        'phoneNumber': phoneNumber,
        'password': password,
      });
    } catch (e) {
      showToast("Lỗi truy cập server");
    }
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
            'Verify Your Account',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text.rich(
            textAlign: TextAlign.left,
            TextSpan(
              children: [
                TextSpan(
                  text: 'We’ve send verification code to ',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextSpan(
                  text: '+84 ${RegisterPage.phone}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: const Color(0xFF3D5BF6)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            'Verification Code',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10.h,
          ),
          CTextFormField(
            hintText: '123456',
            textControllor: _verificationCodeController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            prefixIcon: const Icon(
              Icons.pin_outlined,
              // color: Theme.of(context).iconTheme.color,
            ),
            suffixIcon: RPadding(
              padding: REdgeInsets.all(14.0),
              child: Text('Resend in 2:14',
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
          ),
          SizedBox(
            height: 329.h,
          ),
          CElevatedButton(
              child: const Text('Verify Account'),
              onPressed: () async{
                try {
                  // Create a PhoneAuthCredential with the code
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: RegisterPage.verify, smsCode: _verificationCodeController.text);

                  // Sign the user in (or link) with the credential
                  await auth.signInWithCredential(credential);
                  // ignore: use_build_context_synchronously
                  _accountCreated(context);
                }
                catch (e) {
                  showToast("Mã OTP không trùng khớp");
                }
              }),
          SizedBox(
            height: 20.h,
          ),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: 'Didn’t receive the code? ',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextSpan(
                  text: 'Resend',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: const Color(0xFF3D5BF6)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showToast(String ms){
    Fluttertoast.showToast(msg: ms, fontSize: 16, backgroundColor: Colors.black, textColor: Colors.white, gravity: ToastGravity.BOTTOM, toastLength: Toast.LENGTH_LONG);
  }
}

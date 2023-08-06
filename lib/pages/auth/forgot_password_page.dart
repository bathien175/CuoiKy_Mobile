// ignore_for_file: unused_local_variable, deprecated_member_use, unused_label

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homelyn/models/current_user.dart';
import 'package:homelyn/pages/auth/Verification_OTPcode_page.dart';
import 'package:homelyn/pages/auth/register_page.dart';
import '../../config/constants.dart';
import '../../utils/routes.dart';
import '/components/c_elevated_button.dart';
import '/components/c_text_form_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}
void showToast(String ms){
  Fluttertoast.showToast(msg: ms, fontSize: 16, backgroundColor: Colors.black, textColor: Colors.white, gravity: ToastGravity.BOTTOM, toastLength: Toast.LENGTH_LONG);
}
class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  String verificationId = "";

  String _removeLeadingZero(String phoneNumber) {
    if (phoneNumber.startsWith('0')) {
      return phoneNumber.substring(1);
    }
    return phoneNumber;
  }

  Future<void> resetPassword(BuildContext context) async {
    String phone = "+84 ${_removeLeadingZero(phoneController.text)}"; // Định dạng số điện thoại theo chuẩn quốc tế
    final databaseReference = FirebaseDatabase.instance.reference();
    DataSnapshot snapshot = (await databaseReference.child('guests')
          .orderByChild('phoneNumber')
          .equalTo(phone)
          .once()).snapshot;
      Map<dynamic, dynamic>? usersData = snapshot.value as Map?;
      if(usersData!=null){
        usersData.forEach((key, value) async {
          // Hiển thị thông báo yêu cầu đổi mật khẩu thành công
          await FirebaseAuth.instance.verifyPhoneNumber(
              phoneNumber: phone,
              verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {},
          codeSent: (String verificationId, int? resendToken) {
          RegisterPage.verify=verificationId;
          CURRENT_USER_ID = value['uid'].toString();
          showToast("Số điện thoại trùng khớp!");
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => const VerificationOTPcodePage()
          ),
          );
          },
          codeAutoRetrievalTimeout: (String verificationId) {},);
        }
        );
      } else{
        showToast("Số điện thoại không hợp lệ!");
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
        title: Text("Quên mật khẩu"),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: "Số điện thoại"),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => resetPassword(context),
              child: Text("Yêu cầu đổi mật khẩu"),
            ),
          ],
        ),
      ),
    );
  }
}




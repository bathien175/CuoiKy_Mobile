// ignore_for_file: unused_local_variable, deprecated_member_use, unused_label, unused_import, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homelyn/pages/auth/register_page.dart';
import 'package:intl/number_symbols_data.dart';
import '../../config/constants.dart';
import '../../utils/routes.dart';
import '/components/c_elevated_button.dart';
import '/components/c_text_form_field.dart';

class VerificationOTPcodePage  extends StatefulWidget  {
  const VerificationOTPcodePage({super.key});

  @override
  State<VerificationOTPcodePage> createState() => _VerificationOTPcodePageState();
}
void showToast(String ms){
  Fluttertoast.showToast(msg: ms, fontSize: 16, backgroundColor: Colors.black, textColor: Colors.white, gravity: ToastGravity.BOTTOM, toastLength: Toast.LENGTH_LONG);
}

  class _VerificationOTPcodePageState  extends State<VerificationOTPcodePage>  {
   final TextEditingController otpController = TextEditingController();
   String verificationId = RegisterPage.verify;

   Future<void> verifyOTP(BuildContext context) async {
     String smsCode = otpController.text;
     PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
     try {
       await FirebaseAuth.instance.signInWithCredential(credential);
       Navigator.of(context).pushNamed(
         RouteGenerator.createPasswordPage,);
       showToast("Thành công");// Xác thực thành công, bạn có thể chuyển người dùng đến màn hình chính hoặc thực hiện các thao tác khác
     } catch (e) {
       showToast("Không thành công");
       // Xử lý lỗi xác thực mã OTP nếu có
     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Mã OTP "),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: otpController,
              decoration: InputDecoration(labelText: "Mã OTP"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => verifyOTP(context),
              child: Text("Xác thực mã OTP"),
            ),
          ],
        ),
      ),
    );
  }
}




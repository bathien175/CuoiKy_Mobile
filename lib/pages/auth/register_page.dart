import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homelyn/config/constants.dart';
import 'package:provider/provider.dart';
import '../../providers/password_provider.dart';
import '../../utils/routes.dart';
import '/components/c_elevated_button.dart';
import '/components/c_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String verify="";
  static String phone = "";
  static String password = "";
  static String fullname="";
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var phone = "";

  // Loại bỏ số 0 ở đầu sđt người dùng nhập 0123 -> 123 để hệ thống gửi tin nhắn đến +84 123
  String _removeLeadingZero(String phoneNumber) {
    if (phoneNumber.startsWith('0')) {
      return phoneNumber.substring(1);
    }
    return phoneNumber;
  }

  // Validation function for the Full Name field
  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name cannot be empty';
    }
    return null;
  }

  // Validation function for the Phone Number field
  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    return null;
  }

  // Validation function for the Password field
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    return null;
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
          body: Form(
            key: _formKey,
            child: ListView(
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
                  'Let’s create your account first',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Full Name',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CTextFormField(
                    validator: _validateFullName,
                    hintText: 'Enter your full name',
                    textControllor: _fullNameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    prefixIcon: Theme.of(context).brightness == Brightness.light
                        ? SvgPicture.asset(
                            'assets/svg/user_light_icon.svg',
                          )
                        : SvgPicture.asset(
                            'assets/svg/user_dark_icon.svg',
                          )),
                SizedBox(
                  height: 20.h,
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
                    validator: _validatePhoneNumber,
                    hintText: 'Enter your number (+84)',
                    textControllor: _phoneNumberController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    onChanged: (value){
                      String sanitizedPhone = _removeLeadingZero(value);
                      phone = sanitizedPhone;
                    },
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
                      validator: _validatePassword,
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
                      //   } else if (value.length < 5) {
                      //     return 'Please enter at least 6 characters password';
                      //   }
                      //   return null;
                      // },
                    );
                  },
                ),
                SizedBox(
                  height: 119.h,
                ),
                CElevatedButton(
                    child: const Text('Agree and Continue'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                      RegisterPage.phone = phone;
                      RegisterPage.password = _passwordController.text;
                      RegisterPage.fullname = _fullNameController.text;
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '+84 $phone',
                        verificationCompleted: (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          RegisterPage.verify=verificationId;
                          Navigator.of(context).pushNamed(
                            RouteGenerator.verifyAccountPage,
                          );
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    }}
                    ),
              SizedBox(
                height: 20.h,
              ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.loginPage,
                );
              },
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Have an account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextSpan(
                    text: 'Login',
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
          ),
    );
  }
}

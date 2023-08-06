// ignore_for_file: empty_statements

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homelyn/providers/confirm_password_provider.dart';
import 'package:homelyn/widgets/action_success_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../../config/constants.dart';
import '../../models/current_user.dart';
import '../../providers/password_provider.dart';
import '../../utils/routes.dart';
import '/components/c_elevated_button.dart';
import '/components/c_text_form_field.dart';
import 'Verification_OTPcode_page.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({super.key});

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? newPassword;
  String? confirmPassword;

  String? newPasswordError;
  String? confirmPasswordError;

  String? _validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'New Password cannot be empty';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm password cannot be empty';
    }
    return null;
  }


  void _passwordChanged(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
          child:  ActionSuccessBottomSheet(
            title: 'Change Password Success',
            subTitle:
                'We have update your password. Please remember your password, Thank you!',
                image: SvgPicture.asset(
                    Theme.of(context).brightness == Brightness.light
                        ? 'assets/svg/bottom_sheet_light.svg'
                        : 'assets/svg/bottom_sheet_dark.svg'),
                        action: 'Login',
                        onPressed: () {
                   Navigator.of(context).pushNamed(
        RouteGenerator.loginPage,
      );}
          ),
        );
      },
    );
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
        ),
      ),
      body: ListView(
        padding: REdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(
            height: 30.h,
          ),
          Text(
            'Create New Password',
            style: Theme.of(context).textTheme.displayLarge,
          ),

          SizedBox(
            height: 30.h,
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
                prefixIcon: Theme.of(context).brightness== Brightness.light?
            SvgPicture.asset('assets/svg/lock_icon_light.svg',
              ) :
               SvgPicture.asset('assets/svg/lock_icon_dark.svg',
              ),
                suffixIcon: IconButton(
                  onPressed: () {
                    pp.toggleIsObscure();
                  },
                  icon: Icon(
                      pp.isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
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
            height: 20.h,
          ),
          Text(
            'Confirm Password',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10.h,
          ),
          Consumer<ConfirmPasswordProvider>(
            builder: (context, pp, child) {
              return CTextFormField(
                textControllor: _confirmPasswordController,
                //..text = 'test421',
                obscureText: pp.isObscure,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                hintText: 'Enter your new password',
                 prefixIcon: Theme.of(context).brightness== Brightness.light?
            SvgPicture.asset('assets/svg/lock_icon_light.svg',
              ) :
               SvgPicture.asset('assets/svg/lock_icon_dark.svg',
              ),
                suffixIcon: IconButton(
                  onPressed: () {
                    pp.toggleIsObscure();
                  },
                  icon: Icon(
                      pp.isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
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
            height: 266.h,
          ),
          CElevatedButton(
              child: const Text('Reset Password'),
              onPressed: () async {
                // Validate if 'Confirm new password' matches 'New password'
                 if (_confirmPasswordController.text != _passwordController.text) {
                    showToast('Password & Confirm Password don\'t match');}
                 else{
                   await _CreatePassword();
              }}),
        ],
      ),
    );
  }

  Future<void> _CreatePassword() async {
    try {
      final databaseReference = FirebaseDatabase.instance;
      if (CURRENT_USER_ID.isNotEmpty) {
        await databaseReference
            .ref() // Sử dụng ref() để tham chiếu tới database.
            .child('guests')
            .child(CURRENT_USER_ID)
            .update({
          'password': _passwordController.text,
        });
        showToast('New password updated successfully!');
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed(RouteGenerator.loginPage);
      } else {
        showToast('User ID is empty. Cannot update the password.');
      }
    } catch (e) {
      showToast('Error occurred while updating the password.: $e');
    }
  }

}

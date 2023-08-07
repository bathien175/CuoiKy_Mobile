import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homelyn/config/constants.dart';
import 'package:provider/provider.dart';
import '../../providers/password_provider.dart';
import '../../utils/routes.dart';
import '/components/c_elevated_button.dart';
import '/components/c_text_form_field.dart';
import 'package:homelyn/models/current_user.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? oldPassword;
  String? newPassword;
  String? confirmPassword;

  String? oldPasswordError;
  String? newPasswordError;
  String? confirmPasswordError;

  String? _validateOldPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Old Password cannot be empty';
    }
    return null;
  }

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
              'Change password',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              'Old password',
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
                  validator: _validateOldPassword,
                  hintText: 'Enter your old password',
                  textControllor: _oldPasswordController,
                  obscureText: pp.isObscureOldPassword,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  onChanged: (value){
                    oldPassword = value;
                  },
                  prefixIcon: Theme.of(context).brightness == Brightness.light
                      ? SvgPicture.asset(
                    'assets/svg/lock_icon_light.svg',
                  )
                      : SvgPicture.asset(
                    'assets/svg/lock_icon_dark.svg',
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      pp.toggleIsObscureOldPassword();
                    },
                    icon: Icon(pp.isObscureOldPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  ),
                );
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'New password',
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
                  validator: _validateNewPassword,
                  hintText: 'Enter your new password',
                  textControllor: _newPasswordController,
                  obscureText: pp.isObscureNewPassword,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  onChanged: (value){
                    newPassword = value;
                  },
                  prefixIcon: Theme.of(context).brightness == Brightness.light
                      ? SvgPicture.asset(
                    'assets/svg/lock_icon_light.svg',
                  )
                      : SvgPicture.asset(
                    'assets/svg/lock_icon_dark.svg',
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      pp.toggleIsObscureNewPassword();
                    },
                    icon: Icon(pp.isObscureNewPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  ),
                );
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Confirm new password',
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
                  validator: _validateConfirmPassword,
                  hintText: 'Confirm your new password',
                  textControllor: _confirmPasswordController,
                  obscureText: pp.isObscureConfirmPassword,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  onChanged: (value){
                    confirmPassword = value;
                  },
                  prefixIcon: Theme.of(context).brightness == Brightness.light
                      ? SvgPicture.asset(
                    'assets/svg/lock_icon_light.svg',
                  )
                      : SvgPicture.asset(
                    'assets/svg/lock_icon_dark.svg',
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      pp.toggleIsObscureConfirmPassword();
                    },
                    icon: Icon(pp.isObscureConfirmPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  ),
                );
              },
            ),
            SizedBox(
              height: 110.h,
            ),
            CElevatedButton(
              child: const Text('Agree'),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Validate if 'Confirm new password' matches 'New password'
                  if (_confirmPasswordController.text != _newPasswordController.text) {
                    showToast('Password & Confirm Password don\'t match');
                    return;
                  }

                  // Validate 'Old password' against the stored password in Firebase
                  if (!(await _checkOldPassword())) {
                    showToast('Old password Incorrect');
                    return;
                  }

                  // If all validations pass, update the user profile with the new password
                  await _updateUserProfile();
                }
              },
            )
          ],
        ),
      )
    );
  }

  Future<void> _updateUserProfile() async {
    try {
      final databaseReference = FirebaseDatabase.instance;
      if (CURRENT_USER_ID.isNotEmpty) {
        await databaseReference
            .ref() // Sử dụng ref() để tham chiếu tới database.
            .child('guests')
            .child(CURRENT_USER_ID)
            .update({
          'password': confirmPassword,
        });
        showToast('New password updated successfully!');
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed(RouteGenerator.myProfilePage);
      } else {
        showToast('User ID is empty. Cannot update the password.');
      }
    } catch (e) {
      showToast('Error occurred while updating the password.: $e');
    }
  }

  void showToast(String ms){
    Fluttertoast.showToast(msg: ms, fontSize: 16, backgroundColor: Colors.black, textColor: Colors.white, gravity: ToastGravity.BOTTOM, toastLength: Toast.LENGTH_LONG);
  }

  Future<bool> _checkOldPassword() async {
    try {
      final databaseReference = FirebaseDatabase.instance;
      final dataSnapshot = await databaseReference
          .ref()
          .child('guests')
          .child(CURRENT_USER_ID)
          .once();

      final data = dataSnapshot.snapshot.value as Map<dynamic, dynamic>;
      final storedPassword = data['password'];

      return storedPassword == _oldPasswordController.text;
    } catch (e) {
      showToast('Error occurred while checking the old password.: $e');
      return false;
    }
  }

}
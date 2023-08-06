import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homelyn/providers/confirm_password_provider.dart';
import 'package:homelyn/widgets/action_success_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../../config/constants.dart';
import '../../providers/password_provider.dart';
import '../../utils/routes.dart';
import '/components/c_elevated_button.dart';
import '/components/c_text_form_field.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({super.key});

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final _passwordController = TextEditingController();

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
                textControllor: _passwordController,
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
              onPressed: () {
                _passwordChanged(context);
              }),
        ],
      ),
    );
  }
}

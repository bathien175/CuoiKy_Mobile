import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../config/constants.dart';
import '../../providers/password_provider.dart';
import '../../utils/routes.dart';
import '/components/c_elevated_button.dart';
import '/components/c_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _passwordController = TextEditingController();
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
            'Welcome to Homelyn',
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
                Navigator.of(context).pushNamed(
                  RouteGenerator.navigationPage,
                );
              }),
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
                  child: Container(
                padding: REdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                    boxShadow: kDefaultBoxShadow,
                    color: Theme.of(context).inputDecorationTheme.fillColor,
                    borderRadius: BorderRadius.all(Radius.circular(28.r))),
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
              )),
              SizedBox(
                width: 27.w,
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
}

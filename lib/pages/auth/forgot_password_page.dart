import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../config/constants.dart';
import '../../utils/routes.dart';
import '/components/c_elevated_button.dart';
import '/components/c_text_form_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
            'Forgot Password',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            'Enter the phone number, we’ll send the code',
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
            height: 98.h,
          ),
          CElevatedButton(
              child: const Text('Send Code'),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.createPasswordPage,
                );
              }),
        ],
      ),
    );
  }
}

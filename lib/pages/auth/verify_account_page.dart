import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homelyn/widgets/action_success_bottom_sheet.dart';
import '../../config/constants.dart';
import '../../utils/routes.dart';
import '/components/c_elevated_button.dart';
import '/components/c_text_form_field.dart';

class VerifyAccountPage extends StatefulWidget {
  const VerifyAccountPage({super.key});

  @override
  State<VerifyAccountPage> createState() => _VerifyAccountPageState();
}

class _VerifyAccountPageState extends State<VerifyAccountPage> {
  // final _passwordController = TextEditingController();

  void _accountCreated(BuildContext ctx) {
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
            title: 'Account Created',
            subTitle:
                'Congratulations! your account already created. Enjoy the features',
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
                  text: '+62 1283972849',
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
            hintText: '53792',
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
              onPressed: () {
                _accountCreated(context);
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
}

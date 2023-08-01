import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homelyn/components/c_elevated_button.dart';

import '../../utils/routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RPadding(
        padding: REdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 305.h,
            ),
            Center(child: Image.asset('assets/images/welcome_page_logo.png')),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Welcome to Hotelyn',
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'If you are new here please create your account first before book the hotel.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 134.h,
            ),
            CElevatedButton(
                child: const Text('Create Account'),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    RouteGenerator.registerPage,
                  );
                }),
            SizedBox(
              height: 32.h,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.loginPage,
                );
              },
              child: Text(
                'Login',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: const Color(0xFF3D5BF6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

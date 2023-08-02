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
              'Welcome to Valcursa',
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'Nếu bạn là người mới, hãy tạo một tài khoản trước khi tiến hành đặt khách sạn.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 134.h,
            ),
            CElevatedButton(
                child: const Text('Tạo tài khoản'),
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
                'Đăng nhập',
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

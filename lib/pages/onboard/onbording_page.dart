import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homelyn/components/c_elevated_button.dart';

import '../../models/onboarding_content_model.dart';
import '../../utils/routes.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    SizedBox(
                      height: 439.h,
                      width: double.infinity,
                      child: Image.asset(
                        contents[i].image,
                        //height: 300,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    RPadding(
                      padding: REdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        children: [
                          Text(
                            contents[i].title,
                            // ignore: deprecated_member_use
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(height: 15.h),
                          Text(contents[i].discription,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge),
                          SizedBox(
                            height: 38.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              contents.length,
                              (index) => buildDot(index, context),
                            ),
                          ),
                          SizedBox(
                            height: 28.h,
                          ),
                          CElevatedButton(
                            child: Text(currentIndex == contents.length - 1
                                ? "Get Started"
                                : "Continue"),
                            onPressed: () {
                              if (currentIndex == contents.length - 1) {
                                Navigator.of(context).pushReplacementNamed(
                                  RouteGenerator.welcomePage,
                                );
                              }
                              _controller!.nextPage(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.bounceIn,
                              );
                            },
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed(
                                RouteGenerator.welcomePage,
                              );
                            },
                            child: Text(
                              'Skip',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: const Color(0xFF3D5BF6)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 10 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: currentIndex == index
            ? const Color(0xFF3D5BF6)
            : Theme.of(context).textTheme.bodyLarge!.color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

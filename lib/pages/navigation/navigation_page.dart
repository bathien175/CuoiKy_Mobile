import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyn/config/constants.dart';
import 'package:homelyn/pages/home/home_page.dart';
import 'package:homelyn/pages/messages/messages_empty_state_page.dart';
import 'package:homelyn/pages/profile/profile_page.dart';
import '../search/search_typing_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentIndex = 0;

  List<Widget> get _children => [
        const HomePage(),
        const SearchTypingPage(),
        const MessagesEmptyStatePage(),
        const ProfilePage(),
      ];

  onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _children[currentIndex]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: currentIndex,
        selectedItemColor: kBlueColor,
        selectedIconTheme: const IconThemeData(
          color: kBlueColor,
        ),
        // ignore: deprecated_member_use
        unselectedItemColor: Theme.of(context).textTheme.bodyText1!.color,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        unselectedLabelStyle: GoogleFonts.dmSans(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).textTheme.bodyLarge!.color,
        ),
        selectedLabelStyle: GoogleFonts.dmSans(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: kBlueColor,
        ),
        elevation: 6,
        items: [
          BottomNavigationBarItem(
              icon: Theme.of(context).brightness == Brightness.light
                  ? SvgPicture.asset(
                      'assets/svg/home_icon_light.svg',
                      color: currentIndex == 0
                          ? kBlueColor
                          : Theme.of(context).textTheme.bodyLarge!.color,
                    )
                  : SvgPicture.asset(
                      'assets/svg/home_icon_dark.svg',
                      color: currentIndex == 0
                          ? kBlueColor
                          : Theme.of(context).textTheme.bodyLarge!.color,
                    ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Theme.of(context).brightness == Brightness.light
                  ? SvgPicture.asset(
                      'assets/svg/search_icon_light.svg',
                      color: currentIndex == 1
                          ? kBlueColor
                          : Theme.of(context).textTheme.bodyLarge!.color,
                    )
                  : SvgPicture.asset(
                      'assets/svg/search_icon_dark.svg',
                      color: currentIndex == 1
                          ? kBlueColor
                          : Theme.of(context).textTheme.bodyLarge!.color,
                    ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Theme.of(context).brightness == Brightness.light
                  ? SvgPicture.asset(
                      'assets/svg/messages_icon_light.svg',
                      color: currentIndex == 2
                          ? kBlueColor
                          : Theme.of(context).textTheme.bodyLarge!.color,
                    )
                  : SvgPicture.asset(
                      'assets/svg/messages_icon_dark.svg',
                      color: currentIndex == 2
                          ? kBlueColor
                          : Theme.of(context).textTheme.bodyLarge!.color,
                    ),
              label: "Messages"),
          BottomNavigationBarItem(
              icon: Theme.of(context).brightness == Brightness.light
                  ? SvgPicture.asset(
                      'assets/svg/user_light_icon.svg',
                      color: currentIndex == 3
                          ? kBlueColor
                          : Theme.of(context).textTheme.bodyLarge!.color,
                    )
                  : SvgPicture.asset(
                      'assets/svg/user_dark_icon.svg',
                      color: currentIndex == 3
                          ? kBlueColor
                          : Theme.of(context).textTheme.bodyLarge!.color,
                    ),
              label: "Profile"),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:homelyn/pages/auth/create_password_page.dart';
import 'package:homelyn/pages/auth/forgot_password_page.dart';
import 'package:homelyn/pages/auth/login_page.dart';
import 'package:homelyn/pages/auth/verify_account_page.dart';
import 'package:homelyn/pages/home/checkout_page.dart';
import 'package:homelyn/pages/home/detail_page.dart';
import 'package:homelyn/pages/home/googleMap.dart';
import 'package:homelyn/pages/home/location_details_page.dart';
import 'package:homelyn/pages/home/notification_page.dart';
import 'package:homelyn/pages/home/reviews_page.dart';
import 'package:homelyn/pages/home/select_dates_page.dart';
import 'package:homelyn/pages/messages/messages_detail_page.dart';
import 'package:homelyn/pages/messages/messages_empty_state_page.dart';
import 'package:homelyn/pages/messages/messages_page.dart';
import 'package:homelyn/pages/navigation/navigation_page.dart';
import 'package:homelyn/pages/onboard/onbording_page.dart';
import 'package:homelyn/pages/profile/change_password_page.dart';
import 'package:homelyn/pages/profile/language_page.dart';
import 'package:homelyn/pages/profile/my_cupon_page.dart';
import 'package:homelyn/pages/profile/my_favourite_page.dart';
import 'package:homelyn/pages/profile/my_profile_page.dart';
import 'package:homelyn/pages/profile/notification_settings_page.dart';
import 'package:homelyn/pages/profile/profile_page.dart';
import 'package:homelyn/pages/profile/settings_page.dart';
import 'package:homelyn/pages/profile/transaction_history_page.dart';
import 'package:homelyn/pages/search/search_by_map_page.dart';
import 'package:homelyn/pages/search/search_list_page.dart';
import 'package:homelyn/pages/search/search_typing_page.dart';
import 'package:homelyn/pages/splash/splash_page.dart';
import 'package:homelyn/pages/welcome/welcome_page.dart';
import '/pages/auth/register_page.dart';
import '../pages/home/home_page.dart';

class RouteGenerator {
  static const String splashPage = '/';
  static const String createPasswordPage = 'createPasswordPage';
  static const String checkoutPage = 'checkoutPage';
  static const String detailPage = 'detailPage';
  static const String forgotPasswordPage = 'forgotPasswordPage';
  static const String homePage = 'homePage';
  static const String loginPage = 'loginPage';
  static const String locationDetailsPage = 'locationDetailsPage';
  static const String languagePage = 'languagePage';
  static const String messagesEmptyStatePage = 'messagesEmptyStatePage';
  static const String messagesPage = 'messagesPage';
  static const String messagesDetailPage = 'messagesDetailPage';
  static const String myFavouritePage = 'myFavouritePage';
  static const String myCuponPage = 'myCuponPage';
  static const String myProfilePage = 'myProfilePage';
  static const String navigationPage = 'navigationPage';
  static const String notificationPage = 'notificationPage';
  static const String notificationSettingsPage = 'notificationSettingsPage';
  static const String onboardingPage = 'onboardingPage';
  static const String profilePage = 'profilePage';
  static const String registerPage = 'registerPage';
  static const String reviewsPage = 'reviewsPage';
  static const String searchPage = 'searchPage';
  static const String searchTypingPage = 'searchTypingPage';
  static const String searchListPage = 'searchListPage';
  static const String settingsPage = 'settingsPage';
  static const String searchByMapPage = 'searchByMapPage';
  static const String selectDatesPage = 'selectDatesPage';
  static const String transactionHistoryPage = 'transactionHistoryPage';
  static const String verifyAccountPage = 'verifyAccountPage';
  static const String welcomePage = 'welcomePage';
  static const String changePasswordPage = 'changePasswordPage';
  static const String googleMapPage = 'googleMapPage';
  // static const String splash = '/';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case createPasswordPage:
        return MaterialPageRoute(builder: (_) => const CreatePasswordPage());
      case checkoutPage:
        return MaterialPageRoute(builder: (_) => const CheckoutPage());
      case detailPage:
        return MaterialPageRoute(builder: (_) => const DetailPage());
      case forgotPasswordPage:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case locationDetailsPage:
        return MaterialPageRoute(builder: (_) => const LocationDetailsPage());
      case languagePage:
        return MaterialPageRoute(builder: (_) => const LanguagePage());
      case messagesEmptyStatePage:
        return MaterialPageRoute(
            builder: (_) => const MessagesEmptyStatePage());
      case messagesPage:
        return MaterialPageRoute(builder: (_) => const MessagesPage());
      case messagesDetailPage:
        return MaterialPageRoute(builder: (_) => const MessagesDetailPage());
      case myFavouritePage:
        return MaterialPageRoute(builder: (_) => const MyFavouritePage());
      case myCuponPage:
        return MaterialPageRoute(builder: (_) => const MyCuponPage());
      case myProfilePage:
        return MaterialPageRoute(builder: (_) => const MyProfilePage());
      case navigationPage:
        return MaterialPageRoute(builder: (_) => const NavigationPage());
      case notificationPage:
        return MaterialPageRoute(builder: (_) => const NotificationPage());
      case notificationSettingsPage:
        return MaterialPageRoute(
            builder: (_) => const NotificationSettingsPage());
      case onboardingPage:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case profilePage:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case registerPage:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case changePasswordPage:
        return MaterialPageRoute(builder: (_) => const ChangePasswordPage());
      case reviewsPage:
        return MaterialPageRoute(builder: (_) => const ReviewsPage());
      case searchTypingPage:
        return MaterialPageRoute(builder: (_) => const SearchTypingPage());
      case searchListPage:
        return MaterialPageRoute(builder: (_) => const SearchListPage());
      case settingsPage:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case searchByMapPage:
        return MaterialPageRoute(builder: (_) => const SearchByMapPage());
      case selectDatesPage:
        return MaterialPageRoute(builder: (_) => SelectDatesPage());
      case googleMapPage:
        return MaterialPageRoute(builder: (_) => const MyLocationScreen());
      case transactionHistoryPage:
        return MaterialPageRoute(
            builder: (_) => const TransactionHistoryPage());
      case verifyAccountPage:
       return MaterialPageRoute(builder: (_) => const VerifyAccountPage());
      case welcomePage:
        return MaterialPageRoute(builder: (_) => const WelcomePage());

      default:
        throw Exception('Route not found');
    }
  }
}

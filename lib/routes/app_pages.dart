import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/views/after_login/home_pages/navigation_pages/chat_pages/wallet_page.dart';
import 'package:chat_app/views/after_login/home_pages/navigation_pages/home/home_screen.dart';
import 'package:chat_app/views/after_login/home_pages/navigation_pages/chat_pages/chat_page.dart';
import 'package:chat_app/views/after_login/home_pages/navigation_pages/chat_pages/contact_page.dart';
import 'package:chat_app/views/before_login/auth_pages/login_page.dart';
import 'package:chat_app/views/before_login/auth_pages/onboarding_page.dart';
import 'package:chat_app/views/before_login/auth_pages/phone_number_page.dart';
import 'package:chat_app/views/before_login/auth_pages/verify_otp_page.dart';
import 'package:chat_app/views/before_login/user_details_pages/user_details_page.dart';
import 'package:chat_app/views/before_login/user_details_pages/user_image_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.onborardinhPage, page: () => OnboardingPage()),
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage()),
    GetPage(name: AppRoutes.phoneNumber, page: () => PhoneNumberPage()),
    GetPage(name: AppRoutes.verifyOtp, page: () => VerifyOtpPage()),
    GetPage(name: AppRoutes.userImage, page: () => UserImagePage()),
    GetPage(name: AppRoutes.userDetails, page: () => UserDetailsPage()),

    GetPage(name: AppRoutes.homePage, page: () => HomeScreen()),
    GetPage(name: AppRoutes.contactPage, page: () => ContactPage()),
    GetPage(name: AppRoutes.chatPage, page: () => ChatPage()),

    GetPage(name: AppRoutes.walletPage, page: () => WalletPage()),
  ];
}

import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/views/after_login/home_pages/home/live_radio_page.dart';
import 'package:chat_app/views/after_login/navigation_pages/live_streaming_pages/joined_streaming_pages.dart';
import 'package:chat_app/views/after_login/navigation_pages/live_streaming_pages/stream_join_page.dart';
import 'package:chat_app/views/after_login/navigation_pages/live_streaming_pages/streaming_list_page.dart';
import 'package:chat_app/views/after_login/wallet_pages/wallet_page.dart';
import 'package:chat_app/views/after_login/home_pages/home/home_screen.dart';
import 'package:chat_app/views/after_login/home_pages/chat_pages/chat_page.dart';
import 'package:chat_app/views/after_login/home_pages/chat_pages/contact_page.dart';
import 'package:chat_app/views/after_login/navigation_pages/liked_profile_page/liked_profile_page.dart';
import 'package:chat_app/views/after_login/navigation_pages/profile_page/profile_page.dart';
import 'package:chat_app/views/after_login/navigation_pages/room_pages/room_creating_page.dart';
import 'package:chat_app/views/after_login/navigation_pages/room_pages/select_room_space.dart';
import 'package:chat_app/views/after_login/navigation_pages/users_chat_pages/user_chat_list.dart';
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
    GetPage(name: AppRoutes.chatList, page: () => ChatListPage()),

    GetPage(name: AppRoutes.likedProfile, page: () => LikedProfilePage()),
    GetPage(name: AppRoutes.profilePage, page: () => SetupProfilePage()),
    GetPage(name: AppRoutes.roomSpace, page: () => SelectRoomSpace()),

    GetPage(name: AppRoutes.roomCreate, page: () => RoomCreatingPage()),
    GetPage(name: AppRoutes.streamingList, page: () => StreamingListPage()),
    GetPage(name: AppRoutes.streamjoin, page: () => StreamJoinPage()),
    GetPage(name: AppRoutes.joinedStream, page: () => JoinedStreamingPages()),
    GetPage(name: AppRoutes.liveRadio, page: () => LiveRadioPage()),
  ];
}

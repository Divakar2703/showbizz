import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showbiz/presentation/screen/BusinessScreens/base_screen.dart';
import 'package:showbiz/presentation/screen/BusinessScreens/home/home_screen.dart';
import 'package:showbiz/presentation/screen/BusinessScreens/calendar_business/calendar_business.dart';
import 'package:showbiz/presentation/screen/BusinessScreens/interactive_session_request/interactive_session_request_Screen.dart';
import 'package:showbiz/presentation/screen/auth/add_business_cover_image.dart';
import 'package:showbiz/presentation/screen/auth/add_business_logo.dart';
import 'package:showbiz/presentation/screen/auth/forgot_password.dart';
import 'package:showbiz/presentation/screen/auth/signin.dart';
import 'package:showbiz/presentation/screen/auth/signup.dart';
import 'package:showbiz/presentation/screen/UserScreens/base_screen.dart';
import 'package:showbiz/presentation/screen/UserScreens/home/all_category.dart';
import 'package:showbiz/presentation/screen/UserScreens/home/biz_details/bz_details_screen.dart';
import 'package:showbiz/presentation/screen/UserScreens/home/home_screen.dart';
import 'package:showbiz/presentation/screen/UserScreens/home/biz_details/interact_with_biz_screen.dart';
import 'package:showbiz/presentation/screen/UserScreens/home/review/review_listing_screen.dart';
import 'package:showbiz/presentation/screen/UserScreens/home/search/search_screen.dart';
import 'package:showbiz/presentation/screen/UserScreens/notification/notification_screen.dart';
import 'package:showbiz/presentation/screen/select_user.dart';
import 'package:showbiz/presentation/screen/UserScreens/setting/edit_profile_screen.dart';
import 'package:showbiz/presentation/screen/UserScreens/user_intro/intro_one.dart';
import 'package:showbiz/presentation/screen/UserScreens/user_intro/intro_two.dart';
import '../presentation/screen/auth/select_signin_process.dart';
import '../presentation/screen/UserScreens/home/biz_details/non_interact_with_biz_screen.dart';
import '../presentation/screen/UserScreens/setting/my_subscription.dart';
import '../presentation/screen/splash_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case SelectUser.routeName:
        return CupertinoPageRoute(
          builder: (context) => const SelectUser(),
        );

      case IntroOne.routeName:
        return CupertinoPageRoute(
          builder: (context) => const IntroOne(),
        );

      case IntroTwo.routeName:
        return CupertinoPageRoute(
          builder: (context) => const IntroTwo(),
        );

      case SelectSigningProcess.routeName:
        return CupertinoPageRoute(
          builder: (context) => const SelectSigningProcess(),
        );
      case SigninScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => const SigninScreen(),
        );

      case SignUpScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case ForgotPasswordScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );

      /// _____ home screens   _____
      case BaseScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => const BaseScreen(),
        );

      case HomeScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case AllCategoryScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => const AllCategoryScreen(),
        );
      case SearchScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => const SearchScreen(),
        );

      case BizDetails.routeName:
        return CupertinoPageRoute(
          builder: (context) => BizDetails(
            bizId: "",
          ),
        );

      case ReviewList.routeName:
        return CupertinoPageRoute(
          builder: (context) => const ReviewList(),
        );

      case InteractWithBiz.routeName:
        return CupertinoPageRoute(
          builder: (context) => const InteractWithBiz(),
        );

      case NonInteractWithBiz.routeName:
        return CupertinoPageRoute(
          builder: (context) => const NonInteractWithBiz(
            link: "",
          ),
        );

      case NotificationScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => const NotificationScreen(),
        );

      case EditProfile.routeName:
        return CupertinoPageRoute(
          builder: (context) => const EditProfile(),
        );

      case MySubscription.routeName:
        return CupertinoPageRoute(
          builder: (context) => const MySubscription(),
        );

      // Business Screens
      case BaseBusinessScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => const BaseBusinessScreen(),
        );
      case BusinessHomeScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => BusinessHomeScreen(),
        );
      case BusinessHomeScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => InteractiveSessionRequestBusiness(),
        );
      case BusinessHomeScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => CalendarBusiness(),
        );
      case AddBusinessLogo.routeName:
        return CupertinoPageRoute(
          builder: (context) => const AddBusinessLogo(),
        );

      case AddBusinessCoverImage.routeName:
        return CupertinoPageRoute(
          builder: (context) => const AddBusinessCoverImage(),
        );
      default:
        return null;
    }
  }
}

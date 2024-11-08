import 'package:flutter/material.dart';
import 'package:homeworkauth/pages/home_screen.dart';
import '../login/login.dart';
import '../navbar/CustomBottomNavBar.dart';
import '../optionlogin/ChoiceScreen.dart';
import '../pages/loadingpage.dart';
import '../signup/phone_login_screen.dart'; // Import your Phone Login Screen

class RouteManager {
  static const String choiceScreenRoute = '/';
  static const String CustomBottomNavBarpage = '/home';  // This is the route for CustomBottomNavBar
  static const String phoneLoginPage = '/phoneLogin';
  static const String login = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case choiceScreenRoute:
        return MaterialPageRoute(builder: (context) => ChoiceScreen());
      case CustomBottomNavBarpage:
        return MaterialPageRoute(builder: (context) => CustomBottomNavBar());
      case phoneLoginPage:
        return MaterialPageRoute(builder: (context) => PhoneLoginScreen());
      case login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      default:
        throw FormatException('Route not found! Check route again.');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homeworkauth/login/login.dart';  // Import the Login Screen
import 'package:homeworkauth/navbar/CustomBottomNavBar.dart';
import 'package:homeworkauth/pages/home_screen.dart';

import 'optionlogin/ChoiceScreen.dart'; // Import the Home Screen

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the current user with FirebaseAuth
    final User? user = FirebaseAuth.instance.currentUser;

    // Return either Home or Login based on the user authentication state
    if (user != null) {
      // User is logged in, show the HomeScreen
      return const CustomBottomNavBar();
    } else {
      // User is not logged in, show the LoginScreen
      return ChoiceScreen();
    }
  }
}

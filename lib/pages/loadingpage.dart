import 'package:flutter/material.dart';
import '../route/route.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {}); // Delay for 5 seconds
    Navigator.pushReplacementNamed(context, RouteManager.choiceScreenRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/image/logo.png'), // Corrected path
        ), // Replace with your logo
      ),
    );
  }
}

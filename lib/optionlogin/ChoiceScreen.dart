import 'package:flutter/material.dart';
import 'package:homeworkauth/route/route.dart';

class ChoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set background color to white
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/image/logo.png'),
                  backgroundColor: Colors.grey[100],
                ),
                SizedBox(height: 25),
             
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteManager.phoneLoginPage);
                  },
                  child: Text(
                    'Continue with Phone',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    padding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    textStyle: TextStyle(fontSize: 18),
                    backgroundColor: Colors.black,
                  ),
                ),
                SizedBox(height: 16),

                ElevatedButton(
                  onPressed: () {
              Navigator.pushNamed(context, RouteManager.login);
                 },
                  child: Text(
                    'Continue with Email & Password',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    padding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    textStyle: TextStyle(fontSize: 18),
                    backgroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

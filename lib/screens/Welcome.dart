import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mad_assign/screens/login.dart';
import 'package:mad_assign/screens/signUp.dart';
import 'package:google_sign_in/google_sign_in.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/Logo.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUpScreen()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFBCA36C), // set the background color
                  elevation: 5.0, // set the elevation

                ),
                child: Text('Get Started'),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

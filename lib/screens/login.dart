import 'package:flutter/material.dart';
import 'package:mad_assign/screens/home.dart';
import 'package:mad_assign/services/firebase_services.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color update_color = Colors.grey;
  Color update_color_forgot_password = Colors.grey;
  String _email ="";
  String _password ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(12, 50, 12, 40),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFE0E6E9)),
          child: Wrap(
            spacing: 10,
            children: [
              Image(image: AssetImage('images/Logo.png')),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Color(0xFFBCA36C),
                //color of divider
                height: 5,
                //height spacing of divider
                thickness: 3,
                //thickness of divier line
                indent: 25,
                //spacing at the start of divider
                endIndent: 25, //spacing at the end of divider
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 20, 0, 20),
                child: Text(
                  'Login Screen',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFBCA36C),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            width: 1.5, color: Colors.grey.shade500)),
                    labelText: ' Email ',
                    hintText: 'Enter Your email',
                    icon: Icon(Icons.person_2_rounded)),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            width: 1.5, color: Colors.grey.shade500)),
                    labelText: ' Password',
                    hintText: 'Enter Your Password',
                    icon: Icon(Icons.lock)),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                style: TextStyle(fontWeight: FontWeight.w500),
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        update_color = Color(0xFFBCA36C);
                      });
                    },
                    child: Icon(
                      Icons.check_box,
                      color: update_color,
                      weight: 50,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        update_color = Color(0xFFBCA36C);
                      });
                    },
                    child: Text(
                      'Remember',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: update_color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        update_color_forgot_password = Color(0xFFBCA36C);
                      });
                    },
                    child: Text(
                      'Forgot Password',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: update_color_forgot_password,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(0xFFBCA36C),
                      borderRadius: BorderRadius.circular(28)),
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.all(2),
                  child: TextButton(
                    //yeh login wala hai
                    onPressed: () async {
                      await FirebaseServices().signInWithEmailAndPassword(_email, _password);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: Text(
                      '   LOG IN   ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 2.5,
                    color: Colors.grey.shade900,
                  )),
                  Text(
                    ' Or Connect with  ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 2.5,
                    color: Colors.grey.shade900,
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xFFBCA36C),
                    borderRadius: BorderRadius.circular(28)),
                child: TextButton(
                    onPressed: () async {
                      await FirebaseServices().signInWithGoogle();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image(
                            image: AssetImage('images/google_icon.png'),
                            width: 30,
                            height: 30,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "SIGNUP WITH GMAIL",
                          style: TextStyle(

                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 2),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

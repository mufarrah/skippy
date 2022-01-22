import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:skippy/auth/authentication-service.dart';
import 'package:skippy/view%20/homePage.dart';

import 'Login.dart';

class SignUp extends StatefulWidget {
  SignUp();

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var hight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  width: width,
                  height: 30.h,
                  child: Image.asset(
                    'assets/images/skippy_red.png',
                  ),
                ),
                Container(
                  height: 200.h,
                  child: Image.asset(
                    'assets/images/VR1.png',
                  ),
                ),
                // Padding(
                //   //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                //   padding: EdgeInsets.symmetric(horizontal: 15),
                //   child: TextField(
                //     decoration: InputDecoration(
                //         border: OutlineInputBorder(),
                //         labelText: 'Phone number',
                //         hintText: 'Enter your phone number eg 434222231'),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter your email'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter a secure password'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      onPressed: () {
                        context.read<AuthenticationService>().signUp(
                          email: emailController.text.trim(), 
                          password: passwordController.text.trim()).then((value) => {
                            value ? Get.to(() => HomePage()) : print(value)
                          });
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'OR',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      color: const Color(0xFF4285F4),
                      onPressed: () {},
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Sign Up with google',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      color: Colors.black,
                      onPressed: () {},
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.apple,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Sign Up with Apple',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                InkWell(
                    onTap: () {
                      Get.to(() => Login());
                    },
                    child: Text('Already have an account? Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

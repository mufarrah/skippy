import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:skippy/view%20/signUp.dart';

class Login extends StatefulWidget {
  Login();

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  height: 60.h,
                  child: Image.asset(
                    'assets/images/skippy_red.png',
                  ),
                ),
                Container(
                  height: 300.h,
                  child: Image.asset(
                    'assets/images/VR1.png',
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //TODO FORGOT PASSWORD SCREEN GOES HERE
                  },
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 130,
                ),
                InkWell(
                    onTap: () {
                      Get.to(() => SignUp());
                    },
                    child: Text('New User? Create Account'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

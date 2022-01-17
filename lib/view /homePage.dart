import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:skippy/view%20/signUp.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var hight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Container(
            child: Center(
              child: Text('Welcome'),
            ),
          )),
    );
  }
}

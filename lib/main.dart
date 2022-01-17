import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'view /Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(428, 926),
        builder: () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: Color(0xffFEFDFD),
              ),
              builder: (context, widget) {
                return MediaQuery(
                  //Setting font does not change with system font size
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget,
                );
              },
              home: Login(),
            ));
  }
}

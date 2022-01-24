import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:skippy/auth/authentication-service.dart';
import 'package:skippy/auth/googleSignInProvider.dart';
import 'package:skippy/view%20/homePage.dart';
import 'package:skippy/view%20/signUp.dart';

import 'view /Login.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance)
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
        ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider()
        )
      ],
      child: ScreenUtilInit(
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
              // home: Login(),
              home: AuthenticationWrapper(),
            ))
    );
  }
}
class AuthenticationWrapper extends StatelessWidget{
  const AuthenticationWrapper({
    Key key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    print(firebaseUser);

    if(firebaseUser != null) {
      // signed in
      return HomePage();
    }
    // not signed
    return SignUp();
  }
}
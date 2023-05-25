import 'package:capstone_flutter/view/screen/bpjs_screen/modal_bottom_bpjs_screen.dart';
import 'package:capstone_flutter/view/screen/pdam_screen/pdam_screen.dart';
import 'package:capstone_flutter/view/screen/splash_screen/splash_screen.dart';
import 'package:capstone_flutter/view/screen/wifi_screen/modal_bottom_wifi_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkuyPay App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PdamScreen(),
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => const SplashScreen(),
      //   // OnboardingScreen.route: (context) => const OnboardingScreen(),
      //   // RegisterScreen.route: (context) => const RegisterScreen(),
      //   // OtpScreen.route: (context) => const OtpScreen(),
      //   // FormRegisterScreen.route: (context) => const FormRegisterScreen(),
      //   // BerhasilRegisterScreen.route: (context) =>
      //   //     const BerhasilRegisterScreen(),
      // },
    );
  }
}

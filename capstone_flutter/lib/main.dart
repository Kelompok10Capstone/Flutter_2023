import 'package:capstone_flutter/view/screen/profile_screen/profile_screen.dart';

import 'package:capstone_flutter/view/screen/onboarding_screen/onboarding_screen.dart';
import 'package:capstone_flutter/view/screen/register_screen/berhasil_register_screen.dart';
import 'package:capstone_flutter/view/screen/register_screen/form_register_screen.dart';
import 'package:capstone_flutter/view/screen/register_screen/otp_screen.dart';
import 'package:capstone_flutter/view/screen/register_screen/register_screen.dart';

import 'package:capstone_flutter/view/screen/splash_screen/splash_screen.dart';
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
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        // OnboardingScreen.route: (context) => const OnboardingScreen(),
        // RegisterScreen.route: (context) => const RegisterScreen(),
        // OtpScreen.route: (context) => const OtpScreen(),
        // FormRegisterScreen.route: (context) => const FormRegisterScreen(),
        // BerhasilRegisterScreen.route: (context) =>
        //     const BerhasilRegisterScreen(),
      },
    );
  }
}

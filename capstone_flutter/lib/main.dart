<<<<<<< HEAD
=======
import 'package:capstone_flutter/view/screen/bpjs_screen/modal_bottom_bpjs_screen.dart';
import 'package:capstone_flutter/view/screen/pin_screen/modal_bottom_create_pin_screen.dart';
import 'package:capstone_flutter/view/screen/splash_screen/splash_screen.dart';
import 'package:capstone_flutter/view/screen/token_screen/modal_bottom_token_screen.dart';
import 'package:capstone_flutter/view/screen/wifi_screen/modal_bottom_wifi_screen.dart';
>>>>>>> 4f46d0f2154ede38ae5b57e03060213cf8d27a76
import 'package:flutter/material.dart';
import 'view/screen/home_screen/home_screen.dart';

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
<<<<<<< HEAD
      home: const NavBar(),
=======
      home: ModalBottomToken(),
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
>>>>>>> 4f46d0f2154ede38ae5b57e03060213cf8d27a76
    );
  }
}

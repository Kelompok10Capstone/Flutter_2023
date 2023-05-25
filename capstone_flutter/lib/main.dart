import 'package:capstone_flutter/view/screen/token_screen/modal_bottom_token_screen.dart';
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
    );
  }
}

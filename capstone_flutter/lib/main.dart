import 'package:capstone_flutter/view/screen/bpjs_screen/modal_bottom_bpjs_screen.dart';
import 'package:capstone_flutter/view/screen/pin_screen/modal_bottom_create_pin_screen.dart';
import 'package:capstone_flutter/view/screen/pulsa&paket_data_screen/pulsa&paketData_screen.dart';
import 'package:capstone_flutter/view/screen/splash_screen/splash_screen.dart';
import 'package:capstone_flutter/view/screen/token_screen/modal_bottom_token_screen.dart';
import 'package:capstone_flutter/view/screen/wifi_screen/modal_bottom_wifi_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'view/screen/home_screen/home_screen.dart';
import 'view/screen/onboarding_screen/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SkuyPay App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),
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
      },
    );
  }
}

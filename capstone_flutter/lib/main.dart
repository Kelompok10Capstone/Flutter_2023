import 'package:capstone_flutter/view/screen/splash_screen/splash_screen.dart';
import 'package:capstone_flutter/view/screen/billing_history_screen/billing_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'view/screen/top_up_screen/top_up_screen.dart';

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
      },
    );
//         designSize: const Size(360, 800),
//         minTextAdapt: true,
//         splitScreenMode: true,
//         builder: (context, child) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'SkuyPay App',
//             theme: ThemeData(
//               primarySwatch: Colors.blue,
//             ),
//             home: const BillingHistory(),
//           );
//         },
//       );
  }
}

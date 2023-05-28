import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'view/screen/forgot_pin_screen/forgot_pin_screen.dart';
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
            home: const ForgotPinScreen(),
          );
        },
      );
  }
}

import 'package:capstone_flutter/view/screen/splash_screen/splash_screen.dart';
import 'package:capstone_flutter/view_model/app_manajer.dart';
import 'package:capstone_flutter/view_model/pulsa_paketdata/pay_transaksi_ppd_view_model.dart';
import 'package:capstone_flutter/view_model/pulsa_paketdata/user_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'models/apis/pulsa_paket_data/pay_paket_data.dart';
import 'view_model/cek_pin/cek_pin_view_model.dart';
import 'view_model/pulsa_paketdata/paket_data_detail_view_model.dart';
import 'view_model/pulsa_paketdata/pulsa_paket_data_view_model.dart';

void main() {
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppManajer(),
        ),
        ChangeNotifierProvider(
          create: (_) => PulsaDanPaketDataViewModel(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => PaketDataProvider(),
        // ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CekPinViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => CekTransaksiPpdViewModel(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => PayPaketDataProvider(
        //     token: '',
        //     paketdata: '',
        //     productid: '',
        //     phonenumber: '',
        //     discountid: '', // Optional
        //   ),
        // ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) {
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
      ),
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

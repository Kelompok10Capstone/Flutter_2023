import 'dart:async';

import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';
import '../onboarding_screen/onboarding_screen.dart';

class SplashScreem extends StatefulWidget {
  const SplashScreem({super.key});

  @override
  State<SplashScreem> createState() => _SplashScreemState();
}

class _SplashScreemState extends State<SplashScreem> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const OnboardingScreen()),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo_skuypay.png',
                width: 210,
                height: 299,
              ),
              const SizedBox(
                height: 162,
              ),
              Text(
                'SkuyPay is licensed and supervised by the Financial',
                style: blackFont16.copyWith(color: Colors.grey, fontSize: 14),
              ),
              Text(
                'Services Authority (OJK) and is a member of the',
                style: blackFont16.copyWith(color: Colors.grey, fontSize: 14),
              ),
              Text(
                'Deposit Insurance Corporation (LPS)',
                style: blackFont16.copyWith(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 134,
                height: 30,
                child: Image.asset('assets/logo_bawah.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

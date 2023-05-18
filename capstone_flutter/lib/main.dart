import 'package:capstone_flutter/view/screen/pdam_screen/pdam_screen.dart';
import 'package:capstone_flutter/view/screen/profile_screen/profile_screen.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PdamScreen(),
    );
  }
}

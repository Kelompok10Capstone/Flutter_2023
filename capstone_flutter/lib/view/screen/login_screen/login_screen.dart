import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';
import '../home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // text editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // email field
    final emailField = FractionallySizedBox(
      widthFactor: 1.0,
      child: TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );

    // password field
    final passwordField = FractionallySizedBox(
      widthFactor: 1.0,
      child: TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter Your Password",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Masuk',
          style: blackFontAppbar18,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                key: _formKey,
                children: [
                  Image.asset(
                    'assets/images/ic_logo_skuypay.png',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'SkuyPay!',
                    style: blueFont16,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'E-mail',
                      style: blackFont14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  emailField,
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: blackFont14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  passwordField,
                  const SizedBox(height: 165),

                  /// Navigasi menggunakan route
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavBar(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2B3990),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Lanjutkan',
                        style: whiteFont15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Lupa E-mail? ',
                        style: blackText12,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Atur Ulang',
                          style: blueFont12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

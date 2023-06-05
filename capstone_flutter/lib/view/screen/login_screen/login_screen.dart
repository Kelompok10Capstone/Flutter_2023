import 'package:flutter/material.dart';
import '../../../models/apis/api_login_model.dart';
import '../../../utils/const/theme.dart';
import '../atur_ulang_screen/input_pin_atur_ulang_screen.dart';
import '../home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = LoginController();
  // form key
  final _formKey = GlobalKey<FormState>();

  // text editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // email field
    final emailField = TextFormField(
      autofocus: false,
      controller: loginController.emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
        hintText: 'skuypay@gmail.com',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    // password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: loginController.passwordController,
      obscureText: true,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
        hintText: "Enter Your Password",
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
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
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: 10, left: 24, right: 24, top: 20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blueColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      // onPressed: () => loginController.loginWithEmail(context),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavBar()),
                          (route) => false,
                        );
                      },

                      child: Text(
                        'Lanjutkan',
                        style: whiteFont14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Lupa E-mail? ',
                        style: blackFont12,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const InputPinAturUlangScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Atur Ulang',
                          style: blueFont12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class AturUlangScreen extends StatefulWidget {
  const AturUlangScreen({super.key});

  @override
  State<AturUlangScreen> createState() => _AturUlangScreenState();
}

class _AturUlangScreenState extends State<AturUlangScreen> {
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
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return ("Please Enter Your Email");
      //   }
      //   // reg expression for email validation
      //   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      //     return ("Please Enter a valid email");
      //   }
      //   return null;
      // },
      // onSaved: (value) {
      //   emailController.text = value!;
      // },
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
      controller: passwordController,
      obscureText: true,
      // validator: (value) {
      //   RegExp regex = new RegExp(r'^.{6,}$');
      //   if (value!.isEmpty) {
      //     return ("Password is required for login");
      //   }
      //   if (!regex.hasMatch(value)) {
      //     return ("Enter Valid Password(Min. 6 Character)");
      //   }
      // },
      // onSaved: (value) {
      //   passwordController.text = value!;
      // },
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
          'Atur Ulang',
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
                  Text(
                    'Masukkan E-mail baru kamu',
                    style: blackFont14,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 28),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'E-mail',
                      style: blackFont14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  emailField,
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: blackFont14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  passwordField,
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 24, right: 24),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: blueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const AturUlangScreen(),
              //   ),
              // );
            },
            child: Text(
              'Lanjutkan',
              style: whiteFont14,
            ),
          ),
        ),
      ),
    );
  }
}

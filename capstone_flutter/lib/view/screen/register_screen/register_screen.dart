import 'package:capstone_flutter/view/screen/register_screen/berhasil_register_screen.dart';
import 'package:capstone_flutter/view/screen/register_screen/otp_screen.dart';
import 'package:flutter/material.dart';
import '../../../utils/const/theme.dart';
import '../login_screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // text editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordEditingController =
      TextEditingController();
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordEditingController.dispose();
    confirmPasswordEditingController.dispose();
    nameEditingController.dispose();
    phoneEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // full name field
    final fullNameField = TextFormField(
      autofocus: false,
      controller: nameEditingController,
      keyboardType: TextInputType.name,
      // validator: (value) {
      //   RegExp regex = RegExp(r'^.{3,}$');
      //   if (value!.isEmpty) {
      //     return ("Full Name cannot be Empty");
      //   }
      //   if (!regex.hasMatch(value)) {
      //     return ("Enter Valid name(Min. 3 Character)");
      //   }
      //   return null;
      // },
      // onSaved: (value) {
      //   nameEditingController.text = value!;
      // },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
        filled: true,
        fillColor: const Color(0xffFFFFFF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

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
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    // phone field
    final phonelField = TextFormField(
      autofocus: false,
      controller: phoneEditingController,
      keyboardType: TextInputType.phone,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return ("Please Enter Your Phone Number");
      //   }
      //   // reg expression for email validation
      //   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      //     return ("Please Enter a valid email");
      //   }
      //   return null;
      // },
      // onSaved: (value) {
      //   phoneEditingController.text = value!;
      // },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
        filled: true,
        fillColor: const Color(0xfFFFFFFF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    // password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      // validator: (value) {
      //   RegExp regex = RegExp(r'^.{6,}$');
      //   if (value!.isEmpty) {
      //     return ("Password is required for login");
      //   }
      //   if (!regex.hasMatch(value)) {
      //     return ("Enter Valid Password(Min. 6 Character)");
      //   }
      // },
      // onSaved: (value) {
      //   passwordEditingController.text = value!;
      // },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
        filled: true,
        fillColor: const Color(0xffFFFFFF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    //confirm password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      // style: TextStyle(color: Colors.white.withOpacity(0.9)),
      obscureText: true,
      // validator: (value) {
      //   if (confirmPasswordEditingController.text !=
      //       passwordEditingController.text) {
      //     return "Password don't match";
      //   }
      //   return null;
      // },
      // onSaved: (value) {
      //   confirmPasswordEditingController.text = value!;
      // },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
        filled: true,
        fillColor: const Color(0xffFFFFFF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    final daftarButton = Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(10),
      color: blueColor,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        height: 52,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BerhasilRegisterScreen(),
            ),
          );
        },
        child: Text(
          'Daftar',
          textAlign: TextAlign.center,
          style: whiteFont14.copyWith(color: Colors.white),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Daftar',
          style: blackFont18.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/ic_logo_skuypay.png',
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'SkuyPay!',
                  style: blueFont16,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 18),
              Center(
                child: Text(
                  'Lengkapi identitas Anda disini.',
                  style: blackFont12,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Nama',
                style: blackFormFont12,
              ),
              const SizedBox(height: 8),
              fullNameField,
              const SizedBox(height: 10),
              Text(
                'E-mail',
                style: blackFormFont12,
              ),
              const SizedBox(height: 8),
              emailField,
              const SizedBox(height: 10),
              Text(
                'No. HP',
                style: blackFormFont12,
              ),
              const SizedBox(height: 8),
              phonelField,
              const SizedBox(height: 10),
              Text(
                'Kata Sandi',
                style: blackFormFont12,
              ),
              const SizedBox(height: 8),
              passwordField,
              const SizedBox(height: 10),
              Text(
                'Ketik Ulang Kata Sandi',
                style: blackFormFont12,
              ),
              const SizedBox(height: 8),
              confirmPasswordField,
              const SizedBox(height: 30),
              daftarButton,
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sudah Punya Akun? ',
                    style: blackFont12,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const LoginScreen();
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            final tween = Tween(
                                begin: const Offset(0, 5), end: Offset.zero);
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Masuk',
                      style: blueFont12,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding:
      //       const EdgeInsets.only(bottom: 10, left: 24, right: 24, top: 20),
      //   child: SizedBox(
      //     width: MediaQuery.of(context).size.width,
      //     height: 80,
      //     child: ListView(
      //       physics: const NeverScrollableScrollPhysics(),
      //       children: [
      //         Column(
      //           children: [
      //             SizedBox(
      //               width: MediaQuery.of(context).size.width,
      //               height: 52,
      //               child: ElevatedButton(
      //                 style: ElevatedButton.styleFrom(
      //                   backgroundColor: blueColor,
      //                   shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(10),
      //                   ),
      //                 ),
      //                 onPressed: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) => const OtpScreen(),
      //                     ),
      //                   );
      //                 },
      //                 child: Text(
      //                   'Daftar',
      //                   style: whiteFont14,
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(height: 10),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Text(
      //                   'Sudah punya akun? ',
      //                   style: blackFont12,
      //                 ),
      //                 GestureDetector(
      //                   onTap: () {},
      //                   child: Text(
      //                     'Masuk',
      //                     style: blueFont12,
      //                   ),
      //                 ),
      //               ],
      //             )
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

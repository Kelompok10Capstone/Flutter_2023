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
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Daftar',
          style: blackFontAppbar18,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/ic_logo_skuypay.png',
                  height: 104,
                  width: 63,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'SkuyPay!',
                  style: blueFont16,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 22),
                Align(
                  alignment: Alignment.centerLeft,
                  widthFactor: 1.8,
                  child: Text(
                    'Masukkan nomor SkuyPay kamu!',
                    style: blackFont12,
                  ),
                ),
                // SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 53,
                        child: TextFormField(
                          autofocus: false,
                          controller: phoneController,
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          // enabled: false,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            hintText: "+62",
                            hintStyle: blackFont12.copyWith(color: Colors.grey),
                            // labelText: "Password",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          autofocus: false,
                          controller: phoneController,
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            hintText: "Nomor Telepon",
                            // labelText: "Password",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),

                /// Navigasi menggunakan route
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const OtpScreen(),
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
                      'Daftar',
                      style: whiteFont15,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun? ',
                      style: blackText12,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Masuk',
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
    );
  }
}

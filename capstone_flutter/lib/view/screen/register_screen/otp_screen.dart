import 'package:capstone_flutter/view/screen/register_screen/form_register_screen.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/const/theme.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});
  static const String route = "/otp";

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 0),
                child: Text(
                  'Verifikasi',
                  style: blackFontAppbar18,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Masukkan kode yang telah kami kirim yaa',
                style: blackText12,
              ),
              const SizedBox(height: 20),
              Text(
                '04 : 58',
                style: blackText16,
              ),
              const SizedBox(height: 20),
              Pinput(
                controller: otpController,
                length: 5,
                showCursor: true,
                defaultPinTheme: PinTheme(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onChanged: (String value) {
                  setState(() {
                    if (value.isEmpty) {
                      otpController.text = '-';
                    }
                  });
                },
              ),
              const SizedBox(
                height: 430,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FormRegisterScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2B3990),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 125,
                    vertical: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Lanjutkan',
                  style: whiteFont15,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum dapat kode nih? ',
                    style: blackText12,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Kirim ulang dong',
                      style: blueFont12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

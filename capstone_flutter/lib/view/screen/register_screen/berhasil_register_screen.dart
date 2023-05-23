import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/const/theme.dart';

class BerhasilRegisterScreen extends StatefulWidget {
  const BerhasilRegisterScreen({super.key});

  @override
  State<BerhasilRegisterScreen> createState() => _BerhasilRegisterScreenState();
}

class _BerhasilRegisterScreenState extends State<BerhasilRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 200, bottom: 0, left: 50, right: 50),
              child: Image.asset(
                'assets/images/ic_berhasil_register.png',
              ),
            ),
            Text(
              'Cihuyy ! Selamat',
              style: blackText24,
            ),
            const SizedBox(height: 15),
            Text(
              'Kamu telah berhasil mendaftar',
              style: blackFontt16,
            ),
            const SizedBox(
              height: 200,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke home menggunakan route
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
          ],
        ),
      ),
    );
  }
}

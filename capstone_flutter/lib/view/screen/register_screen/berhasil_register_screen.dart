import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/const/theme.dart';
import '../home_screen/home_screen.dart';

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
        child: Padding(
          padding: const EdgeInsets.only(bottom: 34),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
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
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NavBar(),
              ));
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
        ),
      ),
    );
  }
}

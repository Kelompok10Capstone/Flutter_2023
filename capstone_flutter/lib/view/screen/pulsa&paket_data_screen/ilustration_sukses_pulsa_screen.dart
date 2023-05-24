import 'package:capstone_flutter/view/screen/pulsa&paket_data_screen/berhasil_transaksi_pulsa_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class IlustrationSuksesPulsa extends StatefulWidget {
  const IlustrationSuksesPulsa({super.key});

  @override
  State<IlustrationSuksesPulsa> createState() => _IlustrationSuksesPulsaState();
}

class _IlustrationSuksesPulsaState extends State<IlustrationSuksesPulsa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 200, bottom: 10, left: 66, right: 66),
            child: Image.asset(
              'assets/cihuy_selamat.png',
            ),
          ),
          Text(
            'Cihuyy ! Selamat',
            style: blackText24,
          ),
          const SizedBox(height: 15),
          Text(
            'Transaksi kamu berhasil',
            style: blackFontt16,
          ),
        ],
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BerhasilTransaksiPulsa(),
                ),
              );
            },
            child: Text(
              'Cek Transaksi',
              style: whiteFont14,
            ),
          ),
        ),
      ),
    );
  }
}

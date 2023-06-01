import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:flutter/material.dart';

import 'berhasil_transaksi_paket_data_screen.dart';

class IlustrationSuksesPaketDataScreen extends StatelessWidget {
  const IlustrationSuksesPaketDataScreen({super.key});

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
          const SizedBox(height: 16),
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
                  builder: (context) =>
                      const BerhasilTransaksiPaketDataListrik(),
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

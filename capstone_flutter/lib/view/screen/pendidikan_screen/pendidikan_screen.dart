import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class PendidikanScreen extends StatelessWidget {
  const PendidikanScreen({super.key});

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
          'Pendidikan',
          style: blackFontAppbar18,
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Image.asset(
              'assets/404.png',
              width: 200,
              height: 200,
            ),
            Text(
              'Oops',
              style: blackFont16.copyWith(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Mohon maaf, terjadi gangguan pada sistem',
              style: blackFont16.copyWith(color: Colors.grey, fontSize: 14),
            ),
            Text(
              'kami. Mohon hubungi layanan pelanggan',
              style: blackFont16.copyWith(color: Colors.grey, fontSize: 14),
            ),
            Text(
              'untuk pengaduan masalah Anda.',
              style: blackFont16.copyWith(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

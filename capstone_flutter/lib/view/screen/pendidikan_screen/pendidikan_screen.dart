import 'package:capstone_flutter/view/screen/pendidikan_screen/search_pendidikan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/const/theme.dart';

class PendidikanScreen extends StatefulWidget {
  const PendidikanScreen({super.key});

  @override
  State<PendidikanScreen> createState() => _PendidikanScreenState();
}

class _PendidikanScreenState extends State<PendidikanScreen> {
  // Text Editing Controller
  final TextEditingController institusiController = TextEditingController();
  final TextEditingController pembayaranController = TextEditingController();

  @override
  void dispose() {
    institusiController.dispose();
    pembayaranController.dispose();
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
          'Pendidikan',
          style: blackFontAppbar18,
        ),
        elevation: 0,
      ),
      // body: Center(
      //   child: Column(
      //     // mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const SizedBox(height: 100),
      //       Image.asset(
      //         'assets/404.png',
      //         width: 200,
      //         height: 200,
      //       ),
      //       Text(
      //         'Oops',
      //         style: blackFont16.copyWith(color: Colors.black, fontSize: 18),
      //       ),
      //       const SizedBox(height: 10),
      //       Text(
      //         'Mohon maaf, terjadi gangguan pada sistem',
      //         style: blackFont16.copyWith(color: Colors.grey, fontSize: 14),
      //       ),
      //       Text(
      //         'kami. Mohon hubungi layanan pelanggan',
      //         style: blackFont16.copyWith(color: Colors.grey, fontSize: 14),
      //       ),
      //       Text(
      //         'untuk pengaduan masalah Anda.',
      //         style: blackFont16.copyWith(color: Colors.grey, fontSize: 14),
      //       ),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                'Institusi',
                style: blackFont12.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                ),
                child: TextField(
                  controller: institusiController,
                  decoration: InputDecoration(
                      prefixIcon: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SearchPendidikanScreen(),
                            ),
                          );
                        },
                        child: const Icon(Icons.search),
                      ),
                      hintStyle: blackFont12.copyWith(color: Colors.grey),
                      focusedBorder: InputBorder.none),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'No. Pembayaran',
                style: blackFont12.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                ),
                child: TextField(
                  controller: pembayaranController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: blackFont12.copyWith(color: Colors.grey),
                    hintText: 'Masukkan No Pembayaran',
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 326,
                  height: 290,
                  child: Image.asset('assets/ic_pendidikan.png'),
                ),
              ),
            ],
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
              //     builder: (context) => const PaymentDetailPdam(),
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
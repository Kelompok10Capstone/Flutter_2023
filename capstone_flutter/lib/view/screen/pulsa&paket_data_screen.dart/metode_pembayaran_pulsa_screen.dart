import 'package:capstone_flutter/view/screen/pulsa&paket_data_screen.dart/pin_pulsa_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class MetodePembayaranPulsaScreen extends StatefulWidget {
  const MetodePembayaranPulsaScreen({super.key});

  @override
  State<MetodePembayaranPulsaScreen> createState() =>
      _MetodePembayaranPulsaScreenState();
}

class _MetodePembayaranPulsaScreenState
    extends State<MetodePembayaranPulsaScreen> {
  String? selectedRadio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Metode Pembayaran',
          style: blackFont18.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            // Text(
            //   'Dari PT SOLUSINDO JAYA',
            //   style: blackFont16.copyWith(fontWeight: FontWeight.w700),
            // ),
            // Text(
            //   'BPJS Kesehatan 00028394376',
            //   style: blackFont16.copyWith(fontWeight: FontWeight.w400),
            // ),
            // const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber[100],
              ),
              width: MediaQuery.of(context).size.width,
              height: 52,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Konfirmasi Pembayaran Anda',
                        style: blackFont16,
                      ),
                      Icon(Icons.help_outline)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 15, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pembayaran',
                      style: blackFont16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.wallet),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Saldo SkuyPay (Rp 150.000)',
                          style:
                              blackFont16.copyWith(fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Radio(
                          value: 'saldo_skuy_pay',
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setState(() {
                              selectedRadio = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 15, bottom: 15, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Detail',
                        style:
                            blackFont16.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 16),
                    // const Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 10),
                    //   child: Divider(
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 5, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Produk',
                            style: blackFont16.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Pulsa 5000',
                            style: blackFont16.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Harga',
                            style: blackFont16.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Rp 6500',
                            style: blackFont16.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Promo',
                            style: blackFont16.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '-',
                            style: blackFont16.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[100],
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  'Total tagihan',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff111111),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  'Rp 6500',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff111111),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PinPulsaScreen()));
            },
            child: Text(
              'Yuk Bayar!',
              style: whiteFont14,
            ),
          ),
        ),
      ),
    );
  }
}

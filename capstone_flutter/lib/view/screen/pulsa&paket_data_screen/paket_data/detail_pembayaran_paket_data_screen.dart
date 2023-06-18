import 'package:flutter/material.dart';

import '../../../../utils/const/theme.dart';
import 'metode_pembayaran_paket_data_screen.dart';

class DetailPembayaranPaketDataScreen extends StatefulWidget {
  const DetailPembayaranPaketDataScreen({super.key});

  @override
  State<DetailPembayaranPaketDataScreen> createState() =>
      _DetailPembayaranPaketDataScreenState();
}

class _DetailPembayaranPaketDataScreenState
    extends State<DetailPembayaranPaketDataScreen> {
  TextEditingController promoController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    promoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Rincian Pembayaran',
          style: blackFont18.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Center(
                child: Image.asset(
                  'assets/images/ic_telkomsel.png',
                  width: 132,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Kode Promo',
                style: blackFont14.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.51,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      controller: promoController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: blackFont12.copyWith(color: Colors.grey),
                        hintText: 'CONTOH: PROMOINGAZI',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 5.3,
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
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const PaymentDetail()));
                      },
                      child: Text(
                        'Klaim',
                        style: whiteFont14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber[100],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.warning_amber_outlined,
                        size: 15,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Silahkan masukkan kode promo yang kamu punya',
                        style: blackFont12.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 10),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 10, bottom: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Produk',
                              style: blackFont12.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'TLKM2GB',
                              style: blackFont12.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.1), // Warna shadow
                              spreadRadius: 2, // Penyebaran shadow
                              blurRadius: 4, // Jarak blur shadow
                              offset: const Offset(
                                  0, 2), // Posisi offset shadow (x, y)
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white,
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 8, right: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rincian Paket',
                                    style: blackText13,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Reguler',
                                      style: blackFont12.copyWith(
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '2 GB',
                                      style: blackFont12.copyWith(
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Midnight',
                                      style: blackFont12.copyWith(
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      ' - ',
                                      style: blackFont12.copyWith(
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 5, top: 8, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'No. Handphone',
                              style: blackFont12.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'O85278xxxxx',
                              style: blackFont12.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 5, top: 8, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Harga',
                              style: blackFont12.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Rp 10.000',
                              style: blackFont12.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.green[100],
                            color: const Color(0xffBADDB1),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 34,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Text(
                                    'Total tagihan',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Text(
                                    'Rp 10.000',
                                    style: blackFont14.copyWith(
                                        fontWeight: FontWeight.bold),
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
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: 30, left: 24, right: 24, top: 10),
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
                  builder: (context) => const MetodePembayaranPaketDataScreen(),
                ),
              );
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

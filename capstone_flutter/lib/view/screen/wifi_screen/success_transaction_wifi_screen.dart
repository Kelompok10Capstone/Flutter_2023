import 'package:capstone_flutter/view/screen/home_screen/home_screen.dart';
import 'package:capstone_flutter/view/screen/wifi_screen/modal_bottom_wifi_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class SuccessTransactionWifi extends StatelessWidget {
  const SuccessTransactionWifi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 66,
              ),
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Transaksi Kamu Berhasil',
                style: blackFont16,
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '04 Mei 2023 . 20.28',
                      style: blackFont12.copyWith(fontSize: 10),
                    ),
                    Text(
                      'SkuyPay 0857xxxx2345',
                      style: blackFont12.copyWith(fontSize: 10),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                width: double.infinity,
                height: 320,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tanggal',
                            style: blackFont12,
                          ),
                          Text(
                            '06-05-2023',
                            style: blackFont12,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Harga Tagihan',
                            style: blackFont12,
                          ),
                          Text(
                            '63.000',
                            style: blackFont12,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Penyedia Layanan',
                            style: blackFont12,
                          ),
                          Text(
                            'Indihome',
                            style: blackFont12,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'No. Pelanggan',
                            style: blackFont12,
                          ),
                          Text(
                            '0000 2984 0368',
                            style: blackFont12,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nama',
                            style: blackFont12,
                          ),
                          Text(
                            'Ijat Sutresno',
                            style: blackFont12,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nominal',
                            style: blackFont12,
                          ),
                          Text(
                            'Rp 130.000',
                            style: blackFont12,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Biaya Admin',
                            style: blackFont12,
                          ),
                          Text(
                            'Rp 2.500',
                            style: blackFont12,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green[100],
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 32,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                    'Total',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                    'Rp 65.500',
                                    style: blackFont12.copyWith(
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
              )
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NavBar()));
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const ModalBottomWifi()));
            },
            child: Text(
              'Selesai',
              style: whiteFont14,
            ),
          ),
        ),
      ),
    );
  }
}

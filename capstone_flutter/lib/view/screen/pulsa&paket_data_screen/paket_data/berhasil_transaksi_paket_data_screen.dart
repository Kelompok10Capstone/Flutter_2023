import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/view/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class BerhasilTransaksiPaketDataListrik extends StatefulWidget {
  const BerhasilTransaksiPaketDataListrik({super.key});

  @override
  State<BerhasilTransaksiPaketDataListrik> createState() =>
      _BerhasilTransaksiPaketDataListrikState();
}

class _BerhasilTransaksiPaketDataListrikState
    extends State<BerhasilTransaksiPaketDataListrik> {
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
                height: 100,
              ),
              const Icon(
                Icons.check_circle,
                color: Color(0xff76BB63),
                size: 80,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Transaksi Kamu Berhasil',
                style: blackFont18,
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
                      style: blackFont12,
                    ),
                    Text(
                      'SkuyPay 0857xxxx2345',
                      style: blackFont12,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 15, bottom: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 5, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Produk',
                              style: blackFont12.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Data 2GB',
                              style: blackFont12.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 15, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'No. Handphone',
                              style: blackFont12.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '085278xxxxx',
                              style: blackFont12.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 15, right: 10),
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
                      const SizedBox(height: 21),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 5, 5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.green[100],
                            color: Color(0xffBADDB1),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 34,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                    'Total Tagihan',
                                    style: blackFont12.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                    'Rp 10.000',
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavBar(),
                ),
              );
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

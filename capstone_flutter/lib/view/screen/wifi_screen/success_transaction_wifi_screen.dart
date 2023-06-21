import 'package:capstone_flutter/view/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/const/theme.dart';

class SuccessTransactionWifi extends StatefulWidget {
  final String id;
  final String userId;
  final String pelangganData;
  final DateTime createdAt;
  final String providerName;
  final int price;
  final int adminFee;
  final String customerName;
  const SuccessTransactionWifi(
      {super.key,
      required this.id,
      required this.userId,
      required this.pelangganData,
      required this.createdAt,
      required this.providerName,
      required this.price,
      required this.adminFee,
      required this.customerName});

  @override
  State<SuccessTransactionWifi> createState() => _SuccessTransactionWifiState();
}

class _SuccessTransactionWifiState extends State<SuccessTransactionWifi> {
  late SharedPreferences _prefs;

  String phone = '';
  String token = '';

  Future<void> initializeData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      phone = _prefs.getString('phone') ?? '';
      token = _prefs.getString('token') ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    initializeData(); // Panggil fungsi untuk inisialisasi data
  }

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
                      DateFormat('dd MMMM yyyy. HH:mm')
                          .format(widget.createdAt),
                      style: blackFont12.copyWith(fontSize: 10),
                    ),
                    Text(
                      'SkuyPay $phone',
                      // 'SkuyPay 0857xxxx2345',
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
                height: 300,
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
                            DateFormat('dd-MM-yyyy').format(widget.createdAt),
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
                            widget.providerName,
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
                            widget.pelangganData,
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
                            widget.customerName,
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
                            widget.price.toString(),
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
                            widget.adminFee.toString(),
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
                                    (widget.price + widget.adminFee).toString(),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavBar(
                            initialIndex: 1,
                          )));
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

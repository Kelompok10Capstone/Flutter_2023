import 'package:capstone_flutter/view/screen/wifi_screen/pin_wifi_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supercharged/supercharged.dart';

import '../../../utils/const/theme.dart';

class PaymentMethodWifi extends StatefulWidget {
  final String id;
  final String userId;
  final int price;
  final int adminFee;
  const PaymentMethodWifi({
    super.key,
    required this.price,
    required this.adminFee,
    required this.id,
    required this.userId,
  });

  @override
  State<PaymentMethodWifi> createState() => _PaymentMethodWifiState();
}

class _PaymentMethodWifiState extends State<PaymentMethodWifi> {
  String? selectedRadio;
  late SharedPreferences _prefs;
  String balance = '0';
  Future<void> initializeData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      balance = _prefs.getInt('balance').toString();
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
            const SizedBox(height: 10),
            Text(
              'Dari PT SOLUSINDO JAYA',
              style: blackFont12.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              'Indihome 0000 2984 0368',
              style: blackFont12.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
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
                        style:
                            blackFont12.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.help_outline)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 15, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pembayaran',
                      style: blackFont12.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.wallet),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Saldo SkuyPay (Rp ${balance.toString()})',
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.w400),
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
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 15, bottom: 15, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Biaya Detail',
                      style: blackFont12.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Jumlah',
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          (widget.adminFee + widget.price).toString(),
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Promo',
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '-',
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          (widget.adminFee + widget.price).toString(),
                          style:
                              blackFont12.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
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
              if (selectedRadio == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Pilih metode pembayaran'),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              } else {
                print(widget.id);
                var saldo = balance.toInt()! - widget.price + widget.adminFee;
                print('saldo : $saldo');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PinScreenWifi(
                      id: widget.id,
                      userId: widget.userId,
                    ),
                  ),
                );
              }
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

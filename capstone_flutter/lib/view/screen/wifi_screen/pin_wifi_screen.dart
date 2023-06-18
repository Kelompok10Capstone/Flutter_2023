import 'package:capstone_flutter/models/apis/pay_wifi.dart';
import 'package:capstone_flutter/view/screen/wifi_screen/ilustration_success_wifi_screen.dart';
import 'package:capstone_flutter/view/screen/wifi_screen/success_transaction_wifi_screen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/apis/cek_pin.dart';
import '../../../utils/const/theme.dart';

class PinScreenWifi extends StatefulWidget {
  final String id;
  final String userId;
  const PinScreenWifi({Key? key, required this.id, required this.userId})
      : super(key: key);

  @override
  State<PinScreenWifi> createState() => _PinScreenWifiState();
}

class _PinScreenWifiState extends State<PinScreenWifi> {
  final TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initializeData(); // Panggil fungsi untuk inisialisasi data
  }

  late SharedPreferences _prefs;
  String token = '';
  Future<void> initializeData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      token = _prefs.getString('token') ?? '';
      print(token);
    });
  }

  void _submitPin(String pin) async {
    try {
      final bool isPinCorrect = await checkPinPayment(token, pin);
      String idx = widget.id;
      if (isPinCorrect && idx.isNotEmpty) {
        final PayWifi payWifi = PayWifi(idx, token);
        print('adalah: ${idx}');
        final String payWifiResponse = await payWifi.payWifi();
        print(payWifiResponse);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SuccessTransactionWifi(),
          ),
        );
      } else {
        // Handle incorrect pin scenario
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Pin salah.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      print('Error: $error');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Upss sepertinya ada yang salah.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
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
          'Kode PIN',
          style: blackFontAppbar18,
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'Masukkan kode PIN kamu!',
              style: blackFont14,
            ),
            const SizedBox(height: 70),
            Pinput(
              controller: otpController,
              length: 5,
              showCursor: true,
              defaultPinTheme: PinTheme(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Lupa kode PIN?',
              style: blueFont12,
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
            onPressed: () async {
              final pin = otpController.text;
              _submitPin(pin);
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

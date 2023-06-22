import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../models/apis/cek_pin_api.dart';
import '../../../models/apis/pulsa_paket_data/pay_paket_data.dart';
import '../../../utils/const/theme.dart';
import '../../../view_model/pulsa_paketdata/user_provider.dart';
import 'ilustration_sukses_pulsa_screen.dart';

class PinPulsaScreen extends StatefulWidget {
  final String id;
  final String name;
  final String type;
  final String code;
  final String provider;
  final String price;
  final String adminFee;
  final String description;
  final int balanceNow;
  final DateTime createdAt;
  final String token;

  const PinPulsaScreen(
      {super.key,
      required this.id,
      required this.name,
      required this.type,
      required this.code,
      required this.provider,
      required this.price,
      required this.adminFee,
      required this.description,
      required this.balanceNow,
      required this.createdAt,
      required this.token});

  @override
  State<PinPulsaScreen> createState() => _PinPulsaScreenState();
}

class _PinPulsaScreenState extends State<PinPulsaScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('pin token : ${widget.token}');
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void _submitPin(String pin) async {
    String token = widget.token;
    final bool isPinCorrect = await checkPinPayment(token, pin);
    String typep = widget.type;
    String codep = widget.code;
    String providerp = widget.provider;
    String productp = widget.id;
    if (isPinCorrect && productp.isNotEmpty) {
      final PayPaketData payPulsatData = PayPaketData(
        token,
        typep,
        productp,
        codep,
        providerp,
      );
      // ignore: avoid_print
      print('adalah: $productp');
      final String? payPaketDataResponse = await payPulsatData.payPaketData();
      // final String? payPaketDataResponse = await payPaketData.payPaketData();
      // ignore: avoid_print
      print(payPaketDataResponse);

      // Memperbarui nilai balance pada UserProvider
      // ignore: use_build_context_synchronously
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final newBalance =
          widget.balanceNow; // Ganti dengan nilai balance yang baru
      userProvider.updateUserInfo(
          userProvider.name, userProvider.phone, newBalance);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IlustrationSuksesPulsa(
            id: widget.id,
            name: widget.name,
            type: widget.type,
            code: widget.code,
            provider: widget.provider,
            price: widget.price,
            adminFee: widget.adminFee,
            description: widget.description,
            createdAt: widget.createdAt,
          ),
        ),
      );
    } else {
      // Handle incorrect pin scenario
      // ignore: use_build_context_synchronously
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Kode PIN',
          style: blackFont18.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Text(
              'Masukkan kode PIN kamu!',
              style: blackFont14,
            ),
            const SizedBox(height: 55),
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
              onChanged: (String value) {
                setState(() {
                  if (value.isEmpty) {
                    otpController.text = '';
                  }
                });
              },
            ),
            const SizedBox(
              height: 26,
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

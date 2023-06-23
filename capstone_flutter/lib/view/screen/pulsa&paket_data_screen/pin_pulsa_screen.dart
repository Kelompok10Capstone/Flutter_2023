import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/apis/cek_pin_api.dart';
import '../../../models/apis/pulsa_paket_data/pay_paket_data.dart';
import '../../../utils/const/theme.dart';
import '../../../view_model/cek_pin/cek_pin_view_model.dart';
import '../../../view_model/pulsa_paketdata/pulsa_paket_data_view_model.dart';
import '../../../view_model/pulsa_paketdata/user_provider.dart';
import 'ilustration_sukses_pulsa_screen.dart';

class PinPulsaScreen extends StatefulWidget {
  final String token;
  // final String id;
  // final String name;
  // final String type;
  // final String code;
  // final String provider;
  // final String price;
  // final String adminFee;
  // final String description;
  // final int balanceNow;
  // final DateTime createdAt;

  const PinPulsaScreen({
    super.key,
    required this.token,
    // required this.id,
    // required this.name,
    // required this.type,
    // required this.code,
    // required this.provider,
    // required this.price,
    // required this.adminFee,
    // required this.description,
    // required this.balanceNow,
    // required this.createdAt,
  });

  @override
  State<PinPulsaScreen> createState() => _PinPulsaScreenState();
}

class _PinPulsaScreenState extends State<PinPulsaScreen> {
  final TextEditingController otpController = TextEditingController();
  late SharedPreferences _prefs;
  String token = '';

  @override
  void initState() {
    super.initState();
    initializeData();
    // print("detail pulsa token : ${token}");
  }

  Future<void> initializeData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      token = _prefs.getString('token') ?? '';
      print("token pin screen pulsa : $token");
    });
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void _submitPin(String pin) async {
    final cekPinProvider = Provider.of<CekPinViewModel>(context, listen: false);
    final pulsaPaketDataProvider =
        Provider.of<PulsaDanPaketDataViewModel>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    final bool isPinCorrect = await cekPinProvider.postcekPin(pin);
    String typep = pulsaPaketDataProvider.pulsa[0].type;
    String codep = pulsaPaketDataProvider.pulsa[0].code;
    String providerp = pulsaPaketDataProvider.pulsa[0].provider;
    String productp = pulsaPaketDataProvider.pulsa[0].id;

    if (isPinCorrect && productp.isNotEmpty) {
      final payPaketDataProvider = PayPaketDataProvider(
        token: widget.token,
        paketdata: typep,
        productid: productp,
        phonenumber: codep,
        discountid: providerp,
      );

      await payPaketDataProvider.payPaketData();

      if (payPaketDataProvider.productid != null) {
        final userProvider = Provider.of<UserProvider>(context, listen: false);
        final newBalance = int.parse(userProvider.balance.toString()) -
            int.parse(
                pulsaPaketDataProvider.selectPulsaData?.price.toString() ?? "");
        userProvider.updateUserInfo(
            userProvider.name, userProvider.phone, newBalance);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IlustrationSuksesPulsa(),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text(
                  'Payment failed: ${payPaketDataProvider.errorMessage ?? ""}'),
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
    } else {
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

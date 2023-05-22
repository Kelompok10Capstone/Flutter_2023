import 'package:capstone_flutter/view/screen/pdam_screen/payment_detail.dart';
import 'package:capstone_flutter/view/screen/pdam_screen/region_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/const/theme.dart';

class PdamScreen extends StatefulWidget {
  const PdamScreen({super.key});

  @override
  State<PdamScreen> createState() => _PdamScreenState();
}

class _PdamScreenState extends State<PdamScreen> {
  TextEditingController wilayahController = TextEditingController();
  TextEditingController pelangganController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    wilayahController.dispose();
    pelangganController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PDAM',
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
              const SizedBox(height: 50),
              TextField(
                controller: wilayahController,
                decoration: InputDecoration(
                  prefixIcon: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegionScreen()));
                    },
                    child: const Icon(Icons.search),
                  ),
                  hintText: 'Cari Wilayah',
                  filled: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'No. Pelanggan',
                style: blackFont16.copyWith(fontWeight: FontWeight.w700),
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
                  controller: pelangganController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: blackFont16,
                    hintText: 'Masukkan No Pelanggan',
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 326,
                  height: 290,
                  child: Image.asset('assets/icon_pdam1.png'),
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
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(blueColor),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaymentDetail()));
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

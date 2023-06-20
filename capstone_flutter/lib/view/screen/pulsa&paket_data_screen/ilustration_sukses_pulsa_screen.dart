import 'package:capstone_flutter/view/screen/pulsa&paket_data_screen/berhasil_transaksi_pulsa_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class IlustrationSuksesPulsa extends StatefulWidget {
  final String id;
  final String name;
  final String type;
  final String code;
  final String provider;
  final String price;
  final String adminFee;
  final String description;
  final DateTime createdAt;
  const IlustrationSuksesPulsa(
      {super.key,
      required this.id,
      required this.name,
      required this.type,
      required this.code,
      required this.provider,
      required this.price,
      required this.adminFee,
      required this.description,
      required this.createdAt});

  @override
  State<IlustrationSuksesPulsa> createState() => _IlustrationSuksesPulsaState();
}

class _IlustrationSuksesPulsaState extends State<IlustrationSuksesPulsa> {
  bool _isLoading = true;

  Future<void> _showContent() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _showContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 200, bottom: 10, left: 66, right: 66),
                  child: Image.asset(
                    'assets/cihuy_selamat.png',
                  ),
                ),
                Text(
                  'Cihuyy ! Selamat',
                  style: blackText24,
                ),
                const SizedBox(height: 15),
                Text(
                  'Transaksi kamu berhasil',
                  style: blackFontt16,
                ),
              ],
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
            onPressed: _isLoading
                ? null
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BerhasilTransaksiPulsa(
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
                  },
            child: Text(
              'Cek Transaksi',
              style: whiteFont14,
            ),
          ),
        ),
      ),
    );
  }
}

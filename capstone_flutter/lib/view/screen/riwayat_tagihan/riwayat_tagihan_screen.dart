import 'package:flutter/material.dart';

class RiwayatTagihanScreen extends StatefulWidget {
  const RiwayatTagihanScreen({super.key});

  @override
  State<RiwayatTagihanScreen> createState() => _RiwayatTagihanScreenState();
}

class _RiwayatTagihanScreenState extends State<RiwayatTagihanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Tagihan"),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BillingHistory extends StatefulWidget {
  const BillingHistory({super.key});

  @override
  State<BillingHistory> createState() => _BillinngHistoryState();
}

class _BillinngHistoryState extends State<BillingHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Tagihan'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [Text('Hi'), Text('Makan')],
      )),
    );
  }
}

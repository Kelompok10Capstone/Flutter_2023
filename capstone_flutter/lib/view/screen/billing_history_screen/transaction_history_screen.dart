import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Riwayat Transaksi',
          style: blackFont20.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: Center(
              child: Image(
                image: AssetImage('assets/telkomsel.png'),
                fit: BoxFit.contain,
                width: 180,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 30),
                child: Text(
                  'Pembayaran Pulsa',
                  style: blackFont14G.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jenis',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
                Text(
                  'TLKM15.00',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'No. Handphone',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
                Text(
                  '082278xxxx',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Harga',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
                Text(
                  'Rp 16.500',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5, left: 30, right: 30),
            child: Divider(
              color: Colors.black,
              thickness: 1,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFBADDB1),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  alignment: Alignment.center,
                  width: 352,
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Tagihan',
                        style: blackFont14G.copyWith(color: Colors.black),
                        ),
                        Text('Rp 16.500',
                        style: blackFont14G.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

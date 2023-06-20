import 'package:flutter/material.dart';

import '../../../models/history_model.dart';
import '../../../utils/const/theme.dart';

class TransactionHistory extends StatefulWidget {
  final Transaction transaction;
  const TransactionHistory({super.key, required this.transaction});

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                widget.transaction.description,
                style: blackFont14G.copyWith(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Jenis',
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                  Text(
                    widget.transaction.productType,
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'No. Handphone',
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                  Text(
                    widget.transaction.phoneNumber,
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Harga',
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                  Text(
                    ('Rp. ${widget.transaction.price}').toString(),
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Diskon',
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                  Text(
                    ('Rp. ${widget.transaction.discountPrice}').toString(),
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Divider(
                color: Colors.black,
                thickness: 1,
              ),
            ),
            Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFBADDB1),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      alignment: Alignment.center,
                      width: 350,
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Tagihan',
                              style: blackFont14G.copyWith(color: Colors.black),
                            ),
                            Text(
                              ('Rp. ${widget.transaction.totalPrice + widget.transaction.discountPrice}')
                                  .toString(),
                              style: blackFont14G.copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

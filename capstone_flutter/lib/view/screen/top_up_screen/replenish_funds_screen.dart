import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class ReplenishFunds extends StatefulWidget {
  const ReplenishFunds({super.key});

  @override
  State<ReplenishFunds> createState() => _ReplenishFundsState();
}

class _ReplenishFundsState extends State<ReplenishFunds> {
  final List<Item> _data = generateItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Top Up',
          style: blackFont20.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    'Metode isi Saldo',
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 20),
                  child: Image(
                    image: AssetImage('assets/bca.png'),
                    width: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Text(
                    'Transfer Bank (BCA)',
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 105),
                  child: Text(
                    'Ganti',
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 5),
                  child: Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: 25,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 3, left: 20, right: 20),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Nomor Akun Virtual BCA',
                style: blackFont14G.copyWith(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                '6239 0548 1376 9327',
                style: blackFont18.copyWith(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: InkWell(
                splashColor: Colors.green.withOpacity(0.5),
                highlightColor: const Color(0xFF1A73E9).withOpacity(0.4),
                onTap: () {},
                borderRadius: BorderRadius.circular(13),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                      color: blueColor,
                      width: 2,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Text('SALIN KODE',
                      style: blackFont14G.copyWith(color: blueColor)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Nama Akun : Ijat Sutresno',
                style: blackFont14G.copyWith(color: Colors.grey),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20),
                  child: Text(
                    'Cara isi saldo :',
                    style: blackFont14.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ExpansionPanelList(
                    elevation: 1,
                    expandedHeaderPadding: const EdgeInsets.all(0),
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _data[index].isExpanded = !isExpanded;
                      });
                    },
                    children: _data.map<ExpansionPanel>((Item item) {
                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(
                              item.headerValue,
                              style: blackFont14G.copyWith(color: Colors.black),
                            ),
                          );
                        },
                        body: ListTile(
                          title: Text(
                            item.expandedValue,
                            style: blackFont14.copyWith(color: Colors.black),
                          ),
                        ),
                        isExpanded: item.isExpanded,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 90, bottom: 40),
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 17),
                backgroundColor: blueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Selesai',
                style: whiteFont16,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems() {
  return <Item>[
    Item(
      headerValue: 'ATM BCA',
      expandedValue: 
          '1. Pada menu utama klik Transaksi lainnya > Transfer.\n'
          '2. Masukkan nomor virtual akun 6239 0548 1376 9327.\n'
          '3. Masukkan jumlah saldo sesuai kebutuhan (Minimal isi saldo Rp10.000).\n'
          '4. Konfirmasikan transaksi dan periksa kembali rincian yang telah dimasukkan. Pastikan semuanya benar sebelum melanjutkan.\n'
          '5. Setelah transaksi dikonfirmasi, mesin ATM akan memproses. Tunggu hingga proses selesai.',
    ),
    Item(
      headerValue: 'm-BCA (BCA Mobile)',
      expandedValue: 
          '1. Masuk ke akun m-banking.\n'
          '2. Pilih menu m-Transfer > BCA virtual akun.\n'
          '3. Masukkan virtual akun 6239 0548 1376 9327.\n'
          '4. Masukkan jumlah saldo sesuai kebutuhan (Minimal isi saldo Rp10.000).\n'
          '5. Konfirmasikan transaksi dan periksa kembali rincian yang telah dimasukkan. Pastikan semuanya benar sebelum melanjutkan.\n'
          '6. Setelah transaksi dikonfirmasi, sistem akan memproses. Tunggu hingga proses selesai.',
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/const/theme.dart';
import '../../../view_model/dummy_data.dart';
import '../../../view_model/dummy_pulsa.dart';
import 'detail_pembayaran_pulsa_screen.dart';
import 'paket_data/detail_pembayaran_paket_data_screen.dart';

class PulsaDanPaketDataScreen extends StatefulWidget {
  const PulsaDanPaketDataScreen({super.key});

  @override
  State<PulsaDanPaketDataScreen> createState() =>
      _PulsaDanPaketDataScreenState();
}

class _PulsaDanPaketDataScreenState extends State<PulsaDanPaketDataScreen>
    with SingleTickerProviderStateMixin {
  // text editing controller
  final TextEditingController phoneController = TextEditingController();

  // tab controller
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Pulsa & Paket Data',
          style: blackFont18.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'No. Telp*',
              style: blackFont14,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 60,
                  child: TextFormField(
                    autofocus: false,
                    controller: phoneController,
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    // enabled: false,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                      hintText: "+62",
                      hintStyle: blackFont14.copyWith(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 110,
                  // width: 249,
                  child: TextFormField(
                    autofocus: false,
                    controller: phoneController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    // textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                      hintText: 'Contoh: 81234567890',
                      hintStyle: blackFont12.copyWith(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Silahkan masukkan nomor Hp mu',
              style: blackFont12.copyWith(
                color: Color(0xff6C6C6C),
              ),
            ),
            const SizedBox(height: 20),
            TabBar(
              controller: _tabController,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: blueColor, width: 2),
              ),
              tabs: [
                Tab(
                  child: Text(
                    'Pulsa',
                    style: blackFont14,
                  ),
                ),
                Tab(
                  child: Text(
                    'Data',
                    style: blackFont14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26),
            Text(
              'Telkomsel',
              style: blackFont16,
            ),
            const SizedBox(height: 14),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildPulsaTab(),
                  _buildDataTab(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: 30, left: 24, right: 24, top: 20),
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
            onPressed: () {
              if (_tabController?.index == 0) {
                // Jika tab Token aktif, arahkan pengguna ke layar Pulsa
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailPembayaranPulsaScreen(),
                  ),
                );
              } else if (_tabController?.index == 1) {
                // Jika tab Tagihan aktif, arahkan pengguna ke layar paket data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const DetailPembayaranPaketDataScreen(),
                  ),
                );
              }

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const DetailPembayaranPulsaScreen(),
              //   ),
              // );
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

  Widget _buildPulsaTab() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 2,
      ),
      itemCount: dummyPulsaData.length,
      itemBuilder: (context, index) {
        final data = dummyPulsaData[index];

        return GestureDetector(
          onTap: () {
            setState(() {
              dummyPulsaData[index]['isSelected'] =
                  !dummyPulsaData[index]['isSelected'];
            });
          },
          child: Container(
            // width: 15,
            // height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: dummyPulsaData[index]['isSelected'] == true
                    ? Color(0xff2B3990)
                    : Colors.black,
              ),
              color: dummyPulsaData[index]['isSelected'] == true
                  ? Color(0xff2B3990)
                  : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${data['nominal']}',
                    style: blackFont18.copyWith(
                      color: dummyPulsaData[index]['isSelected'] == true
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${data['hargaJual']}',
                        style: blueFont14.copyWith(
                          color: dummyPulsaData[index]['isSelected'] == true
                              ? Colors.white
                              : Color(0xff2B3990),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${data['hargaCoret']}',
                        style: blackFont12.copyWith(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDataTab() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 2,
      ),
      itemCount: dummyPaketData.length,
      itemBuilder: (context, index) {
        final data = dummyPaketData[index];

        return GestureDetector(
          onTap: () {
            setState(() {
              dummyPaketData[index]['isSelected'] =
                  !dummyPaketData[index]['isSelected'];
            });
          },
          child: Container(
            // width: 15,
            // height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: dummyPaketData[index]['isSelected'] == true
                    ? const Color(0xff2B3990)
                    : Colors.black,
              ),
              color: dummyPaketData[index]['isSelected'] == true
                  ? const Color(0xff2B3990)
                  : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${data['nominal']} GB',
                    style: blackFont18.copyWith(
                      color: dummyPaketData[index]['isSelected'] == true
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${data['hargaJual']}',
                        style: blueFont14.copyWith(
                          color: dummyPaketData[index]['isSelected'] == true
                              ? Colors.white
                              : const Color(0xff2B3990),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${data['hargaCoret']}',
                        style: blackFont12.copyWith(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

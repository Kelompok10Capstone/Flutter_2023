import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../models/pulsa_paket_data.dart';
import '../../../utils/const/theme.dart';
import '../../../view_model/pulsa_paket_data_view_model.dart';
import 'detail_pembayaran_pulsa_screen.dart';
import 'paket_data/detail_pembayaran_paket_data_screen.dart';

class PulsaDanPaketDataScreen extends StatefulWidget {
  const PulsaDanPaketDataScreen({
    super.key,
  });

  @override
  State<PulsaDanPaketDataScreen> createState() =>
      _PulsaDanPaketDataScreenState();
}

class _PulsaDanPaketDataScreenState extends State<PulsaDanPaketDataScreen>
    with SingleTickerProviderStateMixin {
  // text editing controller
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController phone62Controller = TextEditingController();

  // tab controller
  TabController? _tabController;

  bool isPhoneNumberEntered = false;

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
    phone62Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pulsaPaketDataProvider =
        Provider.of<PulsaDanPaketDataViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: GestureDetector(
          onTap: () async {
            pulsaPaketDataProvider.getPhone();
          },
          child: Text(
            'Pulsa & Paket Data',
            style: blackFont18.copyWith(color: Colors.black),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<PulsaDanPaketDataViewModel>(
          builder: (context, pulsaPaketDataProvider, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  'No. Telp',
                  style: blackFont14,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                      child: TextFormField(
                        autofocus: true,
                        controller: phoneController,
                        obscureText: true,
                        enabled: false,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(16, 0, 10, 0),
                          hintText: "+62",
                          hintStyle: blackFont14.copyWith(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 110,
                      // width: 249,
                      child: TextFormField(
                        autofocus: false,
                        controller: phone62Controller,
                        obscureText: false,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 0, 20, 0),
                          hintText: 'Contoh: 81234567890',
                          hintStyle: blackFont12.copyWith(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          suffixIcon: phone62Controller.text.length > 9
                              ? Container(
                                  height: 20,
                                  width: 20,
                                  margin: const EdgeInsets.all(10.0),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                  child: const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                )
                              : null,
                        ),
                        onChanged: (value) {
                          if (value.length <= 4) {
                            setState(() {
                              isPhoneNumberEntered = value.isNotEmpty;
                              pulsaPaketDataProvider.users.clear();
                            });
                          }
                        },
                        onFieldSubmitted: (value) {
                          if (value.length <= 4) {
                            pulsaPaketDataProvider.getPhone();
                          }
                        },
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
                    color: const Color(0xff6C6C6C),
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
                Consumer<PulsaDanPaketDataViewModel>(
                  builder: (context, pulsaPaketDataProvider, _) {
                    final List<PulsaPaketdataData> users =
                        pulsaPaketDataProvider.users;
                    const int index =
                        0; // Ganti dengan indeks yang sesuai dengan kebutuhan Anda
                    final String providerText =
                        users.isNotEmpty ? users[index].provider : ' Provider';
                    return Text(
                      providerText,
                      style: blackFont16,
                    );
                  },
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
            );
          },
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

  Widget _buildEmptyTab() {
    return Center(
      child: Text(
        isPhoneNumberEntered ? 'Data Kosong' : 'Masukkan nomor telepon',
        style: blackFont16,
      ),
    );
  }

  Widget _buildPulsaTab() {
    return Consumer<PulsaDanPaketDataViewModel>(
      builder: (context, viewModel, _) {
        var pulsaPaketDataProvider = viewModel;

        if (pulsaPaketDataProvider.users.isEmpty) {
          return _buildEmptyTab();
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 2,
            ),
            itemCount: pulsaPaketDataProvider.users.length,
            itemBuilder: (context, index) {
              var data = pulsaPaketDataProvider.users[index];

              return GestureDetector(
                onTap: () {
                  if (data.isSelected == true) {
                    setState(() {
                      data.isSelected = false;
                    });
                  } else {
                    setState(() {
                      data.isSelected = true;
                    });
                  }
                  // setState(() {
                  //   data.isSelected = data.isSelected ? false : true;
                  // });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: data.isSelected == true
                          ? const Color(0xff2B3990)
                          : Colors.black,
                    ),
                    color: data.isSelected == true
                        ? const Color(0xff2B3990)
                        : Colors.white,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data.price.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: data.isSelected == true
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rp.${data.price.toString()}',
                              style: TextStyle(
                                fontSize: 14,
                                color: data.isSelected == true
                                    ? Colors.white
                                    : const Color(0xff2B3990),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Rp.${data.price.toString()}',
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
      },
    );
  }

  Widget _buildDataTab() {
    return Consumer<PulsaDanPaketDataViewModel>(
      builder: (context, viewModel, _) {
        var pulsaPaketDataProvider = viewModel;

        if (pulsaPaketDataProvider.users.isEmpty) {
          return _buildEmptyTab();
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 2,
            ),
            itemCount: pulsaPaketDataProvider.users.length,
            itemBuilder: (context, index) {
              var data = pulsaPaketDataProvider.users[index];

              return GestureDetector(
                onTap: () {
                  setState(() {
                    data.isSelected = data.isSelected ? false : true;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: data.isSelected == true
                          ? const Color(0xff2B3990)
                          : Colors.black,
                    ),
                    color: data.isSelected == true
                        ? const Color(0xff2B3990)
                        : Colors.white,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${data.name.toString()} \n(10 GB)',
                          // data.price.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: data.isSelected == true
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data.price.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                color: data.isSelected == true
                                    ? Colors.white
                                    : const Color(0xff2B3990),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              data.price.toString(),
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
      },
    );
  }
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/pulsa_paket_data.dart';
import '../../../utils/const/theme.dart';
import '../../../view_model/pulsa_paketdata/paket_data_detail_view_model.dart';
import '../../../view_model/pulsa_paketdata/pulsa_paket_data_view_model.dart';
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

class PaketData {
  final String? phone62;
  final String? price;
  final String? name;
  final String? provider;
  final String? description;
  final String? code;
  final String? id;
  final String? type;

  PaketData({
    this.phone62,
    this.price,
    this.name,
    this.provider,
    this.description,
    this.code,
    this.id,
    this.type,
  });
}

class _PulsaDanPaketDataScreenState extends State<PulsaDanPaketDataScreen>
    with SingleTickerProviderStateMixin {
  // text editing controller
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController phone62Controller = TextEditingController();

  // tab controller
  TabController? _tabController;

  bool isPhoneNumberEntered = false;
  late SharedPreferences _prefs;
  String token = '';

  Future<void> initializeData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      token = _prefs.getString('token') ?? '';
      print("token ppd : $token");
    });
  }

  @override
  void initState() {
    super.initState();
    initializeData();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
    phoneController.dispose();
    phone62Controller.dispose();
  }

  // String getProviderFromPhoneNumber(String phone) {
  //   switch (phone) {
  //     case "0852":
  //     case "0853":
  //     case "0823":
  //     case "0851":
  //       return "AS";
  //     case "0811":
  //       return "Halo";
  //     case "0812":
  //     case "0813":
  //     case "0821":
  //     case "0822":
  //       return "Telkomsel";
  //     case "0814":
  //     case "0815":
  //     case "0816":
  //     case "0855":
  //     case "0856":
  //     case "0857":
  //     case "0858":
  //       return "Indosat";
  //     case "0817":
  //     case "0818":
  //     case "0859":
  //     case "0877":
  //     case "0878":
  //       return "XL";
  //     case "0838":
  //     case "0831":
  //     case "0832":
  //     case "0833":
  //       return "Axis";
  //     case "0895":
  //     case "0896":
  //     case "0897":
  //     case "0898":
  //     case "0899":
  //       return "Three";
  //     case "0881":
  //     case "0882":
  //     case "0883":
  //     case "0884":
  //     case "0885":
  //     case "0886":
  //     case "0887":
  //     case "0888":
  //     case "0889":
  //       return "Smatfren";
  //     default:
  //       return "Unknown";
  //   }
  // }

  // void checkPhoneNumber(String phoneNumber) {
  //   final provider = getProviderFromPhoneNumber(phoneNumber);
  //   if (provider != "Unknown") {
  //     setState(() {
  //       isPhoneNumberEntered = true;
  //     });
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text('Error'),
  //           content: Text('Invalid phone number'),
  //           actions: [
  //             ElevatedButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

  // void handlePhoneNumberSubmit() {
  //   final phone62Number = phone62Controller.text;
  //   checkPhoneNumber(phone62Number);
  // }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final pulsaPaketDataProvider =
        Provider.of<PulsaDanPaketDataViewModel>(context);
    final pakeDataProvider =
        Provider.of<PaketDataProvider>(context, listen: false);
    // final paketdataDataProvider = Provider.of<PaketDataViewModel>(context);

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
                          hintText: 'Contoh: 081234567890',
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
                          if (value.length > 9) {
                            setState(() {
                              isPhoneNumberEntered = value.isNotEmpty;
                            });
                          }
                        },
                        onFieldSubmitted: (value) {
                          if (value.length > 9) {
                            pulsaPaketDataProvider.getPhone(value);
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
                        pulsaPaketDataProvider.paketData;
                    const int index =
                        0; // Ganti dengan indeks yang sesuai dengan kebutuhan Anda
                    final String providerText =
                        users.isNotEmpty ? users[index].provider : ' ';
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
              backgroundColor: isPhoneNumberEntered ? blueColor : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: isPhoneNumberEntered
                ? () {
                    if (_tabController?.index == 0) {
                      List<PulsaPaketdataData> users =
                          pulsaPaketDataProvider.pulsa;
                      int index =
                          0; // Ganti dengan indeks yang sesuai dengan kebutuhan Anda
                      String providerText =
                          users.isNotEmpty ? users[index].provider : '';
                      String nameText =
                          users.isNotEmpty ? users[index].name : '';
                      String descriptionText =
                          users.isNotEmpty ? users[index].description : '';
                      String codeText =
                          users.isNotEmpty ? users[index].code : '';
                      String priceText =
                          users.isNotEmpty ? users[index].price.toString() : '';
                      String idText =
                          users.isNotEmpty ? users[index].id.toString() : '';

                      PaketData pulsa = PaketData(
                        name: nameText,
                        price: priceText,
                        phone62: phone62Controller.text,
                        provider: providerText,
                        description: descriptionText,
                        code: codeText,
                        id: idText,
                      );

                      Provider.of<PaketDataProvider>(context, listen: false)
                          .setPulsa(pulsa);
                      // Jika tab Token aktif, arahkan pengguna ke layar Pulsa
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPembayaranPulsaScreen(token: token),
                        ),
                      );
                    } else if (_tabController?.index == 1) {
                      List<PulsaPaketdataData> users =
                          pulsaPaketDataProvider.paketData;
                      int index =
                          0; // Ganti dengan indeks yang sesuai dengan kebutuhan Anda
                      String providerText =
                          users.isNotEmpty ? users[index].provider : '';
                      String nameText =
                          users.isNotEmpty ? users[index].name : '';
                      String descriptionText =
                          users.isNotEmpty ? users[index].description : '';
                      String codeText =
                          users.isNotEmpty ? users[index].code : '';
                      String priceText =
                          users.isNotEmpty ? users[index].price.toString() : '';
                      String idText =
                          users.isNotEmpty ? users[index].id.toString() : '';

                      PaketData paketData = PaketData(
                        name: nameText,
                        price: priceText,
                        phone62: phone62Controller.text,
                        provider: providerText,
                        description: descriptionText,
                        code: codeText,
                        id: idText,
                      );

                      Provider.of<PaketDataProvider>(context, listen: false)
                          .setPaketData(paketData);
                      // Jika tab Tagihan aktif, arahkan pengguna ke layar paket data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPembayaranPaketDataScreen(token: token),
                        ),
                      );
                    }
                  }
                : null,
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

        if (pulsaPaketDataProvider.pulsa.isEmpty) {
          return _buildEmptyTab();
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 2,
            ),
            itemCount: pulsaPaketDataProvider.pulsa.length,
            itemBuilder: (context, index) {
              var data = pulsaPaketDataProvider.pulsa[index];

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
                          data.name.toString(),
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
                            // Text(
                            //   'Rp.${data.price.toString()}',
                            //   style: blackFont12.copyWith(
                            //     color: Colors.grey,
                            //     decoration: TextDecoration.lineThrough,
                            //   ),
                            // ),
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

        if (pulsaPaketDataProvider.paketData.isEmpty) {
          return _buildEmptyTab();
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 2,
            ),
            itemCount: pulsaPaketDataProvider.paketData.length,
            itemBuilder: (context, index) {
              var data = pulsaPaketDataProvider.paketData[index];

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
                          data.name.toString(),
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
                            // Text(
                            //   'Rp.${data.price.toString()}',
                            //   style: blackFont12.copyWith(
                            //     color: Colors.grey,
                            //     decoration: TextDecoration.lineThrough,
                            //   ),
                            // ),
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

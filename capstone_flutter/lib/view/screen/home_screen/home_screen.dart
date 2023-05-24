import 'package:capstone_flutter/view/screen/pdam_screen/pdam_screen.dart';
import 'package:capstone_flutter/view/screen/profile_screen/profile_screen.dart';
import 'package:capstone_flutter/view/screen/riwayat_tagihan/riwayat_tagihan_screen.dart';
import 'package:capstone_flutter/view/screen/wifi_screen/modal_bottom_wifi_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/const/theme.dart';
import '../bpjs_screen/modal_bottom_bpjs_screen.dart';
import '../bpjs_screen/payment_detail_bpjs_screen.dart';
import '../pulsa&paket_data_screen/pulsa&paketData_screen.dart';
import '../token_screen/modal_bottom_token_screen.dart';
import '../token_screen/product_detail_screen.dart';
import '../wifi_screen/payment_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<String> imageList = [
  'assets/promo_1.png',
  'assets/promo_2.png',
  'assets/promo_3.png',
  'assets/promo_4.png',
  'assets/promo_5.png',
];

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  TextEditingController pelangganControllerToken = TextEditingController();
  TextEditingController pelangganControllerBpjs = TextEditingController();
  TextEditingController pelangganControllerWifi = TextEditingController();
  @override
  void dispose() {
    pelangganControllerBpjs.dispose();
    _tabController?.dispose();
    pelangganControllerToken.dispose();
    pelangganControllerWifi.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/motif_berwarna.png',
                      fit: BoxFit.cover,
                      height: 253,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 22, top: 45),
                      child: Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/profile_home.png')),
                          borderRadius: BorderRadius.circular(37),
                          border: Border.all(
                            color: const Color(0xFF1D2660),
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 58, left: 125),
                      child: Text(
                        'Ijat Sutresno',
                        style: whiteFont18.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 87, left: 125),
                      child: Text(
                        '082267548923',
                        style: whiteFont14.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 58, left: 338),
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Icon(Icons.notifications_outlined,
                            color: Colors.white, size: 28),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 110, left: 17),
                      child: Image(
                        image: AssetImage(
                          'assets/motif_polos.png',
                        ),
                        fit: BoxFit.cover,
                        height: 270,
                        width: 360,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 168, left: 18),
                      child: Row(
                        children: [
                          Container(
                            height: 2,
                            width: MediaQuery.of(context).size.width * 0.10,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              "skuypay",
                              style: whiteFont16.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Container(
                              height: 2,
                              width: MediaQuery.of(context).size.height * 0.293,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 250, left: 44),
                      child: Text(
                        'Saldo',
                        style: whiteFont16.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 270, left: 44),
                      child: Text(
                        'Rp 150.000',
                        style: whiteFont25.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 252, left: 254),
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Icon(Icons.send_to_mobile_outlined,
                            color: Color(0xFFFCDB80), size: 26),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 294, left: 256),
                      child: Text(
                        'Transfer',
                        style: whiteFont12M.copyWith(
                          // fontSize: 10,
                          color: const Color(0xFFFCDB80),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 252, left: 314),
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Icon(Icons.add_card_outlined,
                            color: Color(0xFFFCDB80), size: 26),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 294, left: 318),
                      child: Text(
                        'Top Up',
                        style: whiteFont12M.copyWith(
                          color: const Color(0xFFFCDB80),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 345),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(top: 25),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.18),
                                spreadRadius: 1,
                                blurRadius: 9,
                                offset: const Offset(0, -8)),
                          ],
                          color: const Color(0xFFEDF8FB),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(22),
                            topRight: Radius.circular(22),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 360, left: 28),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: InkWell(
                              onTap: () {},
                              child: Stack(
                                children: [
                                  Container(
                                    width: 85,
                                    height: 85,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFEDF8FB),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.phone_iphone_outlined,
                                            color: Color(0xFF2B3990), size: 30),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          'Pulsa & Data',
                                          style: whiteFont12E.copyWith(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(42),
                                        splashColor:
                                            Colors.green.withOpacity(0.5),
                                        highlightColor:
                                            Colors.blue.withOpacity(0.4),
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const PulsaDanPaketDataScreen(),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: InkWell(
                              onTap: () {},
                              child: Stack(
                                children: [
                                  Container(
                                    width: 85,
                                    height: 85,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFEDF8FB),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Image(
                                          image: AssetImage(
                                            'assets/family_restroom.png',
                                          ),
                                          fit: BoxFit.cover,
                                          height: 30,
                                          width: 30,
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          'BPJS',
                                          style: whiteFont12E.copyWith(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(42),
                                        splashColor:
                                            Colors.green.withOpacity(0.5),
                                        highlightColor:
                                            Colors.blue.withOpacity(0.4),
                                        onTap: () {
                                          _showModalBottomSheetBpjs(context);
                                          // //ModalBottomBpjs
                                          // Navigator.of(context).push(
                                          //   MaterialPageRoute(
                                          //     builder: (context) =>
                                          //         const ModalBottomBpjs(),
                                          //   ),
                                          // );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Stack(
                              children: [
                                Container(
                                  width: 85,
                                  height: 85,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFEDF8FB),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                          'assets/flash_on.png',
                                        ),
                                        fit: BoxFit.contain,
                                        height: 30,
                                        width: 30,
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        'PLN',
                                        style: whiteFont12E.copyWith(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned.fill(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(42),
                                      splashColor:
                                          Colors.green.withOpacity(0.5),
                                      highlightColor:
                                          Colors.blue.withOpacity(0.4),
                                      onTap: () {
                                        _showModalBottomSheetToken(context);
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         const ModalBottomToken(),
                                        //   ),
                                        // );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 460, left: 28),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: InkWell(
                              onTap: () {},
                              child: Stack(
                                children: [
                                  Container(
                                    width: 85,
                                    height: 85,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFEDF8FB),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.wifi,
                                            color: Color(0xFF21660E), size: 30),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          'Wifi',
                                          style: whiteFont12E.copyWith(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(42),
                                        splashColor:
                                            Colors.green.withOpacity(0.5),
                                        highlightColor:
                                            Colors.blue.withOpacity(0.4),
                                        onTap: () {
                                          _showModalBottomSheetWifi();
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) =>
                                          //         const ModalBottomWifi(),
                                          //   ),
                                          // );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: InkWell(
                              onTap: () {},
                              child: Stack(
                                children: [
                                  Container(
                                    width: 85,
                                    height: 85,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFEDF8FB),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.water_drop_outlined,
                                            color: Color(0xFF27AAE1), size: 30),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          'PDAM',
                                          style: whiteFont12E.copyWith(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(42),
                                        splashColor:
                                            Colors.green.withOpacity(0.5),
                                        highlightColor:
                                            Colors.blue.withOpacity(0.4),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PdamScreen()));
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Stack(
                              children: [
                                Container(
                                  width: 85,
                                  height: 85,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFEDF8FB),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.school_outlined,
                                          color: Color(0xFFE07664), size: 30),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        'Pendidikan',
                                        style: whiteFont12E.copyWith(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned.fill(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(42),
                                      splashColor:
                                          Colors.green.withOpacity(0.5),
                                      highlightColor:
                                          Colors.blue.withOpacity(0.4),
                                      onTap: () {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 555, left: 30),
                      child: Text(
                        'Promo',
                        style: whiteFont16M.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 555, left: 280),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              'Lihat Semua',
                              style: whiteFont14.copyWith(
                                color: const Color(0xFF2B3990),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color(0xFF2B3990),
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                enlargeCenterPage: false,
                enableInfiniteScroll: true,
                height: 160,
                aspectRatio: 16 / 9,
                scrollDirection: Axis.horizontal,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                viewportFraction: 0.9,
                pauseAutoPlayOnTouch: true,
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlay: true,
              ),
              itemCount: imageList.length,
              itemBuilder: (context, i, id) {
                return GestureDetector(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      imageList[i],
                      width: 340,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showModalBottomSheetToken(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.85,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Listrik',
                      style: blackFont18,
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
                          'Token',
                          style: blackFont14,
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Tagihan',
                          style: blackFont14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildTokenTab(context),
                        _buildTagihanTab(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ProductDetailScreen()));
                        },
                        child: Text(
                          'Lanjutkan',
                          style: whiteFont14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showModalBottomSheetBpjs(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3.5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'BPJS Kesehatan',
                    style: blackText24,
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
                    controller: pelangganControllerToken,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: blackFont16,
                      hintText: 'Masukkan No Pelanggan',
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PaymentDetailBpjs()));
                      },
                      child: Text(
                        'Lanjutkan',
                        style: whiteFont14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showModalBottomSheetWifi() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3.5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'WIFI',
                    style: blackText24,
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
                    controller: pelangganControllerWifi,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: blackFont16,
                      hintText: 'Masukkan No Pelanggan',
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PaymentDetailWifi()));
                      },
                      child: Text(
                        'Lanjutkan',
                        style: whiteFont14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTokenTab(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                controller: pelangganControllerToken,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: blackFont16,
                  hintText: 'Masukkan No Pelanggan',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTagihanTab() {
    return Center(
      child: Text(
        'Tagihan',
        style: blackFont16,
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const RiwayatTagihanScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF591CD1),
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        iconSize: 26,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_outlined), label: 'Riwayat Tagihan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Akun'),
        ],
      ),
    );
  }
}

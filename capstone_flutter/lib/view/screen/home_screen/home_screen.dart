import 'package:capstone_flutter/view/screen/notification_screen/notification_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/const/theme.dart';

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

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  child: AspectRatio(
                    aspectRatio: 17 / 11,
                    child: Image.asset(
                      'assets/motif_berwarna.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 45.h,
                  left: 22.w,
                  child: Container(
                    height: 70.h,
                    width: 65.w,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/profile_home.png')),
                      borderRadius: BorderRadius.circular(50).r,
                      border: Border.all(
                        color: const Color(0xFF1D2660),
                        style: BorderStyle.solid,
                        width: 2.w,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 60.h,
                  left: 115.w,
                  child: Text(
                    'Ijat Sutresno',
                    style: whiteFont18.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 90.h,
                  left: 115.w,
                  child: Text(
                    '082267548923',
                    style: whiteFont14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 60.h,
                  left: 310.w,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NotificationScreen()));
                    },
                    child: SizedBox(
                      width: 48.w,
                      height: 48.h,
                      child: const Icon(Icons.notifications_outlined,
                          color: Colors.white, size: 28),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 125.h,
                  ).r,
                  child: SizedBox(
                    child: AspectRatio(
                      aspectRatio: 16 / 11,
                      child: Image.asset(
                        'assets/motif_polos.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 190.h,
                  left: 13.w,
                  child: Container(
                    height: 1.h,
                    width: 30.w,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 180.h,
                  left: 60.w,
                  child: Text('skuypay',
                      style: whiteFont16.copyWith(
                        color: Colors.white,
                      )),
                ),
                Positioned(
                  top: 190.h,
                  left: 130.w,
                  child: Container(
                    height: 1.h,
                    width: 215.w,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 250.h,
                  left: 35.w,
                  child: Text(
                    'Saldo',
                    style: whiteFont16.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 270.h,
                  left: 35.w,
                  child: Text(
                    'Rp 150.000',
                    style: whiteFont25.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 255.h,
                  left: 220.w,
                  child: const SizedBox(
                    width: 48,
                    height: 48,
                    child: Icon(Icons.send_to_mobile_outlined,
                        color: Color(0xFFFCDB80), size: 26),
                  ),
                ),
                Positioned(
                  top: 300.h,
                  left: 223.w,
                  child: Text(
                    'Transfer',
                    style: whiteFont12M.copyWith(
                      // fontSize: 10,
                      color: const Color(0xFFFCDB80),
                    ),
                  ),
                ),
                Positioned(
                  top: 255.h,
                  left: 280.w,
                  child: SizedBox(
                    width: 48.w,
                    height: 48.h,
                    child: const Icon(Icons.add_card_outlined,
                        color: Color(0xFFFCDB80), size: 26),
                  ),
                ),
                Positioned(
                  top: 300.h,
                  left: 285.w,
                  child: Text(
                    'Top Up',
                    style: whiteFont12M.copyWith(
                      // fontSize: 10,
                      color: const Color(0xFFFCDB80),
                    ),
                  ),
                ),
                Positioned(
                  top: 363.h,
                  child: Container(
                    height: MediaQuery.of(context).size.height.h,
                    width: MediaQuery.of(context).size.width.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 9,
                            offset: const Offset(0, -8)),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 380.h,
                    left: 35.w,
                    right: 35.h,
                  ).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Stack(
                          children: [
                            Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFEDF8FB),
                                  borderRadius: BorderRadius.circular(50).r
                                  ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                  borderRadius: BorderRadius.circular(42).r,
                                  splashColor: Colors.green.withOpacity(0.5),
                                  highlightColor: Colors.blue.withOpacity(0.4),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ],
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
                                  borderRadius: BorderRadius.circular(50).r
                                  ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                  borderRadius: BorderRadius.circular(42).r,
                                  splashColor: Colors.green.withOpacity(0.5),
                                  highlightColor: Colors.blue.withOpacity(0.4),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ],
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
                                  borderRadius: BorderRadius.circular(50).r
                                  ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: const AssetImage(
                                      'assets/flash_on.png',
                                    ),
                                    fit: BoxFit.contain,
                                    height: 30.h,
                                    width: 30.w,
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
                                  borderRadius: BorderRadius.circular(42).r,
                                  splashColor: Colors.green.withOpacity(0.5),
                                  highlightColor: Colors.blue.withOpacity(0.4),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
<<<<<<< HEAD
=======
                  const SizedBox(height: 5),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildTokenTab(),
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
                          if (_tabController?.index == 0) {
                            // Jika tab Token aktif, arahkan pengguna ke layar Token
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ProductDetailScreen(),
                              ),
                            );
                          } else if (_tabController?.index == 1) {
                            // Jika tab Tagihan aktif, arahkan pengguna ke layar Tagihan
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const DetailPembayaranTagihanListrik(),
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
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // Adjust bottom padding based on keyboard height
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 350,
            // height: MediaQuery.of(context).size.height / 2.7,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'BPJS Kesehatan',
                      style: blackText24.copyWith(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'No. Pelanggan',
                    style: blackFont14.copyWith(fontWeight: FontWeight.w500),
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
                      controller: pelangganControllerBpjs,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: blackFont12,
                        hintText: 'Masukkan No Pelanggan',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Periode',
                    style: blackFont14.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedMonth,
                        hint: Text(
                          'Pilih Bulan',
                          style: blackFont12,
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedMonth = value!;
                          });
                        },
                        items: months.map((String month) {
                          return DropdownMenuItem<String>(
                            value: month,
                            child: Text(
                              month,
                              style: blackFont12,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                  )),
                  // const SizedBox(height: 25),

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
          ),
        );
      },
    );
  }

  void _showModalBottomSheetWifi() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // Adjust bottom padding based on keyboard height
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250,
            // height: MediaQuery.of(context).size.height / 2.7,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'WIFI',
                      style: blackText16.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'No. Pelanggan',
                    style: blackFont14.copyWith(fontWeight: FontWeight.w400),
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
                        hintStyle: blackFont12.copyWith(color: Colors.grey),
                        hintText: 'Masukkan No Pelanggan',
                      ),
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                  )),
                  // const SizedBox(height: 25),

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
                        child: Text('Lanjutkan', style: whiteFont14),
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

  void _showModalBottomSheetCreatePin() {
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
          height: 270,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/create_pin.png',
                    scale: 4,
                  ),
>>>>>>> 239d8c112a3b19b7a7f3c3a60690744943c03ff9
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 480.h,
                    left: 35.w,
                    right: 35.h,
                  ).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Stack(
                          children: [
                            Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFEDF8FB),
                                  borderRadius: BorderRadius.circular(50).r
                                  ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                  borderRadius: BorderRadius.circular(42).r,
                                  splashColor: Colors.green.withOpacity(0.5),
                                  highlightColor: Colors.blue.withOpacity(0.4),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ],
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
                                  borderRadius: BorderRadius.circular(50).r
                                  ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                  borderRadius: BorderRadius.circular(42).r,
                                  splashColor: Colors.green.withOpacity(0.5),
                                  highlightColor: Colors.blue.withOpacity(0.4),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ],
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
                                  borderRadius: BorderRadius.circular(50).r
                                  ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.school_outlined,
                                      color: Color(0xFFE07664), size: 30),
                                  SizedBox(
                                    height: 7.h,
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
                                  borderRadius: BorderRadius.circular(42).r,
                                  splashColor: Colors.green.withOpacity(0.5),
                                  highlightColor: Colors.blue.withOpacity(0.4),
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
                  padding:
                      EdgeInsets.only(
                        top: 580.h, 
                        left: 20.w,
                        right: 20.h, 
                        ).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Promo',
                        style: whiteFont16M.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              'Lihat Semua',
                              style: whiteFont14.copyWith(
                                color: const Color(0xFF2B3990),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color(0xFF2B3990),
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 595,
                    ).r,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      enlargeCenterPage: false,
                      enableInfiniteScroll: true,
                      height: 160.h,
                      aspectRatio: 16.h / 9.w,
                      scrollDirection: Axis.horizontal,
                      // scrollPhysics: const NeverScrollableScrollPhysics(),
                      viewportFraction: 0.9,
                      pauseAutoPlayOnTouch: true,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      autoPlay: true,
                    ),
                    itemCount: imageList.length,
                    itemBuilder: (context, i, id) {
                      return GestureDetector(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15).r,
                          child: Image.asset(
                            imageList[i],
                            width: 310.w,
                            fit: BoxFit.contain,
                          ),
                        ),
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
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
    const HomeScreen(),
    const HomeScreen(),
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

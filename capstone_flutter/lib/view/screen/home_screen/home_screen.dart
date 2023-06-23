import 'package:capstone_flutter/view/screen/pdam_screen/pdam_screen.dart';
import 'package:capstone_flutter/view/screen/profile_screen/profile_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/apis/pin.dart';
import '../../../utils/const/theme.dart';
import '../../../view_model/app_manajer.dart';
import '../../../view_model/user_provider/user_provider.dart';
import '../../../view_model/wifi_provider/wifi_provider.dart';
import '../billing_history_screen/billing_history_screen.dart';
import '../bpjs_screen/payment_detail_bpjs_screen.dart';
import '../pendidikan_screen/pendidikan_screen.dart';
import '../pin_screen/input_pin_screen.dart';
import '../promo_screen/all_promo_screen.dart';
import '../pulsa&paket_data_screen/pulsa&paketData_screen.dart';
import '../tagihan_listrik_screen/detail_pembayaran_tagihan_screen.dart';
import '../token_screen/product_detail_screen.dart';
import '../top_up_screen/top_up_screen.dart';
import '../transfer_screen/transfer_screen.dart';
import '../wifi_screen/payment_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  // set isPinCreated(bool isPinCreated) {}

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

String? selectedMonth;
List<String> months = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember'
];

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool isPinCreated = false;
  bool isPinAdded = false;
  late SharedPreferences _prefs;
  String name = '';
  String phone = '';
  String token = '';
  String balance = '0';

  void initial() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      name = _prefs.getString('name').toString();
      phone = _prefs.getString('phone').toString();
      token = _prefs.getString('token').toString();
      balance = _prefs.getInt('balance').toString();
      _prefs.getString('token').toString();
      // ignore: avoid_print
      print('nama : $name');
      // ignore: avoid_print
      print('phone : $phone');
      // ignore: avoid_print
      print('token : $token');
      // ignore: avoid_print
      print('balance : $balance');
    });
  }

  TabController? _tabController;
  TextEditingController pelangganControllerToken = TextEditingController();
  TextEditingController pelangganControllerTagihanListrik =
      TextEditingController();
  TextEditingController pelangganControllerBpjs = TextEditingController();
  TextEditingController pelangganControllerWifi = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    pelangganControllerBpjs.dispose();
    _tabController?.dispose();
    pelangganControllerToken.dispose();
    pelangganControllerTagihanListrik.dispose();
    pelangganControllerWifi.dispose();
  }

  @override
  void initState() {
    super.initState();
    bool ispinAdded = context.read<AppManajer>().ispinAdded;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initializeData(); // Panggil fungsi untuk inisialisasi data
      bool pinStatus = await checkPinStatus(token);
      setState(() {
        isPinCreated = pinStatus;
      });

      if (!isPinCreated) {
        Future.delayed(const Duration(seconds: 1), () {
          _showModalBottomSheetCreatePin();
        });
      }
      // ignore: avoid_print
      print('isPinCreated: $isPinCreated\nispinAdded: $ispinAdded');
      if (isPinCreated && ispinAdded) {
        // ignore: avoid_print
        print('_showModalBottomSheetPinAdded');
        _showModalBottomSheetPinAdded();
      }
    });
    _tabController = TabController(length: 2, vsync: this);
  }

  Future<void> initializeData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      name = _prefs.getString('name') ?? '';
      phone = _prefs.getString('phone') ?? '';
      token = _prefs.getString('token') ?? '';
      balance = _prefs.getInt('balance').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    //ambil data
    final username = userProvider.name;
    final phoneNumber = userProvider.phone;
    final myBalance = userProvider.balance;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      child: Image.asset(
                        'assets/motif_berwarna.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/profile_home.png'),
                          ),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: const Color(0xFF1D2660),
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              username.toUpperCase(),
                              // 'Oktavian Hisdianton',
                              style: whiteFont18.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              phoneNumber,
                              style: whiteFont18.copyWith(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(
                      //     left: MediaQuery.of(context).size.width * 0.18,
                      //     // left: 40,
                      //   ),
                      //   child: const SizedBox(
                      //     // width: 18,
                      //     height: 48,
                      //     child: Icon(
                      //       Icons.notifications_outlined,
                      //       color: Colors.white,
                      //       size: 28,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 70,
                    left: MediaQuery.of(context).size.width * 0.85,
                  ),
                  child: Row(
                    children: const [
                      SizedBox(
                        child: Icon(
                          Icons.notifications_outlined,
                          color: Colors.white,
                          size: 28,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 130),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: AspectRatio(
                      aspectRatio: 17 / 11,
                      child: Image.asset(
                        'assets/motif_polos.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.22,
                    left: MediaQuery.of(context).size.width * 0.06,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width * 0.11,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Text(
                          "skuypay",
                          style: whiteFont16.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.03),
                        child: Container(
                          height: 2,
                          width: MediaQuery.of(context).size.height * 0.25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 260,
                    left: 44,
                  ),
                  child: Text(
                    'Saldo',
                    style: whiteFont16.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 280, left: 44),
                  child: Text(
                    'Rp. ${NumberFormat('#,###', 'id_ID').format(myBalance)}',
                    style: whiteFont25.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TransferScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 262,
                      left: MediaQuery.of(context).size.width * 0.6,
                      // left: 224,
                    ),
                    child: const SizedBox(
                      width: 48,
                      height: 48,
                      child: Icon(
                        Icons.send_to_mobile_outlined,
                        color: Color(0xFFFCDB80),
                        size: 26,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 305,
                    left: MediaQuery.of(context).size.width * 0.61,
                  ),
                  child: Text(
                    'Transfer',
                    style: whiteFont12M.copyWith(
                      // fontSize: 10,
                      color: const Color(0xFFFCDB80),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TopUpScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 262,
                      left: MediaQuery.of(context).size.width * 0.75,
                      // left: 280,
                    ),
                    child: const SizedBox(
                      width: 48,
                      height: 48,
                      child: Icon(
                        Icons.add_card_outlined,
                        color: Color(0xFFFCDB80),
                        size: 26,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 305,
                    left: MediaQuery.of(context).size.width * 0.77,
                    // left: 284,
                  ),
                  child: Text(
                    'Top Up',
                    style: whiteFont12M.copyWith(
                      color: const Color(0xFFFCDB80),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.45,
                    // top: 345,
                  ),
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
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22),
                      ),
                    ),
                  ),
                ),

                /// menu ///
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.48,
                    left: MediaQuery.of(context).size.width * 0.07,
                    right: MediaQuery.of(context).size.width * 0.07,
                    // top: 360,
                    // left: 28,
                    // right: 28,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 26),
                        child: InkWell(
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
                                    splashColor: Colors.green.withOpacity(0.5),
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
                        padding: const EdgeInsets.only(right: 26),
                        child: InkWell(
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
                                    splashColor: Colors.green.withOpacity(0.5),
                                    highlightColor:
                                        Colors.blue.withOpacity(0.4),
                                    onTap: () {
                                      _showModalBottomSheetBpjs(context);
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
                                  splashColor: Colors.green.withOpacity(0.5),
                                  highlightColor: Colors.blue.withOpacity(0.4),
                                  onTap: () {
                                    _showModalBottomSheetToken(context);
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

                /// menu ///
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.61,
                    left: MediaQuery.of(context).size.width * 0.07,
                    right: MediaQuery.of(context).size.width * 0.07,
                    // top: 460,
                    // left: 24,
                    // right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 26),
                        child: InkWell(
                          onTap: () {},
                          child: Stack(
                            children: [
                              Container(
                                width: 85,
                                height: 85,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEDF8FB),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.wifi,
                                      color: Color(0xFF21660E),
                                      size: 30,
                                    ),
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
                                    splashColor: Colors.green.withOpacity(0.5),
                                    highlightColor:
                                        Colors.blue.withOpacity(0.4),
                                    onTap: () {
                                      _showModalBottomSheetWifi();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 26),
                        child: InkWell(
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
                                    splashColor: Colors.green.withOpacity(0.5),
                                    highlightColor:
                                        Colors.blue.withOpacity(0.4),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PdamScreen(),
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
                                  splashColor: Colors.green.withOpacity(0.5),
                                  highlightColor: Colors.blue.withOpacity(0.4),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PendidikanScreen(),
                                      ),
                                    );
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

                /// promo ///
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.74,
                    // top: 555,
                    left: 20,
                  ),
                  child: Text(
                    'Promo',
                    style: whiteFont16M.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.74,
                    left: MediaQuery.of(context).size.width * 0.7,
                    // top: 555,
                    // left: 280,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AllPromoScreen(),
                        ),
                      );
                    },
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
            CarouselSlider.builder(
              options: CarouselOptions(
                enlargeCenterPage: false,
                enableInfiniteScroll: true,
                height: 160,
                aspectRatio: 16 / 9,
                scrollDirection: Axis.horizontal,
                viewportFraction: 0.92,
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllPromoScreen(),
                      ),
                    );
                  },
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
            height: 300,
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
        final wifiProvider =
            Provider.of<WiFiInquiryProvider>(context, listen: false);

        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250,
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
                      child:
                          SizedBox(height: MediaQuery.of(context).size.height)),
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
                        onPressed: () async {
                          await wifiProvider.handleInquiry(
                            pelangganControllerWifi.text,
                            token,
                            context,
                            pelangganControllerWifi,
                          );
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
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Buat Kode PIN Kamu Dulu Yuk!',
                    style: blackText16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Dengan membuat kode PIN Anda dapat meningkatkan keamanan akun.',
                    style: blackFont14,
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
                                builder: (context) => const InputPinScreen()));
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

  void _showModalBottomSheetPinAdded() {
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
          height: 250,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 60,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Oke! Kode PIN kamu sudah tersimpan',
                    style: blackText16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Lebih mudah dan aman menggunakan Kode PIN',
                    style: blackFont14,
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
                        context.read<AppManajer>().changePin(false);
                        setState(() {
                          isPinAdded = true;
                        });
                        Navigator.pop(context);
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

  Widget _buildTokenTab() {
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
              style: blackFont14.copyWith(fontWeight: FontWeight.w700),
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
                  hintStyle: blackFont12.copyWith(color: Colors.grey),
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
              style: blackFont14.copyWith(fontWeight: FontWeight.w700),
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
                controller: pelangganControllerTagihanListrik,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: blackFont12.copyWith(color: Colors.grey),
                  hintText: 'Masukkan No Pelanggan',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  final int initialIndex;
  const NavBar({super.key, required this.initialIndex});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pages = [
      const HomeScreen(),
      const BillingHistory(),
      const ProfileScreen(),
    ];
  }

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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

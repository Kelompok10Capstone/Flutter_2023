import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/view/screen/profile_screen/change_profile_screen.dart';
import 'package:capstone_flutter/view/screen/profile_screen/help_screen.dart';
import 'package:capstone_flutter/view/screen/profile_screen/security_policy_screen.dart';
import 'package:capstone_flutter/view/screen/profile_screen/security_setting_screen.dart';
import 'package:capstone_flutter/view/screen/profile_screen/terms_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_screen/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late SharedPreferences _prefs;
  String name = '';
  String phone = '';
  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      name = _prefs.getString('name').toString();
      phone = _prefs.getString('phone').toString();
      _prefs.getString('token').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Profil',
          style: blackFont18.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 60,
              child: Image.asset('assets/profile.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              name,
              style: blackFont16.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              phone,
              style: blackFont16.copyWith(
                  fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: blueColor),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangeProfileScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Ubah Profile',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: blueColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 210,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SecuritySettingScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 15, bottom: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pengaturan Keamanan',
                              style: blackFont16.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TermsCondition()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 15, bottom: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Syarat dan Ketentuan',
                              style: blackFont16.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SecurityPolicyScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 15, bottom: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Kebijakan Keamanan',
                              style: blackFont16.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HelpScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 15, bottom: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Bantuan',
                              style: blackFont16.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 10, 24, 30),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blueColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            content: SizedBox(
                              height: MediaQuery.of(context).size.height / 30,
                              child: Center(
                                child: Text(
                                  'Ingin keluar dari Skuypay?',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: const BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      fixedSize: MaterialStateProperty.all(
                                        const Size(115, 40),
                                      ),
                                    ),
                                    child: Text(
                                      'Batal',
                                      style: blackFont14,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      //* back to login page
                                      // ignore: unnecessary_nullable_for_final_variable_declarations
                                      final SharedPreferences? prefs =
                                          // ignore: await_only_futures
                                          await _prefs;
                                      prefs?.clear();
                                      // ignore: use_build_context_synchronously
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen()),
                                          (route) => false);
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        const Color(0xffD13217),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: const BorderSide(
                                            color: Color(0xffD13217),
                                          ),
                                        ),
                                      ),
                                      fixedSize: MaterialStateProperty.all(
                                        const Size(115, 40),
                                      ),
                                    ),
                                    child: Text(
                                      'Keluar',
                                      style: whiteFont14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        'Keluar',
                        style: whiteFont14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

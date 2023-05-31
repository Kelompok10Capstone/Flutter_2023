import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  // text editing controller
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController catatanController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    catatanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Transfer',
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
            const SizedBox(height: 15),
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
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                      hintText: "+62",
                      hintStyle: blackFont14.copyWith(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
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
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color(0xff2B3990),
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
              style: blackText12,
            ),
            const SizedBox(height: 28),
            Text(
              'Jumlah Kirim',
              style: blackFont16,
            ),
            const SizedBox(height: 12),
            Text(
              '|Rp0',
              style: blackText24.copyWith(
                color: Color(0xff8E8B8B),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              autofocus: false,
              controller: catatanController,
              obscureText: true,
              // validator: (value) {
              //   if (confirmPasswordEditingController.text !=
              //       passwordEditingController.text) {
              //     return "Password don't match";
              //   }
              //   return null;
              // },
              // onSaved: (value) {
              //   confirmPasswordEditingController.text = value!;
              // },
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(13, 15, 20, 15),
                hintText: 'Tulis Catatan : Jajan',
                hintStyle: blackFont14.copyWith(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xffFFFFFF),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xff2B3990),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: 30, left: 24, right: 24, top: 10),
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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const BerhasilRegisterScreen(),
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
}

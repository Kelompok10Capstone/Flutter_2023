import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/const/theme.dart';

class ChangeProfileScreen extends StatefulWidget {
  const ChangeProfileScreen({super.key});

  @override
  State<ChangeProfileScreen> createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController handphoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    handphoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: blackFont18.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                width: 80,
                child: Image.asset('assets/profile.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Nama*',
              style: blackFont16.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: blackFont16,
                    hintText: 'Ijat Sutrisno'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Email*',
              style: blackFont16.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                  color: Colors.grey[200]),
              child: TextField(
                controller: emailController,
                enabled: false,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: blackFont16,
                    hintText: 'dekremmah@gmail.com'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Nomor Hp*',
              style: blackFont16.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: TextField(
                controller: handphoneController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: blackFont16,
                  hintText: '082267548923',
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(blueColor),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Simpan',
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

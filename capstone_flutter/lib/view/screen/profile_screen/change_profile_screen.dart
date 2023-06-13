import 'package:capstone_flutter/view/screen/home_screen/home_screen.dart';
import 'package:capstone_flutter/view/screen/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/apis/update_user_data.dart';
import '../../../utils/const/theme.dart';

class ChangeProfileScreen extends StatefulWidget {
  const ChangeProfileScreen({super.key});

  @override
  State<ChangeProfileScreen> createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  late SharedPreferences _prefs;
  late UpdateUserController userController;

  String email = '';
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
      email = _prefs.getString('email').toString();
      userController =
          UpdateUserController(_prefs.getString('token').toString());

      nameController.text = name;
      emailController.text = email;
      handphoneController.text = phone;
    });
  }

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

  void saveProfile() async {
    String newName = nameController.text;
    String newEmail = emailController.text;
    String newPhone = handphoneController.text;

    bool success =
        await userController.updateUserById(newName, newEmail, newPhone);

    if (success) {
      setState(() {
        // Simpan data baru ke SharedPreferences
        _prefs.setString('name', newName);
        _prefs.setString('phone', newPhone);
        _prefs.setString('email', newEmail);
      });

      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavBar(
            initialIndex: 2,
          ),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Perubahan Berhasil'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Perubahan Gagal'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
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
      body: SingleChildScrollView(
        child: Padding(
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
                      hintText: name),
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
                  // color: Colors.grey[200],
                ),
                child: TextField(
                  controller: emailController,
                  // enabled: false,

                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: blackFont16,
                      hintText: email),
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
                    hintText: phone,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
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
            onPressed: saveProfile,
            child: Text(
              'Simpan',
              style: whiteFont14,
            ),
          ),
        ),
      ),
    );
  }
}

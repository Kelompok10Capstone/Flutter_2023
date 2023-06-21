import 'package:capstone_flutter/view/screen/top_up_screen/replenish_funds_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/apis/top_up/top_up_api.dart';
import '../../../models/top_up_model.dart';
import '../../../utils/const/theme.dart';
import '../../../view_model/top_up/top_up_view_model.dart';

class TopUpScreen extends StatefulWidget {
  final String token;
  // final String? id;

  const TopUpScreen({
    super.key,
    required this.token,
  });

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen>
    with SingleTickerProviderStateMixin {
  String token = '';
  late SharedPreferences _prefs;

  Future<void> initializeData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      token = _prefs.getString('token') ?? '';
      print("token Top Up : $token");
    });
  }

  String topupId = '';

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  @override
  Widget build(BuildContext context) {
    final topUpProvider = Provider.of<TopUpViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Top Up',
          style: blackFont20.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30),
                child: Text(
                  'Pilih Metode isi Saldo',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  final request = TopUpRequest(
                    bankCode: '002',
                    userId: '',
                    vaNumber: '',
                  );
                  try {
                    final response =
                        await TopUpApi.topUpCreate(request, widget.token);
                    if (response != null) {
                      topUpProvider.setResponse(response);
                      // Provider.of<TopUpViewModel>(context, listen: false)
                      //     .setResponse(response);
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReplenishFunds(
                            id: response.id,
                            createdAt: response.createdAt,
                            updatedAt: response.updatedAt,
                            deletedAt: response.deletedAt,
                            userId: response.userId,
                            vaNumber: response.vaNumber,
                            vaStatus: response.vaStatus,
                            bankCode: response.bankCode,
                            amount: response.amount,
                            expirationTime: response.expirationTime,
                            usernameDisplay: response.usernameDisplay,
                          ),
                        ),
                      );
                    } else {
                      print('error');
                    }
                  } catch (e) {
                    print('error $e');
                  }
                },
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20, left: 30),
                      child: Image(
                        image: AssetImage('assets/bca.png'),
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        'BCA',
                        style: blackFont14.copyWith(color: Colors.black),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, left: 220),
                      child: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 3, left: 30, right: 30),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 30),
                child: Image(
                  image: AssetImage('assets/bni.png'),
                  width: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'BNI',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 225),
                child: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 25,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 3, left: 30, right: 30),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 30),
                child: Image(
                  image: AssetImage('assets/mandiri.png'),
                  width: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'Mandiri',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 200),
                child: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 25,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 3, left: 30, right: 30),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 30),
                child: Image(
                  image: AssetImage('assets/bri.png'),
                  width: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'BRI',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 225),
                child: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 25,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 3, left: 30, right: 30),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
    // );
  }
}

import 'package:capstone_flutter/view/screen/top_up_screen/replenish_funds_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/top_up_model.dart';
import '../../../utils/const/theme.dart';
import '../../../view_model/top_up/top_up_provider.dart';
import '../../../view_model/top_up/top_up_view_model.dart';

class TopUpScreen extends StatefulWidget {
  final String token;
  final String? id;

  const TopUpScreen({super.key, required this.token, this.id});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class TopUPData {
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? userId;
  final String? vaNumber;
  final String? vaStatus;
  final String? bankCode;
  final String amount;
  // final int expirationTime;
  final String? usernameDisplay;

  TopUPData({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userId,
    this.vaNumber,
    this.vaStatus,
    this.bankCode,
    required this.amount,
    // required this.expirationTime,
    this.usernameDisplay,
  });
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

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  @override
  Widget build(BuildContext context) {
    final topUpProvider = Provider.of<TopUPDataViewModel>(context);

    return ChangeNotifierProvider<TopUpViewModel>(
      create: (_) => TopUpViewModel(),
      child: Scaffold(
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
        body: Consumer<TopUPDataViewModel>(
          builder: (context, pulsaPaketDataProvider, _) {
            return Column(
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
                      onTap: () {
                        List<TopUpdataData> users = topUpProvider.users;
                        int index = 0;

                        String idTopUpText =
                            users.isNotEmpty ? users[index].id : '';
                        String userIdTopUpText =
                            users.isNotEmpty ? users[index].userId : '';
                        String vaNumberTopUpText =
                            users.isNotEmpty ? users[index].vaNumber : '';
                        String vaStatusTopUpText = users.isNotEmpty
                            ? users[index].vaStatus.toString()
                            : '';
                        String bankCodeTopUpText =
                            users.isNotEmpty ? users[index].bankCode : '';
                        String amountTopUpText = users.isNotEmpty
                            ? users[index].amount.toString()
                            : '';
                        String expirationTimeTopUpText = users.isNotEmpty
                            ? users[index].expirationTime.toString()
                            : '';
                        String usernameDisplayTopUpText = users.isNotEmpty
                            ? users[index].usernameDisplay
                            : '';

                        TopUPData topupData = TopUPData(
                          id: idTopUpText,
                          createdAt: DateTime.now(),
                          updatedAt: DateTime.now(),
                          deletedAt: null,
                          userId: userIdTopUpText,
                          vaNumber: vaNumberTopUpText,
                          vaStatus: vaStatusTopUpText,
                          bankCode: bankCodeTopUpText,
                          amount: amountTopUpText,
                          // expirationTime: int.parse(expirationTimeTopUpText),
                          usernameDisplay: usernameDisplayTopUpText,
                        );

                        Provider.of<TopUpViewModel>(context, listen: false)
                            .setResponse(topupData);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReplenishFunds(
                              token: widget.token,
                              id: idTopUpText,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                              deletedAt: null,
                              userId: userIdTopUpText,
                              vaNumber: vaNumberTopUpText,
                              vaStatus: vaStatusTopUpText,
                              bankCode: bankCodeTopUpText,
                              amount: amountTopUpText,
                              // expirationTime: int.parse(expirationTimeTopUpText),
                              usernameDisplay: usernameDisplayTopUpText,
                            ),
                          ),
                        );
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
            );
          },
        ),
      ),
    );
  }
}

import 'package:capstone_flutter/view/screen/top_up_screen/replenish_funds_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({super.key});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  @override
  Widget build(BuildContext context) {
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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ReplenishFunds(bankCode: "014"),
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
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: MediaQuery.of(context).size.width * 0.55,
                        // left: 190,
                      ),
                      child: const Icon(
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
  }
}

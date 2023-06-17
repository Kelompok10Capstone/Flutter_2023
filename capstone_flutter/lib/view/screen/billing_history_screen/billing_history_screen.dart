import 'package:capstone_flutter/view/screen/billing_history_screen/transaction_history_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/const/theme.dart';

class BillingHistory extends StatefulWidget {
  const BillingHistory({super.key});

  @override
  State<BillingHistory> createState() => _BillinngHistoryState();
}

class _BillinngHistoryState extends State<BillingHistory> {
  final int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            'Riwayat Transaksi',
            style: blackFont20.copyWith(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    'Proses',
                    style: blackFont16.copyWith(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    'Selesai',
                    style: blackFont16.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(children: [
                ProcessScreen(),
                CompletedScreen(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class ProcessScreen extends StatefulWidget {
  const ProcessScreen({super.key});

  @override
  State<ProcessScreen> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (context) => const SortScreen(),
                  );
                },
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 25, left: 50),
                      child: Image(
                        image: AssetImage('assets/sort_icon.png'),
                        width: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 15),
                      child: Text(
                        'Urutkan',
                        style: blackFont16.copyWith(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) => const FilterScreen(),
                      );
                    },
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 25, left: 105),
                          child: Image(
                            image: AssetImage('assets/filter_icon.png'),
                            width: 28,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 15),
                          child: Text(
                            'Filter',
                            style: blackFont16.copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 70),
            child: Image(
              image: AssetImage('assets/transaction_picture.png'),
              width: 270,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Belum ada transaksi nih',
              style: blackFont20.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (context) => const SortScreen(),
                  );
                },
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 25, left: 50),
                      child: Image(
                        image: AssetImage('assets/sort_icon.png'),
                        width: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 15),
                      child: Text(
                        'Urutkan',
                        style: blackFont16.copyWith(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) => const FilterScreen(),
                      );
                    },
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 25, left: 105),
                          child: Image(
                            image: AssetImage('assets/filter_icon.png'),
                            width: 28,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 15),
                          child: Text(
                            'Filter',
                            style: blackFont16.copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 24),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TransactionHistory()));
                  },
                  child: Stack(
                    children: [
                      const Image(
                        image: AssetImage('assets/pulsa_icon.png'),
                        width: 55,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 60),
                        child: Text(
                          'Pulsa',
                          style: blackFont16.copyWith(color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 60),
                        child: Text(
                          '2 Mei 2023  - 22:56',
                          style: blackFont14.copyWith(color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 260),
                        child: Text(
                          '- Rp. 16.500',
                          style: blackFont16G.copyWith(color: redColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 24),
                child: Stack(
                  children: [
                    const Image(
                      image: AssetImage('assets/pln_icon.png'),
                      width: 55,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 60),
                      child: Text(
                        'PLN',
                        style: blackFont16.copyWith(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 60),
                      child: Text(
                        '2 Mei 2023  - 18:56',
                        style: blackFont14.copyWith(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 250),
                      child: Text(
                        '- Rp. 100.000',
                        style: blackFont16G.copyWith(color: redColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 24),
                child: Stack(
                  children: [
                    const Image(
                      image: AssetImage('assets/bpjs_icon.png'),
                      width: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 60),
                      child: Text(
                        'BPJS',
                        style: blackFont16.copyWith(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 60),
                      child: Text(
                        '2 Mei 2023  - 16:56',
                        style: blackFont14.copyWith(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 250),
                      child: Text(
                        '- Rp. 150.000',
                        style: blackFont16G.copyWith(color: redColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 24),
                child: Stack(
                  children: [
                    const Image(
                      image: AssetImage('assets/top_up_icon.png'),
                      width: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 60),
                      child: Text(
                        'Pulsa',
                        style: blackFont16.copyWith(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 60),
                      child: Text(
                        '2 Mei 2023  - 10:56',
                        style: blackFont14.copyWith(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 250),
                      child: Text(
                        '+ Rp. 500.000',
                        style: blackFont16G.copyWith(
                            color: const Color(0xFF319915)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SortScreen extends StatefulWidget {
  const SortScreen({super.key});

  @override
  State<SortScreen> createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, bottom: 5),
                  child: Text(
                    'Urutkan',
                    style: blackFont16G.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  'Terbaru',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  'Terlama',
                  style: blackFont14.copyWith(color: Colors.black),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 25, right: 25, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(14),
                        minimumSize: const Size(155, 20),
                        backgroundColor: blueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Reset',
                      style: whiteFont16.copyWith(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(14),
                        minimumSize: const Size(155, 20),
                        backgroundColor: blueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Tampilkan',
                      style: whiteFont16.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FiltercreenState();
}

class _FiltercreenState extends State<FilterScreen> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, bottom: 5),
                  child: Text(
                    'Filter',
                    style: blackFont16G.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  'Semua',
                  style: blackFont14.copyWith(color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  'Pembayaran Tagihan',
                  style: blackFont14.copyWith(color: Colors.black),
                )
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 3,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  'Top Up',
                  style: blackFont14.copyWith(color: Colors.black),
                )
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 4,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  'Transfer',
                  style: blackFont14.copyWith(color: Colors.black),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 25, right: 25, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(14),
                        minimumSize: const Size(155, 20),
                        backgroundColor: blueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Reset',
                      style: whiteFont16.copyWith(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(14),
                        minimumSize: const Size(155, 20),
                        backgroundColor: blueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Tampilkan',
                      style: whiteFont16.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

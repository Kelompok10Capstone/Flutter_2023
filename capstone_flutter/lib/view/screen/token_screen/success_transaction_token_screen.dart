import 'package:flutter/material.dart';
import '../../../utils/const/theme.dart';
import 'modal_bottom_token_screen.dart';

class SuccessTransactionToken extends StatelessWidget {
  const SuccessTransactionToken({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                width: double.infinity,
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Transaksi Berhasil',
                          style: blackFont18,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '04 Mei 2023 . 20.28',
                            style: blackFont12,
                          ),
                          Text(
                            'SkuyPay 0857xxxx2345',
                            style: blackFont12,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: lightBlueColor,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 52,
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text(
                                      '1259 6254 9268 0172 5936',
                                      style: blackFont16,
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(Icons.copy_rounded)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'No. Meter',
                            style: blackFont14,
                          ),
                          Text(
                            '3297651038328',
                            style: blackFont14,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'No. Pelanggan',
                            style: blackFont14,
                          ),
                          Text(
                            '0006510482742',
                            style: blackFont14,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nominal',
                            style: blackFont14,
                          ),
                          Text(
                            'Rp 22.500',
                            style: blackFont14,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green[100],
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 52,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                    'Total',
                                    style: blackFont16,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                    'Rp 22.500',
                                    style: blackFont16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 24, right: 24),
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
                      builder: (context) => const ModalBottomToken()));
            },
            child: Text(
              'Selesai',
              style: whiteFont14,
            ),
          ),
        ),
      ),
    );
  }
}

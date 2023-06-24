import 'package:capstone_flutter/models/apis/login.dart';
import 'package:flutter/material.dart';

import '../../models/apis/pulsa_paket_data/pay_paket_data.dart';
import '../../models/pay_ppd_models.dart';

enum CekTransaksiPpdViewState {
  none,
  result,
  loading,
  error,
}

class CekTransaksiPpdViewModel with ChangeNotifier {
  CekTransaksiPpdViewState _state = CekTransaksiPpdViewState.none;
  CekTransaksiPpdViewState get state => _state;

  CreateTransaksiData? _cekTransaksiPpd;
  CreateTransaksiData? get cekTransaksiPpd => _cekTransaksiPpd;

  changeState(CekTransaksiPpdViewState s) {
    _state = s;
    notifyListeners();
  }

  Future<void> createTransaksiPpd(String type, String phoneNumber,
      String productId, String discontId) async {
    changeState(CekTransaksiPpdViewState.loading);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        try {
          final token = await LoginController().getToken();
          final result = await PayPaketData(token)
              .postcreateTransaksiPPd(type, phoneNumber, productId, discontId);
          debugPrint("Pulsa Paket Data Response1: ${result.toString()}");

          _cekTransaksiPpd = result;

          if (_cekTransaksiPpd != null) {
            changeState(CekTransaksiPpdViewState.result);
          } else {
            changeState(CekTransaksiPpdViewState.none);
          }
        } catch (e) {
          changeState(CekTransaksiPpdViewState.error);
        }
      },
    );
  }
}





// class CreateTransaksiPpdProvider extends ChangeNotifier {
//   static const baseUrl = 'http://34.101.78.228:2424/api/v1/user/ppd';

//   String? type;
//   String? phoneNumber;
//   String? productId;
//   String? discontId;
//   String? productDetail;
//   bool isLoading = false;

//   CreateTransaksiData? _createTransaksiData;
//   CreateTransaksiData? get createTransaksiData => _createTransaksiData;

//   Future<void> createTransaksiPpd(String? type, String? phoneNumber,
//       String? productId, String? discontId) async {
//     try {
//       isLoading = true;
//       notifyListeners();
//       final token = await LoginController().getToken();

//       final result = await PayPaketData.createTransaksiPpd(
//           token, type!, phoneNumber!, productId!, discontId!);
//       _createTransaksiData = result;
//       print('create transaksi data : $_createTransaksiData');
//       notifyListeners();
//     } catch (error) {
//       print(error);
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }

import 'package:capstone_flutter/models/apis/api_top_up.dart';
import 'package:capstone_flutter/models/models_top_up.dart';
import 'package:flutter/material.dart';

class TopUpProvider extends ChangeNotifier {
  TopUp? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = (await getSinglePostData());
    loading = false;

    notifyListeners();
  }
}
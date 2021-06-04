import 'dart:convert';

import 'package:ganbanking/constants/api.dart';
import 'package:ganbanking/models/bank_model.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BankAPI extends GetxController {
  Rxn<List<BankModel>> bank = Rxn<List<BankModel>>();
  RxInt selectedBank = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await getBank();
  }

  Future<void> getBank() async {
    return await http.get(
      Uri.parse("${API.BASE_URL}/mobile/bank/info"),
      headers: {"Content-type": "application/json"},
    ).then(
      (value) {
        bank.value = bankModelFromJson(utf8.decode(value.bodyBytes));
      },
    );
  }
}

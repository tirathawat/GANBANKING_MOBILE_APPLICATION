import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ganbanking/constants/api.dart';
import 'package:ganbanking/models/account_model.dart';
import 'package:ganbanking/models/transaction_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AccountAPI extends GetxController {
  Rxn<List<AccountModel>> accounts = Rxn<List<AccountModel>>();
  Rxn<TransactionModel> transactions = Rxn<TransactionModel>();
  RxInt selectedAccount = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await getAccountList();
    await getTransaction();
  }

  Future<void> getTransaction() async {
    return await http
        .post(
      Uri.parse("${API.BASE_URL}/mobile/account/transaction"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
        {
          "account_no":
              accounts.value[selectedAccount.value].accountNo.toString()
        },
      ),
    )
        .then(
      (value) {
        transactions.value =
            transactionModelFromJson(utf8.decode(value.bodyBytes));
      },
    );
  }

  Future<void> getAccountList() async {
    return await http
        .post(
      Uri.parse("${API.BASE_URL}/mobile/account/infobycustomer"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
        {
          "customer_phone_number": FirebaseAuth.instance.currentUser.phoneNumber
              .replaceAll("+66", "0"),
          "token": FirebaseAuth.instance.currentUser.uid
        },
      ),
    )
        .then(
      (value) {
        print("value in getAccountList");
        print(value.body);
        accounts.value = accountModelFromJson(utf8.decode(value.bodyBytes));
      },
    );
  }
}

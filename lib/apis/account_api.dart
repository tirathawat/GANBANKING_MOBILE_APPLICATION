import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ganbanking/constants/api.dart';
import 'package:ganbanking/controllers/app_controller.dart';
import 'package:ganbanking/models/account_info_model.dart';
import 'package:ganbanking/models/account_model.dart';
import 'package:ganbanking/models/transaction_model.dart';
import 'package:ganbanking/pages/fill_password_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'customer_api.dart';

class AccountAPI extends GetxController {
  AppController appController = Get.find<AppController>();
  @override
  void onInit() async {
    super.onInit();
    print(FirebaseAuth.instance.currentUser.uid);
    await CustomerAPI.hasCustomerSession().then((value) async {
      print(value);
      if (!value) {
        Get.to(FillPasswordPage()).then((value) async {
          await getAccountList();
          await getTransaction();
        });
      } else {
        await getAccountList();
        await getTransaction();
      }
    });
  }

  Future<String> transfer(
      int accoutNoTo, double amount, int bankID, String memo) async {
    return await http
        .post(
      Uri.parse("${API.BASE_URL}/mobile/account/transfer"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
        {
          "accountNoFrom": appController
              .accounts.value[appController.selectedAccount.value].accountNo,
          "accountNoTo": accoutNoTo,
          "amount": amount,
          "phone": FirebaseAuth.instance.currentUser.phoneNumber
              .replaceAll("+66", "0"),
          "token": FirebaseAuth.instance.currentUser.uid,
          "bank_id_to": bankID,
          "memo": memo,
        },
      ),
    )
        .then(
      (value) {
        if (value.statusCode == 200)
          return value.body;
        else {
          print(value.body);
          return null;
        }
      },
    );
  }

  Future<bool> getAccountByID(String accountNo, int bankID) async {
    return await http
        .post(
      Uri.parse("${API.BASE_URL}/mobile/account/info"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
        {
          "account_no": accountNo,
          "bank_id": bankID,
        },
      ),
    )
        .then(
      (value) {
        appController.accountInfo.value =
            accountInfoModelFromJson(utf8.decode(value.bodyBytes));
        return value.statusCode == 200;
      },
    );
  }

  Future<void> getTransaction() async {
    return await http
        .post(
      Uri.parse("${API.BASE_URL}/mobile/account/transaction"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
        {
          "account_no": appController
              .accounts.value[appController.selectedAccount.value].accountNo
              .toString()
        },
      ),
    )
        .then(
      (value) {
        appController.transactions.value =
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
        appController.accounts.value =
            accountModelFromJson(utf8.decode(value.bodyBytes));
      },
    );
  }
}

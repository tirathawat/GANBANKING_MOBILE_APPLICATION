import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ganbanking/config/util.dart';
import 'package:ganbanking/constants/api.dart';
import 'package:ganbanking/controllers/app_controller.dart';
import 'package:ganbanking/controllers/transfer_controller.dart';
import 'package:ganbanking/models/account_info_model.dart';
import 'package:ganbanking/models/account_model.dart';
import 'package:ganbanking/models/last_transfer_model.dart';
import 'package:ganbanking/models/transaction_model.dart';
import 'package:ganbanking/pages/fill_password_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AccountAPI extends GetxController {
  AppController appController = Get.find<AppController>();
  final TransferController transferController = Get.put(TransferController());
  @override
  void onInit() async {
    print("start get account list");
    getAccountList().then((value) {
      print("get account list complete");

      if (value) {
        var accountNo = appController
            .accounts.value[appController.selectedAccount.value].accountNo
            .toString();
        getTransaction();
        getQrcode(accountNo);
        getLastedTransfer(accountNo);
      } else {
        Get.to(FillPasswordPage()).then((value) async {
          getAccountList().then((value) {
            var accountNo = appController
                .accounts.value[appController.selectedAccount.value].accountNo
                .toString();
            getTransaction();
            getQrcode(accountNo);
            getLastedTransfer(accountNo);
          });
        });
      }
    });
    super.onInit();
  }

  Future<bool> getInfoByQrcode(String qrcode) async {
    print("qrcode : $qrcode");
    return await http
        .post(
      Uri.parse("${API.BASE_URL}/mobile/account/infobyqrcode"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
        {
          "phone": FirebaseAuth.instance.currentUser.phoneNumber
              .replaceAll("+66", "0"),
          "token": FirebaseAuth.instance.currentUser.uid,
          "qrcode": qrcode,
        },
      ),
    )
        .then(
      (value) {
        if (value.statusCode == 200) {
          print(value.body);
          var data = accountInfoModelFromJson(value.body);
          transferController.accountNoTo.text =
              Util.formatAccountNo(data.accountNo.toString());

          appController.selectedBank.value = appController.bank.value.indexOf(
              appController.bank.value
                  .firstWhere((element) => element.bankId == data.bankId));
          return true;
        }

        return false;
      },
    );
  }

  Future<bool> getLastedTransfer(String accountNo) async {
    return await http
        .post(
      Uri.parse("${API.BASE_URL}/mobile/account/lasttransfer"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
        {
          "phone": FirebaseAuth.instance.currentUser.phoneNumber
              .replaceAll("+66", "0"),
          "token": FirebaseAuth.instance.currentUser.uid,
          "account_no": accountNo,
        },
      ),
    )
        .then(
      (value) {
        appController.lastedTransactions.value =
            lastTransferModelFromJson(utf8.decode(value.bodyBytes));
        return value.statusCode == 200;
      },
    );
  }

  Future<bool> getQrcode(String accoutNo) async {
    return await http
        .post(
      Uri.parse("${API.BASE_URL}/mobile/customer/qrcode"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
        {
          "phone": FirebaseAuth.instance.currentUser.phoneNumber
              .replaceAll("+66", "0"),
          "token": FirebaseAuth.instance.currentUser.uid,
          "account_no": accoutNo,
        },
      ),
    )
        .then(
      (value) {
        appController.qrcode.value = value.body;
        return value.statusCode == 200;
      },
    );
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

  Future<bool> getAccountList() async {
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
        if (value.statusCode == 200) {
          appController.accounts.value =
              accountModelFromJson(utf8.decode(value.bodyBytes));
          return true;
        } else {
          return false;
        }
      },
    );
  }
}

// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

import 'dart:convert';

List<AccountModel> accountModelFromJson(String str) => List<AccountModel>.from(
    json.decode(str).map((x) => AccountModel.fromJson(x)));

String accountModelToJson(List<AccountModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AccountModel {
  AccountModel({
    this.accountBalance,
    this.accountName,
    this.accountNo,
    this.accountTypeName,
  });

  double accountBalance;
  String accountName;
  int accountNo;
  String accountTypeName;

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        accountBalance: double.parse(json["account_balance"].toString()),
        accountName: json["account_name"],
        accountNo: json["account_no"],
        accountTypeName: json["account_type_name"],
      );

  Map<String, dynamic> toJson() => {
        "account_balance": accountBalance,
        "account_name": accountName,
        "account_no": accountNo,
        "account_type_name": accountTypeName,
      };
}

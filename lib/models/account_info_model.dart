// To parse this JSON data, do
//
//     final accountInfoModel = accountInfoModelFromJson(jsonString);

import 'dart:convert';

AccountInfoModel accountInfoModelFromJson(String str) =>
    AccountInfoModel.fromJson(json.decode(str));

String accountInfoModelToJson(AccountInfoModel data) =>
    json.encode(data.toJson());

class AccountInfoModel {
  AccountInfoModel({
    this.accountName,
    this.accountNo,
    this.bankColor,
    this.bankId,
    this.bankLogo,
    this.bankName,
  });

  String accountName;
  int accountNo;
  String bankColor;
  int bankId;
  String bankLogo;
  String bankName;

  factory AccountInfoModel.fromJson(Map<String, dynamic> json) =>
      AccountInfoModel(
        accountName: json["account_name"],
        accountNo: json["account_no"],
        bankColor: json["bank_color"],
        bankId: json["bank_id"],
        bankLogo: json["bank_logo"],
        bankName: json["bank_name"],
      );

  Map<String, dynamic> toJson() => {
        "account_name": accountName,
        "account_no": accountNo,
        "bank_color": bankColor,
        "bank_id": bankId,
        "bank_logo": bankLogo,
        "bank_name": bankName,
      };
}

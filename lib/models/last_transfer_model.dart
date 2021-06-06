// To parse this JSON data, do
//
//     final lastTransferModel = lastTransferModelFromJson(jsonString);

import 'dart:convert';

List<LastTransferModel> lastTransferModelFromJson(String str) =>
    List<LastTransferModel>.from(
        json.decode(str).map((x) => LastTransferModel.fromJson(x)));

String lastTransferModelToJson(List<LastTransferModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LastTransferModel {
  LastTransferModel({
    this.accountName,
    this.accountNo,
    this.bankId,
  });

  String accountName;
  int accountNo;
  int bankId;

  factory LastTransferModel.fromJson(Map<String, dynamic> json) =>
      LastTransferModel(
        accountName: json["account_name"],
        accountNo: json["account_no"],
        bankId: json["bank_id"],
      );

  Map<String, dynamic> toJson() => {
        "account_name": accountName,
        "account_no": accountNo,
        "bank_id": bankId,
      };
}

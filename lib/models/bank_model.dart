// To parse this JSON data, do
//
//     final bankModel = bankModelFromJson(jsonString);

import 'dart:convert';

List<BankModel> bankModelFromJson(String str) =>
    List<BankModel>.from(json.decode(str).map((x) => BankModel.fromJson(x)));

String bankModelToJson(List<BankModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BankModel {
  BankModel({
    this.bankColor,
    this.bankId,
    this.bankLogo,
    this.bankName,
  });

  String bankColor;
  int bankId;
  String bankLogo;
  String bankName;

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
        bankColor: json["bank_color"],
        bankId: json["bank_id"],
        bankLogo: json["bank_logo"],
        bankName: json["bank_name"],
      );

  Map<String, dynamic> toJson() => {
        "bank_color": bankColor,
        "bank_id": bankId,
        "bank_logo": bankLogo,
        "bank_name": bankName,
      };
}

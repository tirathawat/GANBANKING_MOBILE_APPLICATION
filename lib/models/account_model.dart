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
    this.incomeAll,
    this.incomeCurrentMonth,
    this.outcomeAll,
    this.outcomeCurrentMonth,
  });

  double accountBalance;
  String accountName;
  int accountNo;
  String accountTypeName;
  double incomeAll;
  double incomeCurrentMonth;
  double outcomeAll;
  double outcomeCurrentMonth;

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        accountBalance: double.parse(json["account_balance"].toString()),
        accountName: json["account_name"],
        accountNo: json["account_no"],
        accountTypeName: json["account_type_name"],
        incomeAll: double.parse(json["income_all"].toString()),
        incomeCurrentMonth:
            double.parse(json["income_current_month"].toString()),
        outcomeAll: double.parse(json["outcome_all"].toString()),
        outcomeCurrentMonth:
            double.parse(json["outcome_current_month"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "account_balance": accountBalance,
        "account_name": accountName,
        "account_no": accountNo,
        "account_type_name": accountTypeName,
        "income_all": incomeAll,
        "income_current_month": incomeCurrentMonth,
        "outcome_all": outcomeAll,
        "outcome_current_month": outcomeCurrentMonth,
      };
}

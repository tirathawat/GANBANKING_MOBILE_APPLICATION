// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  TransactionModel({
    this.incomeOutcome,
    this.transaction,
  });

  List<IncomeOutcome> incomeOutcome;
  List<Transaction> transaction;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        incomeOutcome: List<IncomeOutcome>.from(
            json["income_outcome"].map((x) => IncomeOutcome.fromJson(x))),
        transaction: List<Transaction>.from(
            json["transaction"].map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "income_outcome":
            List<dynamic>.from(incomeOutcome.map((x) => x.toJson())),
        "transaction": List<dynamic>.from(transaction.map((x) => x.toJson())),
      };
}

class IncomeOutcome {
  IncomeOutcome({
    this.incomeAll,
    this.incomeCurrentMonth,
    this.outcomeAll,
    this.outcomeCurrentMonth,
  });

  double incomeAll;
  double incomeCurrentMonth;
  double outcomeAll;
  double outcomeCurrentMonth;

  factory IncomeOutcome.fromJson(Map<String, dynamic> json) => IncomeOutcome(
        incomeAll: json["income_all"] == null
            ? 0
            : double.parse(json["income_all"].toString()),
        incomeCurrentMonth: json["income_current_month"] == null
            ? 0
            : double.parse(json["income_current_month"].toString()),
        outcomeAll: json["outcome_all"] == null
            ? 0
            : double.parse(json["outcome_all"].toString()),
        outcomeCurrentMonth: json["outcome_current_month"] == null
            ? 0
            : double.parse(json["outcome_current_month"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "income_all": incomeAll,
        "income_current_month": incomeCurrentMonth,
        "outcome_all": outcomeAll,
        "outcome_current_month": outcomeCurrentMonth,
      };
}

class Transaction {
  Transaction({
    this.accountWay,
    this.transactionAmount,
    this.transactionTimestamp,
    this.transactionTypeName,
  });

  String accountWay;
  double transactionAmount;
  DateTime transactionTimestamp;
  String transactionTypeName;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        accountWay: json["account_way"],
        transactionAmount: double.parse(json["transaction_amount"].toString()),
        transactionTimestamp: DateTime.parse(json["transaction_timestamp"]),
        transactionTypeName: json["transaction_type_name"],
      );

  Map<String, dynamic> toJson() => {
        "account_way": accountWay,
        "transaction_amount": transactionAmount,
        "transaction_timestamp": transactionTimestamp.toIso8601String(),
        "transaction_type_name": transactionTypeName,
      };
}

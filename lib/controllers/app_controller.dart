import 'package:ganbanking/models/account_info_model.dart';
import 'package:ganbanking/models/account_model.dart';
import 'package:ganbanking/models/bank_model.dart';
import 'package:ganbanking/models/transaction_model.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  Rxn<List<AccountModel>> accounts = Rxn<List<AccountModel>>();
  Rxn<TransactionModel> transactions = Rxn<TransactionModel>();
  Rxn<AccountInfoModel> accountInfo = Rxn<AccountInfoModel>();
  RxInt selectedAccount = 0.obs;
  Rxn<List<BankModel>> bank = Rxn<List<BankModel>>();
  RxInt selectedBank = 0.obs;
}

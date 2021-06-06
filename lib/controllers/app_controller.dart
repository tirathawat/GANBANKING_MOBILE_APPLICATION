import 'package:ganbanking/models/account_info_model.dart';
import 'package:ganbanking/models/account_model.dart';
import 'package:ganbanking/models/bank_model.dart';
import 'package:ganbanking/models/last_transfer_model.dart';
import 'package:ganbanking/models/promotion_model.dart';
import 'package:ganbanking/models/transaction_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {
  Rxn<List<AccountModel>> accounts = Rxn<List<AccountModel>>();
  Rxn<TransactionModel> transactions = Rxn<TransactionModel>();
  Rxn<AccountInfoModel> accountInfo = Rxn<AccountInfoModel>();
  Rxn<List<LastTransferModel>> lastedTransactions =
      Rxn<List<LastTransferModel>>();
  RxInt selectedAccount = 0.obs;
  Rxn<List<BankModel>> bank = Rxn<List<BankModel>>();
  RxInt selectedBank = 0.obs;
  SharedPreferences preferences;
  RxString qrcode = ''.obs;
  Rxn<List<PromotionModel>> promotions = Rxn<List<PromotionModel>>();

  void clear() {
    accounts = Rxn<List<AccountModel>>();
    transactions = Rxn<TransactionModel>();
    accountInfo = Rxn<AccountInfoModel>();
    lastedTransactions = Rxn<List<LastTransferModel>>();
    selectedAccount = 0.obs;
    bank = Rxn<List<BankModel>>();
    selectedBank = 0.obs;
    qrcode = ''.obs;
  }

  @override
  void onInit() async {
    preferences = await SharedPreferences.getInstance();

    super.onInit();
  }
}

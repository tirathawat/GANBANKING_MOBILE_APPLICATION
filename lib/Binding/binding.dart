import 'package:ganbanking/apis/account_api.dart';
import 'package:ganbanking/apis/bank_api.dart';
import 'package:ganbanking/controllers/variable_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    print("INITIAL BINGING");
    Get.lazyPut(() => VariableController());
    Get.lazyPut(() => BankAPI(), fenix: true);
    Get.lazyPut(() => AccountAPI(), fenix: true);
  }
}

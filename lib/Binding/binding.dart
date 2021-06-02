import 'package:ganbanking/controllers/variable_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    print("INITIAL BINGING");
    Get.lazyPut(() => VariableController());
  }
}

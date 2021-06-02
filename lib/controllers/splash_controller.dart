import 'package:ganbanking/pages/auth/2_sign_in_page_1.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Get.off(() => SignInPage1());
    super.onInit();
  }
}

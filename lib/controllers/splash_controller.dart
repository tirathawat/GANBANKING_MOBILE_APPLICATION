import 'package:ganbanking/pages/sign_in_page_1.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Get.to(SignInPage1());
    super.onInit();
  }
}

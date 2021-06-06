import 'package:firebase_auth/firebase_auth.dart';
import 'package:ganbanking/apis/account_api.dart';
import 'package:ganbanking/pages/auth/2_sign_in_page_1.dart';
import 'package:ganbanking/pages/home/home_page.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    if (FirebaseAuth.instance.currentUser == null) {
      Get.off(() => SignInPage1());
    } else {
      Get.put(AccountAPI());
      Get.to(() => HomePage());
    }

    super.onInit();
  }
}

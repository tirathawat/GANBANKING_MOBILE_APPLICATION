import 'package:ganbanking/constants/api.dart';
import 'package:ganbanking/controllers/app_controller.dart';
import 'package:ganbanking/models/promotion_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PromotionAPI extends GetxController {
  final AppController appController = Get.find<AppController>();

  @override
  void onInit() async {
    getPromotions();

    super.onInit();
  }

  Future<bool> getPromotions() async {
    return await http.get(
      Uri.parse("${API.BASE_URL}/mobile/promotion/info"),
      headers: {"Content-type": "application/json"},
    ).then((value) {
      appController.promotions.value = promotionModelFromJson(value.body);
      return value.statusCode == 200;
    });
  }
}

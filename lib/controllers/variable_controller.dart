import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VariableController extends GetxController {
  TextEditingController phoneController;

  @override
  void onInit() {
    print("INITIAL VariableController");
    phoneController = TextEditingController();
    super.onInit();
  }
}

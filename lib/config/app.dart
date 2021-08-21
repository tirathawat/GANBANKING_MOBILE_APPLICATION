import 'package:flutter/material.dart';
import 'package:ganbanking/binding/binding.dart';
import 'package:ganbanking/controllers/app_controller.dart';
import 'package:ganbanking/pages/auth/1_splash_page.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(AppController());
    return KeyboardDismisser(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GANBANKING',
        home: SplashPage(),
        initialBinding: AppBinding(),
      ),
    );
  }
}

///// GANBANK
///
///bank

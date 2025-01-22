import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_digisol_flutter/controllers/splash_screen_contoller.dart';
import 'package:test_digisol_flutter/core/constant/color.dart';

class CustombuttonSplashScreen extends GetView<SplashScreenControllerImp> {
  const CustombuttonSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      height: 40,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        textColor: Colors.white,
        onPressed: () {
          controller.next();
        },
        color: AppColor.primaryColor,
        child: Text("Continue".tr),
      ),
    );
  }
}

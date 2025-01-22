import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_digisol_flutter/core/constant/routes.dart';
import 'package:test_digisol_flutter/core/services/services.dart';
import 'package:test_digisol_flutter/data/data_source/static/static.dart';

abstract class SplashScreenController extends GetxController {
  next();
  onPageChanged(int index);
}

class SplashScreenControllerImp extends SplashScreenController {
  late PageController pagecontroller;
  int currentpage = 0;
  MyServices myServices = Get.find();
  @override
  next() {
    currentpage++;
    if (currentpage > splashscreenList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
    } else {
      pagecontroller.animateToPage(currentpage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pagecontroller = PageController();
    super.onInit();
  }
}

import 'package:get/get.dart';
import 'package:test_digisol_flutter/controllers/splash_screen_contoller.dart';
import 'package:test_digisol_flutter/core/constant/color.dart';
import 'package:test_digisol_flutter/data/data_source/static/static.dart';
import 'package:flutter/material.dart';

class CustomDotSplashScreen extends StatelessWidget {
  const CustomDotSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    splashscreenList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentpage == index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}

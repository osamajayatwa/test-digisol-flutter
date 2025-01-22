import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_digisol_flutter/controllers/splash_screen_contoller.dart';
import 'package:test_digisol_flutter/core/constant/color.dart';
import 'package:test_digisol_flutter/view/widget/SplashSceen/custombutton.dart';
import 'package:test_digisol_flutter/view/widget/SplashSceen/customdot.dart';
import 'package:test_digisol_flutter/view/widget/SplashSceen/customslider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenControllerImp());
    return const Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(flex: 4, child: CustomSliderSplashScreen()),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CustomDotSplashScreen(),
                      Spacer(
                        flex: 2,
                      ),
                      CustombuttonSplashScreen(),
                    ],
                  ))
            ],
          ),
        ));
  }
}

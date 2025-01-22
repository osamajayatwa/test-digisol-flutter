import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_digisol_flutter/controllers/splash_screen_contoller.dart';
import 'package:test_digisol_flutter/data/data_source/static/static.dart';

class CustomSliderSplashScreen extends GetView<SplashScreenControllerImp> {
  const CustomSliderSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final heightSize = MediaQuery.of(context).size.height;
    final widthSize = MediaQuery.of(context).size.width;
    return PageView.builder(
        controller: controller.pagecontroller,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: splashscreenList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Image.asset(
                  width: widthSize * 1,
                  height: heightSize * 0.5,
                  fit: BoxFit.fill,
                  splashscreenList[i].image!,
                ),
                SizedBox(
                  height: heightSize * 0.06,
                ),
                Text(
                  splashscreenList[i].title!,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: heightSize * 0.01,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    splashscreenList[i].body!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ));
  }
}

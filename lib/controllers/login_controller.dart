import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_digisol_flutter/core/class/statusrequest.dart';
import 'package:test_digisol_flutter/core/constant/color.dart';
import 'package:test_digisol_flutter/core/constant/routes.dart';
import 'package:test_digisol_flutter/core/services/services.dart';

abstract class LoginController extends GetxController {
  login();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  bool isPasswordVisible = true;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  @override
  void login() {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      final username = usernameController.text.trim();
      final password = passwordController.text;

      if (username == 'ana' && password == 'P@ssw0rd') {
        Get.offNamed(AppRoute.homepage);
        myServices.sharedPreferences.setString("step", "2");
        myServices.sharedPreferences.setString("username", username);
      } else {
        Get.snackbar(
          'Login Failed',
          'Invalid username or password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.red,
          colorText: AppColor.backgroundcolor,
        );
      }
    } else {
      Get.snackbar(
        'Form Error',
        'Please fill out the form correctly',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.red,
        colorText: AppColor.backgroundcolor,
      );
    }
    update();
  }

  void goToPageHome() {
    Get.offAllNamed(AppRoute.homepage);
  }

  @override
  void onInit() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

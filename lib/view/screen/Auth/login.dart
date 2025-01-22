import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_digisol_flutter/controllers/login_controller.dart';
import 'package:test_digisol_flutter/core/class/handilingdataview.dart';
import 'package:test_digisol_flutter/core/constant/color.dart';
import 'package:test_digisol_flutter/core/functions/validinput.dart';
import 'package:test_digisol_flutter/view/widget/auth/costumlogintextC.dart';
import 'package:test_digisol_flutter/view/widget/auth/custombuttonauth.dart';
import 'package:test_digisol_flutter/view/widget/auth/customlogintextA.dart';
import 'package:test_digisol_flutter/view/widget/auth/customlogintextB.dart';
import 'package:test_digisol_flutter/view/widget/auth/logoauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            clipBehavior: Clip.none,
            backgroundColor: AppColor.primaryColor,
            title: Text('LogIn'.tr,
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
        body: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandilingDataRequest(
              statusrequest: controller.statusRequest,
              widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        const LogoAuth(),
                        const SizedBox(
                          height: 15,
                        ),
                        CostumTextTitle(
                          text: "Welcome".tr,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextBody(
                            text: "SignIn with Your Username And Password".tr),
                        const SizedBox(
                          height: 40,
                        ),
                        CostumTextForm(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!);
                          },
                          mycontroller: controller.usernameController,
                          labeltext: "Username".tr,
                          hinttext: "Enter Your Username".tr,
                          icondata: Icons.email_outlined,
                          obscure: false,
                        ),
                        const SizedBox(height: 20),
                        GetBuilder<LoginControllerImp>(
                          builder: (controller) => CostumTextForm(
                            obscure: controller.isPasswordVisible,
                            onTapIcon: () {
                              controller.togglePasswordVisibility();
                            },
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!);
                            },
                            mycontroller: controller.passwordController,
                            labeltext: "Password".tr,
                            hinttext: "Enter Your Password".tr,
                            icondata: Icons.lock_outlined,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomBottunAuth(
                          text: "LogIn".tr,
                          onPressed: () {
                            controller.login();
                          },
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ))),
        ));
  }
}

import 'package:get/get.dart';
import 'package:test_digisol_flutter/core/class/statusrequest.dart';
import 'package:test_digisol_flutter/core/constant/routes.dart';
import 'package:test_digisol_flutter/core/services/services.dart';
import 'package:test_digisol_flutter/data/data_source/remote/home_data.dart';

abstract class HomeController extends GetxController {
  initialData();
  Future<void> getdata();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<dynamic> apiData = [];
  HomeData homeData = HomeData(Get.find());
  String? username;
  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
  }

  @override
  void onInit() {
    initialData();
    getdata();
    super.onInit();
  }

  @override
  Future<void> getdata() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await homeData.getData();
    response.fold(
      (l) {
        statusRequest = StatusRequest.serverfailure;
      },
      (r) {
        apiData = r;
        statusRequest = StatusRequest.success;
      },
    );

    update();
  }

  logOut() {
    Get.offAllNamed(AppRoute.login);
    myServices.sharedPreferences.clear();
  }
}

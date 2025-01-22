import 'package:get/get.dart';
import 'package:test_digisol_flutter/core/class/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}

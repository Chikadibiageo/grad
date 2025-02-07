import 'package:get/get.dart';
import 'package:grad/app/controller/others/success-page-controller.dart';

class SuccessPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessPageController>(() => SuccessPageController());
  }
}

import 'package:get/get.dart';
import 'base_page_controller.dart';

class BaseBinding implements Bindings {
  BaseBinding();

  @override
  void dependencies() {
    Get.put(BasePageController());
  }
}

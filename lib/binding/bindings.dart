import 'package:behesht_services/controllers/service_controller.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ServiceController>(() => ServiceController());
  }
}
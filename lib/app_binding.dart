import 'package:get/get.dart';
import 'package:Inke/app_controller.dart';

class AppBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(AppController());
  }

}
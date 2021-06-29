import 'package:get/get.dart';
import 'package:Inke/modules/home/home_controller.dart';

class HomeBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(HomeController());
  }

}
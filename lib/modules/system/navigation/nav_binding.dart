import 'package:get/get.dart';
import 'package:Inke/modules/system/navigation/nav_controller.dart';

class Navbinding extends Bindings{

  @override
  void dependencies() {
     Get.put(NavController());
  }


}
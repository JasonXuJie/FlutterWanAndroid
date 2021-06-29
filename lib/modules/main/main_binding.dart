import 'package:get/get.dart';
import 'package:Inke/modules/main/main_controller.dart';

class MainBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }

}
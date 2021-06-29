import 'package:get/get.dart';
import 'package:Inke/modules/my/my_controller.dart';

class MyBinding extends Bindings{

  @override
  void dependencies() {
      Get.lazyPut(() => MyController());
  }


}
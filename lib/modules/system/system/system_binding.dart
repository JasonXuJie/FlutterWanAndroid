import 'package:get/get.dart';
import 'package:Inke/modules/system/system/system_controller.dart';

class SystemBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(SystemController());
  }

}
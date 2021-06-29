import 'package:get/get.dart';
import 'package:Inke/modules/guide/guide_controller.dart';

class GuideBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => GuideController());
  }

}
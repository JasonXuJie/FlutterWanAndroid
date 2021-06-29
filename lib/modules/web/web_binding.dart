import 'package:get/get.dart';
import 'package:Inke/modules/web/web_controller.dart';

class WebBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => WebController());
  }

}
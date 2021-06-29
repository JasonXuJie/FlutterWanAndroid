import 'package:get/get.dart';
import 'package:Inke/modules/my/usedweb/usedweb_controller.dart';

class UsedWebBinding extends Bindings{

  @override
  void dependencies() {
    print('UsedWebBinding dependencies');
     Get.put(UsedWebController());
  }

}
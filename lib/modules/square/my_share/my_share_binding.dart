import 'package:get/get.dart';
import 'package:Inke/modules/square/my_share/my_share_controller.dart';

class MyShareBinding extends Bindings{

  @override
  void dependencies() {
     Get.put(MyShareController());
  }

}
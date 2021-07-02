import 'package:get/get.dart';
import 'package:Inke/modules/square/share_one/share_one_controller.dart';

class ShareOneBinding extends Bindings{

  @override
  void dependencies() {
     Get.put(ShareOneController());
  }

}
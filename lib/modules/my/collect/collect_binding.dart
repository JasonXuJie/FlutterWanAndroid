import 'package:get/get.dart';
import 'package:Inke/modules/my/collect/collect_controller.dart';

class CollectBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => CollectController());
  }

}
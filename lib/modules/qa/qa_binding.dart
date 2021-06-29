import 'package:get/get.dart';
import 'package:Inke/modules/qa/qa_controller.dart';

class QaBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => QaController());
  }

}
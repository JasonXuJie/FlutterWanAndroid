import 'package:get/get.dart';
import 'package:Inke/modules/my/feedback/feedback_controller.dart';

class FeedbackBinding extends  Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => FeedbackController());
  }

}
import 'package:get/get.dart';
import 'package:Inke/modules/project/project_controller.dart';

class ProjectBinding extends Bindings{

  @override
  void dependencies() {
     Get.lazyPut(() => ProjectController());
  }

}
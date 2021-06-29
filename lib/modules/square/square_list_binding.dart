import 'package:get/get.dart';
import 'package:Inke/modules/square/square_list_controller.dart';

class SquareListBinding extends Bindings{

  @override
  void dependencies() {
     Get.put(SquareListController());
  }

}
import 'package:get/get.dart';
import 'package:Inke/modules/register/register_controller.dart';

class RegisterBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(()=>RegisterController());
  }

}
import 'package:get/get.dart';
import 'package:Inke/modules/login/login_controller.dart';

class LoginBinding extends Bindings{

  @override
  void dependencies() {
     Get.lazyPut(() => LoginController());
  }

}
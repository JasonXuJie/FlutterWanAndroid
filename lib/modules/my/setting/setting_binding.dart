import 'package:get/get.dart';
import 'package:Inke/modules/my/setting/setting_controller.dart';

class SettingBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }

}
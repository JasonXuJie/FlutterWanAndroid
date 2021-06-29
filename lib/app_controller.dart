import 'package:get/get.dart';
import 'package:Inke/util/sp_util.dart';
import 'package:Inke/config/shared_key.dart';

class AppController extends GetxController{

  var user = ''.obs;
  var isLogin = false.obs;
  var isCheckDark = false.obs;

  @override
  void onInit() async{
    super.onInit();
    user.value = await SpUtil.get(SharedKey.userName);
    isLogin.value = await SpUtil.get(SharedKey.isLogin);
    bool isDark = await SpUtil.get(SharedKey.isCheckDark) as bool;
    isCheckDark.value = isDark == null?false:isDark;
  }

}
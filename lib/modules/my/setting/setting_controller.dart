import 'package:Inke/app_controller.dart';
import 'package:get/get.dart';
import 'package:Inke/http/api.dart';
import 'package:Inke/http/http_manager.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/util/toast.dart';
import 'package:Inke/config/shared_key.dart';
import 'package:Inke/util/sp_util.dart';

class SettingController extends GetxController{

  final AppController controller = Get.find();

  void logout()async{
     final data = await HttpManager.getInstance().get(url: Api.logout);
     if(data != null){
        controller.isLogin.value = null;
        controller.user.value = null;
        SpUtil.put(SharedKey.userName,null);
        SpUtil.put(SharedKey.isLogin,null);
        Toast.show('登出成功');
        NavigatorUtil.goBack();
     }
  }
}
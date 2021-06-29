import 'package:Inke/app_controller.dart';
import 'package:get/get.dart';
import 'package:Inke/util/toast.dart';
import 'package:Inke/util/string_util.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/http/http_manager.dart';
import 'package:Inke/http/api.dart';
import 'package:Inke/util/sp_util.dart';
import 'package:Inke/config/shared_key.dart';
import 'package:Inke/bean/login_entity.dart';

class LoginController extends GetxController{

  AppController controller = Get.find();

  void login(String account,String pwd)async{
    if (StringUtil.isEmpty(account) || StringUtil.isEmpty(pwd)) {
      Toast.show('请输入账号或密码');
      return;
    }
    final data  = await HttpManager.getInstance().post(url: Api.login,params:{'username':account,'password':pwd} );
    if(data != null){
      LoginEntity entity =  LoginEntity().fromJson(data);
      SpUtil.put(SharedKey.userName, entity.data.nickname);
      SpUtil.put(SharedKey.isLogin, true);
      controller.user.value = entity.data.nickname;
      controller.isLogin.value = true;
      Toast.show('登陆成功');
      NavigatorUtil.goBack();
    }
  }

}
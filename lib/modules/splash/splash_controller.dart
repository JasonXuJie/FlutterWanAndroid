import 'package:get/get.dart';
import 'package:Inke/util/sp_util.dart';
import 'package:Inke/config/shared_key.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/router/routes.dart';

class SplashController extends GetxController{


  void jump2Guide()async{
      final flag = await SpUtil.get(SharedKey.isFirst);
      if(flag == null){
        NavigatorUtil.pushAndReplace(Routes.guide);
      }else{
        NavigatorUtil.pushAndReplace(Routes.main);
      }
  }


}
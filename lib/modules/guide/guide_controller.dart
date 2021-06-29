import 'package:get/get.dart';
import 'package:Inke/router/routes.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/util/sp_util.dart';
import 'package:Inke/config/shared_key.dart';



class GuideController extends GetxController{


  void jump2Main(){
    SpUtil.put(SharedKey.isFirst, false);
    NavigatorUtil.pushAndReplace(Routes.main);
  }
}
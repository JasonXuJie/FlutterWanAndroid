import 'package:Inke/router/navigator_util.dart';
import 'package:get/get.dart';
import 'package:Inke/http/http_manager.dart';
import 'package:Inke/http/api.dart';
import 'package:Inke/util/toast.dart';

class ShareController extends GetxController{


  void share(String title,String link)async{
     if(title ==  null || link == null){
       Toast.show('请将内容填写完整');
       return;
     }
     final data = await HttpManager.getInstance().post(url: Api.shareAtricles,params:{'title':title,'link':link});
     if(data != null){
        Toast.show('分享成功');
        NavigatorUtil.goBack();
     }
  }

}
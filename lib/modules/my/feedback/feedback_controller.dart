import 'package:get/get.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/util/toast.dart';

class FeedbackController extends GetxController{


  void submit(String content){
    Future.delayed(Duration(seconds: 1),(){
        Toast.show('提交成功');
        NavigatorUtil.goBack();
    });
  }

}
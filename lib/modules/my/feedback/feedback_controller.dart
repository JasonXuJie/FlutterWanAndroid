import 'package:get/get.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/util/toast.dart';

class FeedbackController extends GetxController{


  void submit(String content){
    Future.delayed(Duration(seconds: 1),(){
        Toast.show('ζδΊ€ζε');
        NavigatorUtil.goBack();
    });
  }

}
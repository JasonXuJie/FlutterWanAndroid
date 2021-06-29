import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:Inke/http/http_manager.dart';
import 'package:Inke/http/api.dart';
import 'package:Inke/bean/nav_data_entity.dart';

class NavController extends GetxController{

  var dataList = [].obs;

  @override
  void onInit()async{
    super.onInit();
    final  data = await HttpManager.getInstance().get(url: Api.navData);
    if(data != null){
      NavDataEntity entity = NavDataEntity().fromJson(data);
      dataList.value = entity.data;
    }
  }
}
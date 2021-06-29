import 'package:get/get.dart';
import 'package:Inke/bean/system_data_entity.dart';
import 'package:Inke/http/http_manager.dart';
import 'package:Inke/http/api.dart';

class  SystemController extends GetxController{

  var dataList = [].obs;

  @override
  void onInit() async{
    super.onInit();
    final data = await HttpManager.getInstance().get(url: Api.systemData);
    if(data != null){
      SystemDataEntity entity = SystemDataEntity().fromJson(data);
      dataList.value = entity.data;
    }
  }

}
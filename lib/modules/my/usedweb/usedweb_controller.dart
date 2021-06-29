import 'package:get/get.dart';
import 'package:Inke/http/api.dart';
import 'package:Inke/http/http_manager.dart';
import 'package:Inke/bean/used_web_entity.dart';
import 'package:Inke/bean/classify.dart';

class UsedWebController extends GetxController{

  var dataList = [].obs;

  @override
  void onInit()async{
    super.onInit();
    print('UsedWebController onInit');
    final data = await HttpManager.getInstance().get(url: Api.usedWeb);
    if(data != null){
      UsedWebEntity entity = UsedWebEntity().fromJson(data);
      Map<String,List<UsedWebData>> map = {};
      entity.data.forEach((element) {
        if(!map.containsKey(element.category)){
          map[element.category] = entity.data.where((entity) => entity.category == element.category).toList();
        }
      });
      List<Classify> list = [];
      map.forEach((key, value) {
         list.add(Classify(title: key,data: value));
      });
      dataList.value = list;
    }
  }
}
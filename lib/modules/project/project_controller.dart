import 'package:get/get.dart';
import 'package:Inke/http/api.dart';
import 'package:Inke/http/http_manager.dart';
import 'package:Inke/bean/project_classify_entity.dart';
import 'package:Inke/bean/project_entity.dart';

class ProjectController extends GetxController{

  var tabList = [].obs;
  var map = {}.obs;

  @override
  void onInit()async{
    super.onInit();
    var data = await HttpManager.getInstance().get(url: Api.projectClassify);
    if(data != null){
      ProjectClassifyEntity entity = ProjectClassifyEntity().fromJson(data);
      tabList.value = entity.data;
    }
  }


  void requestContent(String page,String cid)async{
    if(map[cid] != null){
      map[cid] = null;
    }
    var  data = await HttpManager.getInstance().get(url: Api.projectList(page, cid));
    if(data != null){
      ProjectEntity entity = ProjectEntity().fromJson(data);
      map[cid] = entity;
     // print(entity.data.datas.length);

    }
  }

}
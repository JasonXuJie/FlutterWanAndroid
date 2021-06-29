import 'package:get/get.dart';
import 'package:Inke/http/http_manager.dart';
import 'package:Inke/http/api.dart';
import 'package:Inke/bean/sys_article_entity.dart';

class SystemArticleController extends GetxController{

  int curPage = 0;
  int pageCount;
  var dataList = [].obs;


  void request(String cid)async{
      var data = await HttpManager.getInstance().get(url: Api.systemArticle(curPage, cid));
      if(data != null){
         SysArticleEntity entity =  SysArticleEntity().fromJson(data);
         pageCount = entity.data.pageCount;
         if(dataList.length ==  0){
           dataList.value = entity.data.datas;
         }else{
           dataList.addAll(entity.data.datas);
         }
      }
  }
}
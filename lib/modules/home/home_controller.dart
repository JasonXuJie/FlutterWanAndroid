import 'package:get/get.dart';
import 'package:Inke/http/http_manager.dart';
import 'package:Inke/http/api.dart';
import 'package:Inke/bean/banner_entity.dart';
import 'package:Inke/bean/top_list_entity.dart';
import 'package:Inke/bean/home_list_entity.dart';

class HomeController extends GetxController{

  var banners = [].obs;
  var topList = [].obs;
  var homeList = [].obs;

  var curPage = 0;
  var pageCount;
  @override
  void onInit(){
    super.onInit();
    requestBanner();
    requestTopList();
    requestList();
  }



  void requestBanner()async{
     final data = await HttpManager.getInstance().get(url: Api.banner);
     if(data != null){
       BannerEntity entity = BannerEntity().fromJson(data);
       banners.value = entity.data;
     }
  }


  void requestTopList()async{
    final data = await HttpManager.getInstance().get(url: Api.homeTopList);
    if(data != null){
      TopListEntity entity = TopListEntity().fromJson(data);
      topList.value = entity.data;
    }
  }

  void requestList()async{
      final data = await HttpManager.getInstance().get(url: Api.homeList('$curPage'));
      if(data != null){
         HomeListEntity entity  = HomeListEntity().fromJson(data);
         pageCount = entity.data.pageCount;
         if(homeList.length == 0){
           homeList.value = entity.data.datas;
         }else{
           homeList.addAll(entity.data.datas);
         }
      }
  }
}
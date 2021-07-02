import 'package:get/get.dart';
import 'package:Inke/http/http_manager.dart';
import 'package:Inke/http/api.dart';
import 'package:Inke/bean/share_one_entity.dart';

class ShareOneController extends GetxController{

  int page = 1;
  String id;
  var shareArticles = [].obs;
  var coinInfo = ShareOneDataCoinInfo().obs;
  int pageCount;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments['id'];
    requestData();
  }

  void requestData()async{
    final data = await HttpManager.getInstance().get(url: Api.shareArticlesList(id, page));
    if(data != null){
         ShareOneEntity entity = ShareOneEntity().fromJson(data);
         coinInfo.value = entity.data.coinInfo;
         pageCount = entity.data.shareArticles.pageCount;
         if(shareArticles.length == 0){
           shareArticles.value  = entity.data.shareArticles.datas;
         }else{
           shareArticles.addAll(entity.data.shareArticles.datas);
         }
    }
  }

}
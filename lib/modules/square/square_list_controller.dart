import 'package:Inke/http/api.dart';
import 'package:Inke/http/http_manager.dart';
import 'package:get/get.dart';
import 'package:Inke/bean/square_list_entity.dart';

class SquareListController extends GetxController{

  var dataList = [].obs;
  int page = 0;
  int pageCount;

  @override
  void onInit() {
    super.onInit();
    requestList();
  }


  void requestList()async{
    final data = await HttpManager.getInstance().get(url: Api.squareDataList(page));
    if(data != null){
      SquareListEntity entity = SquareListEntity().fromJson(data);
      pageCount = entity.data.pageCount;
      if(dataList.length == 0){
        dataList.value = entity.data.datas;
      }else{
        dataList.addAll(entity.data.datas);
      }
    }
  }


}
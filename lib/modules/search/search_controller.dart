import 'package:Inke/bean/web_content.dart';
import 'package:get/get.dart';
import 'package:Inke/http/http_manager.dart';
import 'package:Inke/http/api.dart';
import 'package:Inke/bean/hotkey_entity.dart';
import 'package:Inke/util/toast.dart';
import 'package:Inke/bean/author_search_entity.dart';


class SearchController extends GetxController{

  var dataList = [].obs;
  int page = 0;
  int pageCount;
  var searchData = [].obs;
  var hasContent = false.obs;
  bool isSearchAuthor;
  @override
  void onInit() {
    super.onInit();
    requestHotKey();
    isSearchAuthor = Get.arguments['isSearchAuthor'];

  }


  void requestHotKey()async{
    final data = await HttpManager.getInstance().get(url: Api.hotKey);
    if(data != null){
       print(data.toString());
       HotkeyEntity entity = HotkeyEntity().fromJson(data);
       dataList.value = entity.data;
    }
  }


  void search(String content)async{
    if(content == null || content.length == 0){
      Toast.show('请填写内容');
      return;
    }
    if(isSearchAuthor){
      final data = await HttpManager.getInstance().get(url:Api.systemAuthorSearch(page, content));
      if(data !=  null){
        AuthorSearchEntity entity = AuthorSearchEntity().fromJson(data);
        if(entity.data.datas.length == 0 || entity.data.pageCount == 0){
             Toast.show('暂无搜索到的内容');
             return;
        }
        pageCount = entity.data.pageCount;
        hasContent.value = true;
        if(searchData.length == 0){
          searchData.value = entity.data.datas;
        }else{
          searchData.addAll(entity.data.datas);
        }
      }
    }else{
      final data = await HttpManager.getInstance().post(url: Api.search(page),params: {'k':content});
      if(data != null){
        AuthorSearchEntity entity = AuthorSearchEntity().fromJson(data);
        if(entity.data.datas.length == 0 || entity.data.pageCount == 0){
          Toast.show('暂无搜索到的内容');
          return;
        }
        hasContent.value = true;
        pageCount = entity.data.pageCount;
        if(searchData.length == 0){
          searchData.value = entity.data.datas;
        }else{
          searchData.addAll(entity.data.datas);
        }
      }
    }
  }

}
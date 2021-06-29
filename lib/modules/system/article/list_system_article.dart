import 'package:Inke/modules/system/article/system_article_controller.dart';
import 'package:flutter/material.dart';
import 'package:Inke/widgets/text.dart';
import 'package:like_button/like_button.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:Inke/bean/web_content.dart';
import 'package:Inke/router/routes.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/widgets/gaps.dart';
import 'package:get/get.dart';
import 'package:Inke/http/http_manager.dart';
import 'package:Inke/http/api.dart';
import 'package:Inke/bean/sys_article_entity.dart';

class SystemArticleList extends StatefulWidget{

  final String cid;

  SystemArticleList({@required this.cid});

  @override
  State<StatefulWidget> createState()=>_State();

}

class _State extends State<SystemArticleList> with AutomaticKeepAliveClientMixin{



  final RefreshController refreshController = RefreshController();

  int curPage = 0;
  int pageCount;
  var dataList = [].obs;

  @override
  void initState() {
    super.initState();
    request(widget.cid);
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(()=>SmartRefresher(
        enablePullUp: true,
        enablePullDown: true,
        onRefresh: onRefresh,
        onLoading: onLoading,
        controller: refreshController,
        child: ListView.builder(
            itemCount: dataList.value.length,
            itemBuilder: (BuildContext ctx,int index){
              return _buildItem(index);
            }
        ),
    )
    );
  }


  Widget _buildItem(int index){
    dynamic entity = dataList.value[index];
    return InkWell(
      onTap: (){
        NavigatorUtil.push(Routes.web,arguments: WebContent(url: entity.link,author:entity.shareUser));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text('${entity.shareUser}',style: TextStyles.greyNormal12,),),
                Text('${entity.niceDate}',style: TextStyles.greyNormal12,),
              ],
            ),
            Gaps.vGap10,
            Text('${entity.title}',style:TextStyles.blackNormal14),
            Gaps.vGap10,
            Row(
              children: [
                Expanded(child: Text('${entity.superChapterName}.${entity.chapterName}',style: TextStyles.greyNormal12,)),
                LikeButton(size: 20,)
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onRefresh(){
    curPage = 0;
    dataList.clear();
    request(widget.cid);
    refreshController.refreshCompleted();
  }

  void onLoading(){
    curPage ++;
    request(widget.cid);
    if(curPage<pageCount){
      refreshController.loadComplete();
    }else{
      refreshController.loadNoData();
    }
  }

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

  @override
  bool get wantKeepAlive => true;
}

import 'package:Inke/modules/square/square_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:Inke/widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/router/routes.dart';
import 'package:Inke/bean/web_content.dart';
import 'package:Inke/widgets/text.dart';
import 'package:Inke/widgets/gaps.dart';
import 'package:like_button/like_button.dart';
import 'package:Inke/bean/square_list_entity.dart';

class SquareListPage extends GetView<SquareListController> {

  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar.centerTitle('广场',actions: [
        IconButton(
            icon: Icon(Icons.add,color: Colors.white,),
            onPressed: (){
                NavigatorUtil.push(Routes.share);
            }
        )
      ]),
      body: Obx(()=>SmartRefresher(
          enablePullUp: true,
          enablePullDown: true,
          onRefresh: onRefresh,
          onLoading: onLoading,
          controller: _refreshController,
          child: ListView.builder(
              itemCount: controller.dataList.length,
              itemBuilder: (BuildContext ctx,int index){
                  return _buildItem(index);
              }
          ),
      )),
    );
  }

  Widget _buildItem(int index){
    SquareListDataDatas entity = controller.dataList[index];
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
                Visibility(
                    visible: entity.fresh==true,
                    child: Row(
                      children: [
                        Text('新',style: TextStyles.mainNormal14,),
                        Gaps.hGap10,
                      ],
                    )
                ),
                InkWell(
                  onTap: (){
                      NavigatorUtil.push(Routes.shareOne,arguments: {'id':'${entity.userId}'});
                  },
                  child:Text('${entity.shareUser}',style: TextStyles.greyNormal12,),
                ),
                Expanded(child: Container(),),
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
     controller.page = 0;
     controller.dataList.clear();
     controller.requestList();
     _refreshController.refreshCompleted();
  }

  void onLoading(){
    controller.page ++;
    controller.requestList();
    if(controller.page<controller.pageCount){
      _refreshController.loadComplete();
    }else{
      _refreshController.loadNoData();
    }
  }
}

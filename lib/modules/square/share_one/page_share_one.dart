import 'package:Inke/modules/square/share_one/share_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/router/routes.dart';
import 'package:Inke/bean/web_content.dart';
import 'package:Inke/widgets/text.dart';
import 'package:Inke/widgets/gaps.dart';
import 'package:like_button/like_button.dart';
import 'package:Inke/bean/share_one_entity.dart';
import 'package:Inke/util/image_util.dart';

class ShareOnePage extends GetView<ShareOneController> {

  ShareOnePage({Key key}) : super(key: key);

  final RefreshController _refreshController = RefreshController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        onLoading: onLoading,
        onRefresh: onRefresh,
        controller: _refreshController,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              centerTitle: true,
              expandedHeight: 250,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext ctx,BoxConstraints constraints){
                    final top = constraints.biggest.height;
                    return Obx((){
                      ShareOneDataCoinInfo coinInfo = controller.coinInfo.value;
                      return FlexibleSpaceBar(
                        titlePadding: const EdgeInsets.only(bottom: 16),
                        title: Visibility(
                          visible: top < 105,
                          child: Text(coinInfo.nickname!=null?'${coinInfo.nickname}':'加载中...',style: TextStyles.whiteNormal12,),
                        ),
                        background: Container(
                          padding: const EdgeInsets.only(top: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              loadAssetImage('app_icon',width: 60,height: 60),
                              Gaps.vGap10,
                              Text('${coinInfo.nickname != null ? coinInfo.nickname:'加载中...'}',style: TextStyles.whiteNormal18,),
                              Gaps.vGap10,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('ID:${coinInfo.userId != null ? coinInfo.userId:'加载中...'}',style: TextStyles.greyNormal14,),
                                  Gaps.hGap5,
                                  Text('积分:${coinInfo.coinCount != null ? coinInfo.coinCount:'加载中...'}',style: TextStyles.greyNormal14),
                                  Gaps.hGap5,
                                  Text('排名:${coinInfo.rank != null ? coinInfo.rank:'加载中...'}',style: TextStyles.greyNormal14),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
                  }
              ),
              pinned: true,
            ),
            Obx(()=>_buildList())
          ],
        ),
      ),
    );
  }

  Widget _buildList(){
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (BuildContext ctx,int index){
              return _buildItem(index);
            },
            childCount: controller.shareArticles.value.length
        )
    );
  }

  Widget _buildItem(int index){
    ShareOneDataShareArticlesDatas entity = controller.shareArticles[index];
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
    controller.page = 1;
    controller.shareArticles.clear();
    controller.requestData();
    _refreshController.refreshCompleted();
  }

  void onLoading(){
    controller.page ++;
    controller.requestData();
    if(controller.page<controller.pageCount){
      _refreshController.loadComplete();
    }else{
      _refreshController.loadNoData();
    }
  }
}


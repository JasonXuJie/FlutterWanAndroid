import 'package:Inke/bean/web_content.dart';
import 'package:Inke/widgets/gaps.dart';
import 'package:Inke/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:Inke/widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:Inke/http/http_manager.dart';
import 'package:Inke/http/api.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/router/routes.dart';
import 'package:Inke/bean/qa_entity.dart';
import 'package:Inke/util/html_parser.dart';
import 'package:like_button/like_button.dart';
import 'package:Inke/config/colors.dart';

class QaPage extends StatefulWidget {
  const QaPage({Key key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<QaPage> with AutomaticKeepAliveClientMixin{

  final RefreshController refreshController = RefreshController();
  int curPage = 1;
  var dataList = [].obs;
  int pageCount;

  @override
  void initState() {
    super.initState();
    request();

  }


  void request()async{
      final data = await HttpManager.getInstance().get(url: Api.qaList('$curPage'));
      if(data != null){
         QaEntity entity  =  QaEntity().fromJson(data);
         pageCount =  entity.data.pageCount;
         if(dataList.length == 0){
           dataList.value =  entity.data.datas;
         }else{
           dataList.addAll(entity.data.datas);
         }
      }
  }




  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: TopBar.centerTitle('问答'),
      body: Obx(()=>SmartRefresher(
        enablePullUp: true,
        enablePullDown: true,
        controller: refreshController,
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: ListView.builder(
            padding: const EdgeInsets.only(top: 15,left: 20,right: 20),
            itemCount: dataList.value.length,
            itemBuilder: (BuildContext ctx,int index){
              return _buildItem(index);
            }
        ),
      )),
    );
  }


  void onRefresh(){
    curPage = 0;
    dataList.clear();
    request();
    refreshController.refreshCompleted();
  }

  void onLoading(){
    curPage++;
    request();
    if(curPage<pageCount){
      refreshController.loadComplete();
    }else{
      refreshController.loadNoData();
    }
  }
  
  Widget _buildItem(int index){
    return InkWell(
      onTap: (){
        NavigatorUtil.push(Routes.web,arguments: WebContent(url: dataList[index].link, author: dataList[index].author));
      },
      child: Card(
        child: Container(
          height: 200,
          padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(dataList[index].author),
                  Gaps.hGap5,
                  Container(
                    padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: AppColors.colorPrimary
                        )
                    ),
                    child: Text(dataList[index].tags[0].name,style: TextStyles.textMain12),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text(dataList[index].niceDate)
                ],
              ),
              Gaps.vGap10,
              Text(dataList[index].title),
              Gaps.vGap10,
              Text(parseHtml(dataList[index].desc),maxLines: 3,overflow: TextOverflow.fade,),
              Gaps.vGap10,
              Row(
                children: [
                  Text('${dataList[index].superChapterName}.${dataList[index].chapterName}'),
                  Gaps.hGap5,
                  Expanded(
                      child: LikeButton(
                        size: 20,
                        likeCount:dataList[index].zan,
                        isLiked: dataList[index].zan>0?true:false,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        onTap: (bool isTap)async{
                          return isTap;
                        },
                      )
                  ),
                  LikeButton(
                    size: 20,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

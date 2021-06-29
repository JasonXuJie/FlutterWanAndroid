import 'package:Inke/modules/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:Inke/config/colors.dart';
import 'package:Inke/widgets/text.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:Inke/bean/web_content.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/router/routes.dart';
import 'package:like_button/like_button.dart';
import 'package:Inke/widgets/gaps.dart';
import 'package:Inke/bean/author_search_entity.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<SearchPage> {


  final SearchController controller = Get.find();

  final RefreshController refreshController = RefreshController();

  var content = ''.obs;

  final String hint = Get.arguments['hint'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            height: 40.0,
            child: Obx((){
              return TextField(
                autofocus: true,
                controller: TextEditingController.fromValue(
                    TextEditingValue(
                        text: content.value,
                        selection: TextSelection.fromPosition(
                            TextPosition(
                                affinity: TextAffinity.downstream,
                                offset:content.value.length
                            )
                        )
                    )
                ),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(fontSize: 14.0, color: AppColors.color_9d),
                  fillColor: AppColors.color_ff,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                ),
                maxLines: 1,
                cursorColor: Theme.of(context).primaryColor,
                style: TextStyle(fontSize: 14.0, color: AppColors.color_66),
                onChanged: (String content){
                  this.content.value = content;
                  if(this.content.value.length == 0 && controller.searchData.length > 0){
                    controller.hasContent.value = false;
                    controller.searchData.value = [];
                  }
                },
              );
            }),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 20,
                ),
                onPressed: () {
                  controller.page = 0;
                  controller.searchData.value = [];
                  controller.search(content.value);
                })
          ],
        ),
        body: _buildBody(),
    );
  }


  Widget _buildBody(){
    if(controller.isSearchAuthor){
      return Obx(()=>controller.hasContent.value == true?_buildSearchContent():Container());
    }else{
      return Obx(()=>controller.hasContent.value == true?_buildSearchContent():_buildTags());
    }
  }
  
  
  Widget _buildTags(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 14.0,left: 10.0,bottom: 20),
          child: Text(
            '热门搜索',
            style: TextStyles.textMain16,
          ),
        ),
        Obx(()=>Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(controller.dataList.length, (index){
              return GestureDetector(
                onTap: (){
                  content.value = controller.dataList.value[index].name;
                  controller.search(content.value);
                  //FocusScope.of(context).requestFocus(FocusNode()); //取消键盘
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text('${controller.dataList.value[index].name}',style: TextStyles.blackNormal10,),
                ),
              );
            }),
          ),
        )),
        Padding(
          padding: const EdgeInsets.only(top: 14.0,left: 10.0),
          child: Text(
            '历史搜索',
            style: TextStyles.textMain16,
          ),
        ),
      ],
    );
  }


  Widget _buildSearchContent(){
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: onRefresh,
        onLoading: onLoading,
        controller: refreshController,
        child: ListView.builder(
            itemCount: controller.searchData.value.length,
            itemBuilder: (BuildContext ctx,int index){
                return _buildItem(index);
            }
        ),
    );
  }

  Widget _buildItem(int index){
    AuthorSearchDataDatas entity = controller.searchData.value[index];
    return InkWell(
      onTap: (){
        NavigatorUtil.push(Routes.web,arguments: WebContent(url: entity.link,author:entity.author));
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
                Expanded(child: Text('${entity.author}',style: TextStyles.greyNormal12,),),
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
    controller.page=0;
    controller.searchData.clear();
    controller.search(content.value);
    refreshController.refreshCompleted();
  }

  void onLoading(){
    controller.page++;
    controller.search(content.value);
    if(controller.page<controller.pageCount){
      refreshController.loadComplete();
    }else{
      refreshController.loadNoData();
    }
  }

}

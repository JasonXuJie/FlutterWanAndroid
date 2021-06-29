import 'package:Inke/widgets/gaps.dart';
import 'package:flutter/material.dart';
import 'package:Inke/http/api.dart';
import 'package:Inke/modules/project/project_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:Inke/http/http_manager.dart';
import 'package:Inke/bean/project_entity.dart';
import 'package:Inke/widgets/text.dart';
import 'package:Inke/util/image_util.dart';
import 'package:Inke/modules/project/dialog_link.dart';

class ProjectList extends StatefulWidget {

  final String cid;

  ProjectList({@required this.cid});

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> with AutomaticKeepAliveClientMixin{


  final ProjectController controller = Get.find();
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  var dataList = [].obs;
  int page = 1;
  int pageCount;



  @override
  void initState() {
    super.initState();
    request();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(()=>SmartRefresher(
      enablePullUp: true,
      enablePullDown: true,
      controller: _refreshController,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (BuildContext context,int index){
            return _buildItem(index);
          }
      ),
    ));
  }


  void request()async{
    var  data = await HttpManager.getInstance().get(url: Api.projectList('$page', widget.cid));
    if(data != null){
      ProjectEntity entity = ProjectEntity().fromJson(data);
      pageCount = entity.data.pageCount;
      if(dataList.length == 0){
        dataList.value = entity.data.datas;
      }else{
        dataList.addAll(entity.data.datas);
      }
      print(dataList.value.length);
    }
  }

  void onRefresh(){
    page = 0;
    dataList.clear();
    request();
    _refreshController.refreshCompleted();
  }

  void onLoading(){
    page++;
    request();
    if(page<pageCount){
      _refreshController.loadComplete();
    }else{
      _refreshController.loadNoData();
    }
  }

  Widget _buildItem(int index){
    return InkWell(
      onTap: (){
          Get.dialog(
              LinkDialog(localPath: dataList[index].link, outPath: dataList[index].projectLink,author: dataList[index].author,)
          );
      },
      child: Column(
        children: [
          Container(
            height: 150,
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('作者:${dataList[index].author}',style: TextStyles.blackNormal14,),
                        Gaps.vGap10,
                        Text('简介:${dataList[index].desc}',style: TextStyles.blackNormal12,maxLines: 2,overflow: TextOverflow.ellipsis,),
                        Gaps.vGap10,
                        Text('👍: ${dataList[index].zan}',style: TextStyles.blackNormal14,)
                      ],
                    )
                ),
                Flexible(
                    child: loadNetImage(dataList[index].envelopePic,width: 80,height: 100)
                )
              ],
            ),
          ),
          Gaps.vGap10,
          Divider(height: 1,color: Colors.grey)
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

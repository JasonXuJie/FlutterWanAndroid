import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Inke/modules/home/home_controller.dart';
import 'package:Inke/modules/home/view_banner.dart';
import 'package:Inke/modules/home/view_top.dart';
import 'package:Inke/modules/home/view_home_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<HomePage> with AutomaticKeepAliveClientMixin{

  final HomeController controller = Get.find();

  final RefreshController refreshController = RefreshController();


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: refreshController,
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(()=>BannerView(list: controller.banners.value)),
              Obx(()=>TopList(list: controller.topList.value,)),
              Obx(()=>HomeList(list: controller.homeList.value))
            ],
          ),
        ),
    );
  }


  void onRefresh(){
    controller.banners.clear();
    controller.topList.clear();
    controller.homeList.clear();
    controller.curPage = 0;
    controller.requestBanner();
    controller.requestTopList();
    controller.requestList();
    refreshController.refreshCompleted();
  }

  void onLoading(){
     controller.curPage++;
     controller.requestList();
     if(controller.curPage<controller.pageCount){
       refreshController.loadComplete();
     }else{
       refreshController.loadNoData();
     }
  }








  @override
  bool get wantKeepAlive => true;
}

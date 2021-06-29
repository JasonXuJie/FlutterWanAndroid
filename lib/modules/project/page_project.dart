import 'package:flutter/material.dart';
import 'package:Inke/modules/project/project_controller.dart';
import 'package:get/get.dart';
import 'package:Inke/modules/project/list_project.dart';

class ProjectPage extends StatefulWidget {

  const ProjectPage({Key key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ProjectPage> with AutomaticKeepAliveClientMixin,TickerProviderStateMixin{

  TabController tabController;

  final ProjectController controller = Get.find();

  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(()=>Scaffold(
      appBar: AppBar(
        title: _buildTabBar(),
      ),
      body: _buildContent(),
    ));
  }


  Widget _buildTabBar(){
    tabController = TabController(length: controller.tabList.value.length, vsync: this);
    final tabBar = TabBar(
        isScrollable: true,
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.label,
        tabs:List.generate(controller.tabList.value.length, (index) => Tab(text: controller.tabList.value[index].name,)
    ));
    return tabBar;
  }

  Widget _buildContent(){
    return TabBarView(
        controller: tabController,
        children: List.generate(controller.tabList.value.length, (index){
          return ProjectList(cid:'${controller.tabList.value[index].id}',);
        })
    );
  }

  @override
  bool get wantKeepAlive => true;

}



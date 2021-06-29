import 'package:Inke/bean/system_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Inke/widgets/app_bar.dart';
import 'package:Inke/config/colors.dart';
import 'package:Inke/modules/system/article/list_system_article.dart';

class SystemArticlePage extends StatefulWidget{
  const SystemArticlePage();

  @override
  State<StatefulWidget> createState()=>_State();
}

class _State extends State<SystemArticlePage> with SingleTickerProviderStateMixin{

  TabController tabController;

  SystemDataData entity = Get.arguments['entity'] as SystemDataData;

  @override
  void initState() {
    super.initState();
    print(Get.arguments['index']);
    tabController = TabController(length: entity.children.length, vsync: this,initialIndex: Get.arguments['index']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar.centerTitle(entity.name),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColors.colorPrimary,
            child: TabBar(
                isScrollable: true,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey[400],
                controller: tabController,
                tabs: List.generate(entity.children.length, (index){
                  return Tab(text: entity.children[index].name);
                })
            ),
          ),
          Expanded(
              child: TabBarView(
                  controller: tabController,
                  children: List.generate(entity.children.length, (index){
                     return SystemArticleList(cid: '${entity.children[index].id}');
                  })
              )
          )
        ],
      ),
    );
  }
}

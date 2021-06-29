import 'package:Inke/widgets/gaps.dart';
import 'package:flutter/material.dart';
import 'package:Inke/widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:Inke/modules/my/usedweb/usedweb_controller.dart';
import 'package:Inke/widgets/text.dart';
import 'package:Inke/bean/web_content.dart';
import 'package:Inke/router/routes.dart';
import 'package:Inke/router/navigator_util.dart';

class UsedWebPage extends GetView<UsedWebController> {

  const UsedWebPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar.centerTitle('常用网站'),
      body: Obx(()=>
          ListView.builder(
              itemCount: controller.dataList.value.length,
              itemBuilder: (BuildContext ctx,int index){
                return _buildItem(index);
              }
          )
      ),
    );
  }

  Widget _buildItem(int idx){
    dynamic entity = controller.dataList.value[idx];
     return Container(
       padding: const EdgeInsets.all(15),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text('${entity.title}',style: TextStyles.blackNormal14,),
           Gaps.vGap10,
           Wrap(
             spacing: 10,
             runSpacing: 10,
             children: List.generate(entity.data.length, (index){
                  return GestureDetector(
                    onTap: (){
                      NavigatorUtil.push(Routes.web,arguments: WebContent(url: entity.data[index].link));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Text('${entity.data[index].name}',style: TextStyles.blackNormal10,),
                    ),
                  );
             }),
           )
         ],
       ),
     );
  }
}

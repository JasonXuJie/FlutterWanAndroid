import 'package:Inke/modules/system/system/system_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Inke/widgets/text.dart';
import 'package:Inke/widgets/gaps.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/router/routes.dart';


class SystemPage extends StatefulWidget {
  const SystemPage({Key key}) : super(key: key);

  @override
  _SystemPageState createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> with AutomaticKeepAliveClientMixin{

  final SystemController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(()=>ListView.builder(
        itemCount: controller.dataList.value.length,
        itemBuilder: (BuildContext ctx,int index){
          return _buildItem(index);
        }
    )
    );
  }

  Widget _buildItem(int idx){
    dynamic entity = controller.dataList.value[idx];
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${entity.name}',style: TextStyles.blackNormal14,),
          Gaps.vGap10,
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(entity.children.length, (index){
              return GestureDetector(
                onTap: (){
                  NavigatorUtil.push(Routes.systemArticle,arguments:{'entity':entity,'index':index});
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text('${entity.children[index].name}',style: TextStyles.blackNormal10,),
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

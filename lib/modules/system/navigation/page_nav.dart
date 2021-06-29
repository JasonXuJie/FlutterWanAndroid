import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Inke/modules/system/navigation/nav_controller.dart';
import 'package:Inke/widgets/text.dart';
import 'package:Inke/widgets/gaps.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/router/routes.dart';
import 'package:Inke/bean/web_content.dart';


class NavPage extends StatefulWidget {
  const NavPage({Key key}) : super(key: key);

  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> with AutomaticKeepAliveClientMixin{

  final NavController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(()=>ListView.builder(
      itemCount: controller.dataList.value.length,
      itemBuilder: (BuildContext ctx,int index){
        return _buildItem(index);
      },
    ));
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
            children: List.generate(entity.articles.length, (index){
              return GestureDetector(
                onTap: (){
                  NavigatorUtil.push(Routes.web,arguments: WebContent(url: entity.articles[index].link));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text('${entity.articles[index].title}',style: TextStyles.blackNormal10,),
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

import 'package:flutter/material.dart';
import 'package:Inke/widgets/gaps.dart';
import 'package:Inke/widgets/text.dart';
import 'package:Inke/modules/system/system/page_system.dart';
import 'package:Inke/modules/system/navigation/page_nav.dart';
import 'package:get/get.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/router/routes.dart';

class SystemIndexPage extends StatefulWidget {
  const SystemIndexPage({Key key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<SystemIndexPage> with AutomaticKeepAliveClientMixin{

  var _index = 0.obs;

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(()=>GestureDetector(
              onTap: (){
                _index.value = 0;
                _pageController.jumpToPage(0);
              },
              child: Text('体系',style:_index.value == 0 ?TextStyles.whiteNormal14:TextStyles.greyNormal14),
            )),
            Gaps.hGap15,
            Obx(()=>GestureDetector(
              onTap: (){
                _index.value = 1;
                _pageController.jumpToPage(1);
              },
              child: Text('导航',style:_index.value == 1 ?TextStyles.whiteNormal14:TextStyles.greyNormal14),
            ))
          ],
        ),
        centerTitle: true,
        actions: [
          Obx(()=>Visibility(
              visible: _index.value ==0,
              child: IconButton(
                  icon: Icon(Icons.search,color: Colors.white,size: 20,),
                  onPressed: (){
                      NavigatorUtil.push(Routes.search,arguments: {'hint':'请输入作者昵称,支持模糊匹配','isSearchAuthor':true});
                  }
              )
          ))
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index){
          _index.value = index;
          _pageController.jumpToPage(index);
        },
        children: [
          const SystemPage(),
          const NavPage()
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

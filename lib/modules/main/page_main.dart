import 'package:flutter/material.dart';
import 'package:Inke/modules/my/page_my.dart';
import 'package:Inke/util/image_util.dart';
import 'package:Inke/util/toast.dart';
import 'package:get/get.dart';
import 'package:Inke/modules/home/page_home.dart';
import 'package:Inke/modules/qa/page_qa.dart';
import 'package:Inke/modules/system/page_system_index.dart';
import 'package:Inke/modules/project/page_project.dart';
import 'package:Inke/modules/square/page_square_list.dart';


// ignore: must_be_immutable
class MainPage extends StatelessWidget {

  var _currentIndex = 0.obs;
  final List<String> titles = ['首页', '问答', '体系','项目','我的'];

  final _inController = PageController();
  final _outController = PageController(initialPage: 1);

  int firstTime = 0;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: PageView(
        controller: _outController,
        children: [
          SquareListPage(),
          Obx(()=>Scaffold(
            body:PageView(
              controller: _inController,
              onPageChanged: (int index){
                _currentIndex.value = index;
              },
              children: <Widget>[
                const HomePage(),
                const QaPage(),
                const SystemIndexPage(),
                const ProjectPage(),
                const MyPage(),
              ],
              physics: NeverScrollableScrollPhysics(), //禁止滑动
            ),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentIndex.value,
                onTap: (int index){
                  _inController.jumpToPage(index);
                },
                iconSize: 10.0,
                selectedFontSize: 13.0,
                unselectedFontSize: 13.0,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Color(0xff969696),
                items: [
                  BottomNavigationBarItem(
                      icon:loadAssetImage('nav_movie', width: 25.0, height: 25.0),
                      label: titles[0],
                      activeIcon:loadAssetImage('nav_movie_selected', width: 25.0, height: 25.0)
                  ),
                  BottomNavigationBarItem(
                      icon: loadAssetImage('nav_action', width: 25.0, height: 25.0),
                      label: titles[1],
                      activeIcon:loadAssetImage('nav_action_selected', width: 25.0, height: 25.0)
                  ),
                  BottomNavigationBarItem(
                      icon: loadAssetImage('nav_music', width: 25.0, height: 25.0),
                      label: titles[2],
                      activeIcon:loadAssetImage('nav_music_selected', width: 25.0, height: 25.0)
                  ),
                  BottomNavigationBarItem(
                      icon: loadAssetImage('nav_action', width: 25.0, height: 25.0),
                      label: titles[3],
                      activeIcon:loadAssetImage('nav_action_selected', width: 25.0, height: 25.0)
                  ),
                  BottomNavigationBarItem(
                      icon: loadAssetImage('nav_my', width: 25.0, height: 25.0),
                      label: titles[4],
                      activeIcon: loadAssetImage('nav_my_selected', width: 25.0, height: 25.0)
                  )
                ]),
          ))
        ],
      ),
      onWillPop: () {
        ///双击退出
        int secondTime = DateTime.now().millisecondsSinceEpoch;
        if (secondTime - firstTime > 2000) {
          Toast.show('再按一次退出程序');
          firstTime = secondTime;
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
    );
  }
}

import 'package:Inke/app_controller.dart';
import 'package:Inke/config/colors.dart';
import 'package:Inke/config/shared_key.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:Inke/widgets/bottom_clipper.dart';
import 'package:Inke/widgets/text.dart';
import 'package:Inke/util/image_util.dart';
import 'package:Inke/router/routes.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:get/get.dart';
import 'package:Inke/widgets/gaps.dart';
import 'package:Inke/util/sp_util.dart';


class MyPage extends StatefulWidget {

  const MyPage({Key key}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<MyPage> with AutomaticKeepAliveClientMixin {

  final menus = {
    '常用网站':'menu_list_one',
    '收藏': 'menu_list_two',
    '反馈': 'menu_list_three',
    '设置': 'menu_list_four',
  };

  var name;

  AppController controller = Get.find();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 350,
            color: AppColors.colorPrimary,
            child: Center(
              child: _buildInfo(),
            ),
          ),
          _buildMenuList()
        ],
      ),
    );
  }

  Widget _buildInfo(){
    return GestureDetector(
      onTap: ()async{
       dynamic isLogin = await SpUtil.get(SharedKey.isLogin);
       if(isLogin == null){
          NavigatorUtil.push(Routes.login);
       }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(()=>controller.isLogin.value==null?loadAssetImage('img_header', width: 60.0, height: 60.0):loadAssetImage('app_icon', width: 60.0, height: 60.0)),
          Gaps.vGap10,
          Obx(()=>Text(controller.user.value!=null?'${controller.user.value}':'登陆',style: TextStyles.whiteNormal14)),

        ],
      ),
    );
  }

  Widget _buildMenuList() {
    List<Widget> items = [];
    menus.forEach((title, imgpath) {
      items.add(Column(
        children: <Widget>[
          Container(
            child: ListTile(
              title: Text(title, style: TextStyles.mainNormal14),
              leading: loadAssetImage(imgpath, width: 25.0, height: 25.0),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                switch (title) {
                  case '常用网站':
                    NavigatorUtil.push(Routes.usedWeb);
                    break;
                  case '收藏':
                    NavigatorUtil.push(Routes.collect);
                    break;
                  case '反馈':
                    NavigatorUtil.push(Routes.feedBack);
                    break;
                  case '设置':
                    NavigatorUtil.push(Routes.setting);
                    break;
                }
              },
            ),
          ),
          Divider(height: 0.5)
        ],
      ));
    });
    return Wrap(
      children: items,
    );
  }





}

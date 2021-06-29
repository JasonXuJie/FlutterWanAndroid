import 'package:Inke/app_controller.dart';
import 'package:Inke/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:Inke/modules/my/setting/dialog_logout.dart';
import 'package:flutter/cupertino.dart';
import 'package:Inke/widgets/gaps.dart';
import 'package:Inke/widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:Inke/modules/my/setting/setting_controller.dart';
import 'package:Inke/config/shared_key.dart';
import 'package:Inke/util/sp_util.dart';

class SettingPage extends GetView<SettingController> {


  final AppController appController =  Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar.centerTitle('设置'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('暗色模式'),
                    Obx(()=>Switch(
                        value: appController.isCheckDark.value,
                        onChanged: (bool isCheck){
                             appController.isCheckDark.value = isCheck;
                             SpUtil.put(SharedKey.isCheckDark, isCheck);
                        }
                    ))
                  ],
                ),
            ),
            InkWell(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child:Text('版本更新')),
                    Row(
                      children: [
                        Text('发现新版本',style: TextStyles.textMain12),
                        Padding(
                            padding: const EdgeInsets.only(left:1),
                            child: Icon(Icons.chevron_right,color: Colors.grey[400]),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('关于我们'),
                    Row(
                      children: [
                        Text('当前版本1.0.0',style: TextStyles.greyNormal12),
                        Padding(
                          padding: const EdgeInsets.only(left:1),
                          child: Icon(Icons.chevron_right,color: Colors.grey[400]),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.dialog(LogoutDialog((){
                  controller.logout();
                }));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('退出登陆'),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

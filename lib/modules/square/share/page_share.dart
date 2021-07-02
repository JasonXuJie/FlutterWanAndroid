import 'package:Inke/config/colors.dart';
import 'package:Inke/modules/square/share/share_controller.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/router/routes.dart';
import 'package:Inke/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:Inke/widgets/app_bar.dart';
import 'package:Inke/widgets/gaps.dart';
import 'package:Inke/bean/web_content.dart';
import 'package:get/get.dart';

class SharePage extends StatelessWidget {

  SharePage({Key key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _linkController  = TextEditingController();
  final ShareController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar.centerTitle('分享文章'),
      body: Column(
        children: [
          _buildTitle('文章标题', '刷新标题', (){
            _titleController.text = '';
          }),
          _buildTextField(_titleController,'100字以内'),
          Gaps.vGap10,
          _buildTitle('文章链接', '打开链接', (){
            final String link = _linkController.text;
            if(link != null && link.length>0 && link.contains('http')){
              NavigatorUtil.push(Routes.web,arguments: WebContent(url: link));
            }

          }),
          _buildTextField(_linkController,'如:https://www.wanandroid.com/blog/show/2577'),
          Gaps.vGap15,
          GestureDetector(
              onTap: (){
                controller.share(_titleController.text, _linkController.text);
              }, 
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: AppColors.colorPrimary,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Center(
                  child: Text('分享',style: TextStyles.whiteNormal14),
                ),
              )
          )
        ],
      ),
    );
  }
  
  
  Widget _buildTitle(String title1,String title2,Function callBack){
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
                child: Text(title1,style: TextStyles.greyNormal12,)
            ),
            GestureDetector(
              onTap: callBack,
              child: Text(title2,style: TextStyles.textMain12,),
            )
          ],
        ),
    );
  }


  Widget _buildTextField(TextEditingController controller,String hint){
    return Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: TextField(
          controller: controller,
          style: TextStyles.blackNormal12,
          decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
          ),
        ),
    );
  }
}

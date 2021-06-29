import 'package:flutter/material.dart';
import 'package:Inke/router/routes.dart';
import 'package:Inke/widgets/text.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/bean/web_content.dart';


class LinkDialog extends Dialog{

  final String localPath;
  final String outPath;
  final String author;

  LinkDialog({@required this.localPath,@required this.outPath,@required this.author});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          padding: const EdgeInsets.only(top: 30,bottom: 30),
          child: Material(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('导航链接',style: TextStyles.blackBold17),
                GestureDetector(
                  onTap: ()async{
                    await NavigatorUtil.push(Routes.web,arguments:WebContent(url: localPath,author: author));
                    NavigatorUtil.goBack();
                  },
                  child: Text('本站链接',style: TextStyles.textMain12,),
                ),
                GestureDetector(
                  onTap: ()async{
                    await NavigatorUtil.push(Routes.web,arguments: WebContent(url: outPath, author: author));
                    NavigatorUtil.goBack();
                  },
                  child: Text('项目链接',style: TextStyles.textMain12,),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: (){
                      NavigatorUtil.goBack();
                    },
                    child: Text('取消',style: TextStyles.textMain12,),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
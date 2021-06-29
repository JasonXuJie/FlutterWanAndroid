import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:Inke/router/routes.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/bean/web_content.dart';
import 'package:Inke/widgets/text.dart';
import 'package:Inke/widgets/gaps.dart';

class HomeList extends StatelessWidget{

  final List<dynamic> list;

  HomeList({@required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('---推荐---',style: TextStyles.greyNormal12),
        ),
        ListView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext ctx,int index){
              return _buildItem(index);
            }
        )
      ],
    );
  }


  Widget _buildItem(int index){
     return InkWell(
       onTap: (){
         NavigatorUtil.push(Routes.web,arguments: WebContent(url: list[index].link,author: list[index].shareUser));
       },
       child: Container(
         padding: const EdgeInsets.all(15),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               children: [
                 Visibility(
                     visible: (list[index].fresh as bool)==true,
                     child: Row(
                       children: [
                         Text('新',style: TextStyles.mainNormal14,),
                         Gaps.hGap10,
                       ],
                     )
                 ),
                 Expanded(child:Text(list[index].shareUser),),
                 Text(list[index].niceDate,style: TextStyles.greyNormal12)
               ],
             ),
             Gaps.vGap10,
             Text(list[index].title,style:TextStyles.blackNormal14),
             Gaps.vGap10,
             Row(
               children: [
                 Expanded(
                     child: Text('${list[index].superChapterName}.${list[index].chapterName}',style: TextStyles.greyNormal12)
                 ),
                 LikeButton(
                   size: 20,
                 )
               ],
             )
           ],
         ),
       ),
     );
  }

}
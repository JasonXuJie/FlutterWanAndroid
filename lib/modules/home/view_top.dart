import 'package:flutter/material.dart';
import 'package:Inke/widgets/text.dart';
import 'package:Inke/widgets/gaps.dart';
import 'package:Inke/widgets/text.dart';
import 'package:Inke/util/html_parser.dart';
import 'package:like_button/like_button.dart';
import 'package:Inke/router/routes.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/bean/web_content.dart';


class TopList extends StatelessWidget{

  final List<dynamic> list;

  TopList({@required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('---置顶---',style: TextStyles.greyNormal12),
        ),
        ListView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext ctx,int index){
              return _buildItem(ctx,index);
            }
        )
      ],
    );
  }

  Widget _buildItem(BuildContext ctx,int index){
    return InkWell(
      onTap: (){
          NavigatorUtil.push(Routes.web,arguments: WebContent(url: list[index].link,author: list[index].author));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Visibility(
                    visible: (list[index].fresh as bool) == true,
                    child: Row(
                      children: [
                        Text('新',style: TextStyles.mainNormal14,),
                        Gaps.hGap10,
                      ],
                    )
                ),
                Text(list[index].author),
                Gaps.hGap10,
                (list[index].tags as List).length == 0 ?
                Expanded(child: Container()):
                Expanded(child: Container(child: Text('${list[index].tags[0]['name']}'),)),
                Text(list[index].niceDate,style: TextStyles.greyNormal12)
              ],
            ),
            Gaps.vGap15,
            Text(list[index].title,style:TextStyles.blackNormal14),
            Gaps.vGap15,
            Visibility(
                visible: (list[index].desc as String).length !=0,
                child: Column(
                  children: [
                    Text(parseHtml(list[index].desc),style:TextStyles.greyNormal12,maxLines: 3,overflow: TextOverflow.clip,),
                    Gaps.vGap15,
                  ],
                )
            ),
            Row(
              children: [
                Text('置顶',style: TextStyles.redNormal12),
                Gaps.hGap10,
                Expanded(
                    child: Text('${list[index].superChapterName}.${list[index].chapterName}',style: TextStyles.greyNormal12)
                ),
                LikeButton(
                  size: 20,
                )
              ],
            ),
          ],
        ),
      )
    );
  }

}
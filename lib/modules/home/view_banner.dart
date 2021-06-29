import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:Inke/bean/web_content.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/router/routes.dart';
import 'package:Inke/util/image_util.dart';
import 'package:Inke/router/navigator_util.dart';

class BannerView extends StatelessWidget{

  final List<dynamic> list;

  BannerView({@required this.list});

  var index = 0;

  @override
  Widget build(BuildContext context) {
     return SizedBox(
       height: 200,
       child: Stack(
         children: [
           Swiper(
             itemCount: list.length,
             autoplay: true,
             loop: true,
             index: index,
             itemBuilder: (BuildContext ctx,int index){
               return _buildItem(index);
             },
             onIndexChanged: (index){
               this.index = index;
             },
           ),
           Padding(
               padding: const EdgeInsets.only(top: 25,right: 15),
               child: Align(
                 alignment: Alignment.topRight,
                 child:IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed: (){
                   NavigatorUtil.push(Routes.search,arguments: {'hint':'用空格隔开多个关键字','isSearchAuthor':false});
                 }),
               ),
           ),
         ],
       ),
     );
  }


  Widget _buildItem(int index){
    return GestureDetector(
      onTap: (){
        NavigatorUtil.push(Routes.web,arguments: WebContent(url: list[index].url));
      },
      child: loadNetImage(list[index].imagePath,fit: BoxFit.fill),
    );
  }


}
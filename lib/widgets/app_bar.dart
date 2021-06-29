import 'package:Inke/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:Inke/widgets/text.dart';



class TopBar{

  static AppBar centerTitle(String title,{List<Widget> actions}){
    return AppBar(
      backgroundColor: AppColors.colorPrimary,
      title: Text(title,style: TextStyles.whiteNormal14),
      centerTitle: true,
      actions: actions,
      elevation: 0,//去除下面阴影线
    );
  }


  static Widget centerTitleNoBack(String title){
    return Container(
      color: AppColors.colorPrimary,
      height: 50,
      child: Center(
        child: Text(title,style: TextStyles.whiteNormal14),
      ),
    );
  }
}
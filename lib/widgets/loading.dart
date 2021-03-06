import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

///加载控件
class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator()
          : CircularProgressIndicator(),
    );
  }
}

///Lottie加载
class LoadingAnimView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoadingState();
}

class _LoadingState extends State<LoadingAnimView> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 130,
        height: 130,
        child: Container(),
      ),
    );
  }


}


///加载进度对话框
class LoadingDialog extends Dialog{

  final String text;

  LoadingDialog({Key key,this.text}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return Material(//创建透明层
      type: MaterialType.transparency, //透明类型
      child: Center(
        child: SizedBox(
          width: 120.0,
          height: 120.0,
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Platform.isIOS?CupertinoActivityIndicator():CircularProgressIndicator(),
                Padding(
                  padding:const EdgeInsets.only(top: 20.0),
                  child: Text(
                    text ?? '加载中...',
                    style: const TextStyle(fontSize: 13.0),
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

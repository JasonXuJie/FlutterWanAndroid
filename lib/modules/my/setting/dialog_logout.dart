import 'package:flutter/material.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/widgets/text.dart';

typedef void OnLogoutCallBack();

class LogoutDialog extends Dialog {
  final OnLogoutCallBack callBack;

  LogoutDialog(this.callBack);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 200.0,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)))),
        child: Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '提示',
                  style: TextStyles.redNormal18,
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      '您确定要登出吗?',
                      style: TextStyles.blackNormal18,
                    ),
                  )),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        NavigatorUtil.goBack();
                      },
                      child: Text(
                        '取消',
                        style: TextStyles.blackNormal16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        callBack();
                        NavigatorUtil.goBack();
                      },
                      child: Text(
                        '确定',
                        style: TextStyles.textMain16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

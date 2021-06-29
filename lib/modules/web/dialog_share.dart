import 'package:Inke/router/navigator_util.dart';
import 'package:flutter/material.dart';
import 'package:Inke/widgets/text.dart';
import 'package:get/get.dart';
import 'package:Inke/util/image_util.dart';

class ShareDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      width: MediaQuery.of(context).size.width,
      height: 250.0,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              '--分享到--',
              style: TextStyles.blackBold18,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      // FluWxUtil.share(widget.url,
                      //     widget.title, true);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        loadAssetImage('weixin_friend',
                            width: 45.0, height: 45.0),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            '微信好友',
                            style: TextStyles.blackNormal12,
                          ),
                        ),
                      ],
                    )),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      loadAssetImage('weixin_friendcycle',
                          width: 45.0, height: 45.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          '微信至朋友圈',
                          style: TextStyles.blackNormal12,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      //Share.share(widget.url);
                      NavigatorUtil.goBack();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        loadAssetImage('img_header', width: 45.0, height: 45.0),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            '系统分享',
                            style: TextStyles.blackNormal12,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                NavigatorUtil.goBack();
              },
              child: Text(
                '取消',
                style: TextStyles.blackNormal14,
              ))
        ],
      ),
    );
  }
}

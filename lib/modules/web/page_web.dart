import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:Inke/widgets/text.dart';
import 'package:get/get.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/modules/web/dialog_share.dart';
import 'package:Inke/widgets/gaps.dart';
import 'package:Inke/bean/web_content.dart';

class WebPage extends StatelessWidget {
  WebViewController _webViewController;
  Completer<bool> _finishCompleter = Completer();

  @override
  Widget build(BuildContext context) {
    final WebContent content =  Get.arguments as WebContent;
    return WillPopScope(
        onWillPop: () async {
          bool canGoBack = await _webViewController.canGoBack();
          if (canGoBack) {
            //网页可返回时，优先返回上一页
            //_webViewController.goBack();
            return Future.value(false);
          }
          return Future.value(true);
        },
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: [
                    _buildWebView(content.url),
                    FutureBuilder<bool>(
                      future: _finishCompleter.future,
                      initialData: false,
                      builder: (context, snapshot) {
                        return Offstage(
                          offstage: snapshot.data,
                          child: LinearProgressIndicator(),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 40),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            NavigatorUtil.goBack();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                  visible: content.author != null,
                  child: _buildBottom(content.author)
              )
            ],
          ),
        ));
  }

  WebView _buildWebView(String  url) {
    return WebView(
      initialUrl:url,
      javascriptMode: JavascriptMode.unrestricted,
      navigationDelegate: (NavigationRequest request) {
        ///TODO isForMainFrame为false,页面不跳转.导致网页内很多链接点击没效果
        return NavigationDecision.navigate;
      },
      onWebViewCreated: (WebViewController controller) {
        _webViewController = controller;
        controller.currentUrl().then((url) {});
      },
      onPageFinished: (String s) {
        if (!_finishCompleter.isCompleted) _finishCompleter.complete(true);
      },
    );
  }

  Widget _buildBottom(String author) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.white,
        height: 100,
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Row(
              children: [
                Text(author ?? '', style: TextStyles.greyNormal14),
                Gaps.hGap10,
                IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () async {
                      await _webViewController.reload();
                    }),
                Gaps.hGap10,
                IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      Get.bottomSheet(ShareDialog());
                    }),
              ],
            )),
            Text('评论(0)', style: TextStyles.greyNormal14),
          ],
        ),
      ),
    );
  }
}

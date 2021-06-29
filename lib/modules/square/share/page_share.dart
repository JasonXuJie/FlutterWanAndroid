import 'package:flutter/material.dart';
import 'package:Inke/widgets/app_bar.dart';

class SharePage extends StatelessWidget {
  const SharePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar.centerTitle('分享文章'),
      body: Container(),
    );
  }
}

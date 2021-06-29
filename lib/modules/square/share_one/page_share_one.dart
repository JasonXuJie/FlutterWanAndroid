import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Inke/widgets/app_bar.dart';

class ShareOnePage extends StatelessWidget {
  const ShareOnePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar.centerTitle('标题'),
    );
  }
}


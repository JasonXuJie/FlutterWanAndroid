import 'package:flutter/material.dart';
import 'package:Inke/widgets/app_bar.dart';

class CollectPage extends StatefulWidget {

  const CollectPage({Key key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<CollectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar.centerTitle('收藏'),
    );
  }
}

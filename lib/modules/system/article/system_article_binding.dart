import 'package:get/get.dart';
import 'package:Inke/modules/system/article/system_article_controller.dart';

class SystemArticleBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(SystemArticleController());
  }

}
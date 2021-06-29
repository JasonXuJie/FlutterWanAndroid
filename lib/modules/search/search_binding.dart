import 'package:get/get.dart';
import 'package:Inke/modules/search/search_controller.dart';

class SearchBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(SearchController());
  }

}
import 'package:Inke/generated/json/base/json_convert_content.dart';

class UsedWebEntity with JsonConvert<UsedWebEntity> {
	List<UsedWebData> data;
}

class UsedWebData with JsonConvert<UsedWebData> {
	String category;
	String icon;
	int id;
	String link;
	String name;
	int order;
	int visible;
}

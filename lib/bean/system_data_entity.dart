import 'package:Inke/generated/json/base/json_convert_content.dart';

class SystemDataEntity with JsonConvert<SystemDataEntity> {
	List<SystemDataData> data;
}

class SystemDataData with JsonConvert<SystemDataData> {
	List<SystemDataDataChildren> children;
	int courseId;
	int id;
	String name;
	int order;
	int parentChapterId;
	bool userControlSetTop;
	int visible;
}

class SystemDataDataChildren with JsonConvert<SystemDataDataChildren> {
	List<dynamic> children;
	int courseId;
	int id;
	String name;
	int order;
	int parentChapterId;
	bool userControlSetTop;
	int visible;
}

import 'package:Inke/generated/json/base/json_convert_content.dart';

class ProjectClassifyEntity with JsonConvert<ProjectClassifyEntity> {
	List<ProjectClassifyData> data;
}

class ProjectClassifyData with JsonConvert<ProjectClassifyData> {
	int courseId;
	int id;
	String name;
	int order;
	int parentChapterId;
	bool userControlSetTop;
	int visible;
}

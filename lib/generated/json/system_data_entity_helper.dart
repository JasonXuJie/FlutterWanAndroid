import 'package:Inke/bean/system_data_entity.dart';

systemDataEntityFromJson(SystemDataEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => SystemDataData().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> systemDataEntityToJson(SystemDataEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

systemDataDataFromJson(SystemDataData data, Map<String, dynamic> json) {
	if (json['children'] != null) {
		data.children = (json['children'] as List).map((v) => SystemDataDataChildren().fromJson(v)).toList();
	}
	if (json['courseId'] != null) {
		data.courseId = json['courseId'] is String
				? int.tryParse(json['courseId'])
				: json['courseId'].toInt();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['order'] != null) {
		data.order = json['order'] is String
				? int.tryParse(json['order'])
				: json['order'].toInt();
	}
	if (json['parentChapterId'] != null) {
		data.parentChapterId = json['parentChapterId'] is String
				? int.tryParse(json['parentChapterId'])
				: json['parentChapterId'].toInt();
	}
	if (json['userControlSetTop'] != null) {
		data.userControlSetTop = json['userControlSetTop'];
	}
	if (json['visible'] != null) {
		data.visible = json['visible'] is String
				? int.tryParse(json['visible'])
				: json['visible'].toInt();
	}
	return data;
}

Map<String, dynamic> systemDataDataToJson(SystemDataData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['children'] =  entity.children?.map((v) => v.toJson())?.toList();
	data['courseId'] = entity.courseId;
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['parentChapterId'] = entity.parentChapterId;
	data['userControlSetTop'] = entity.userControlSetTop;
	data['visible'] = entity.visible;
	return data;
}

systemDataDataChildrenFromJson(SystemDataDataChildren data, Map<String, dynamic> json) {
	if (json['children'] != null) {
		data.children = (json['children'] as List).map((v) => v).toList().cast<dynamic>();
	}
	if (json['courseId'] != null) {
		data.courseId = json['courseId'] is String
				? int.tryParse(json['courseId'])
				: json['courseId'].toInt();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['order'] != null) {
		data.order = json['order'] is String
				? int.tryParse(json['order'])
				: json['order'].toInt();
	}
	if (json['parentChapterId'] != null) {
		data.parentChapterId = json['parentChapterId'] is String
				? int.tryParse(json['parentChapterId'])
				: json['parentChapterId'].toInt();
	}
	if (json['userControlSetTop'] != null) {
		data.userControlSetTop = json['userControlSetTop'];
	}
	if (json['visible'] != null) {
		data.visible = json['visible'] is String
				? int.tryParse(json['visible'])
				: json['visible'].toInt();
	}
	return data;
}

Map<String, dynamic> systemDataDataChildrenToJson(SystemDataDataChildren entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['children'] = entity.children;
	data['courseId'] = entity.courseId;
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['parentChapterId'] = entity.parentChapterId;
	data['userControlSetTop'] = entity.userControlSetTop;
	data['visible'] = entity.visible;
	return data;
}
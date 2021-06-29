import 'package:Inke/bean/used_web_entity.dart';

usedWebEntityFromJson(UsedWebEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => UsedWebData().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> usedWebEntityToJson(UsedWebEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

usedWebDataFromJson(UsedWebData data, Map<String, dynamic> json) {
	if (json['category'] != null) {
		data.category = json['category'].toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['link'] != null) {
		data.link = json['link'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['order'] != null) {
		data.order = json['order'] is String
				? int.tryParse(json['order'])
				: json['order'].toInt();
	}
	if (json['visible'] != null) {
		data.visible = json['visible'] is String
				? int.tryParse(json['visible'])
				: json['visible'].toInt();
	}
	return data;
}

Map<String, dynamic> usedWebDataToJson(UsedWebData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['category'] = entity.category;
	data['icon'] = entity.icon;
	data['id'] = entity.id;
	data['link'] = entity.link;
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['visible'] = entity.visible;
	return data;
}
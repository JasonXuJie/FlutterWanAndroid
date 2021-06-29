import 'package:Inke/generated/json/base/json_convert_content.dart';

class HotkeyEntity with JsonConvert<HotkeyEntity> {
	List<HotkeyData> data;
}

class HotkeyData with JsonConvert<HotkeyData> {
	int id;
	String link;
	String name;
	int order;
	int visible;
}

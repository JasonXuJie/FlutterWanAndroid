import 'package:Inke/generated/json/base/json_convert_content.dart';

class LoginEntity with JsonConvert<LoginEntity> {
	LoginData data;
}

class LoginData with JsonConvert<LoginData> {
	bool admin;
	List<dynamic> chapterTops;
	int coinCount;
	List<int> collectIds;
	String email;
	String icon;
	int id;
	String nickname;
	String password;
	String publicName;
	String token;
	int type;
	String username;
}

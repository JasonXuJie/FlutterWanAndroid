import 'package:Inke/generated/json/base/json_convert_content.dart';

class BannerEntity with JsonConvert<BannerEntity> {
	List<BannerData> data;
}

class BannerData with JsonConvert<BannerData> {
	String desc;
	int id;
	String imagePath;
	int isVisible;
	int order;
	String title;
	int type;
	String url;
}

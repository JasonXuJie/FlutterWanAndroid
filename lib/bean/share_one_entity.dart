import 'package:Inke/generated/json/base/json_convert_content.dart';

class ShareOneEntity with JsonConvert<ShareOneEntity> {
	ShareOneData data;
}

class ShareOneData with JsonConvert<ShareOneData> {
	ShareOneDataCoinInfo coinInfo;
	ShareOneDataShareArticles shareArticles;
}

class ShareOneDataCoinInfo with JsonConvert<ShareOneDataCoinInfo> {
	int coinCount;
	int level;
	String nickname;
	String rank;
	int userId;
	String username;
}

class ShareOneDataShareArticles with JsonConvert<ShareOneDataShareArticles> {
	int curPage;
	List<ShareOneDataShareArticlesDatas> datas;
	int offset;
	bool over;
	int pageCount;
	int size;
	int total;
}

class ShareOneDataShareArticlesDatas with JsonConvert<ShareOneDataShareArticlesDatas> {
	String apkLink;
	int audit;
	String author;
	bool canEdit;
	int chapterId;
	String chapterName;
	bool collect;
	int courseId;
	String desc;
	String descMd;
	String envelopePic;
	bool fresh;
	String host;
	int id;
	String link;
	String niceDate;
	String niceShareDate;
	String origin;
	String prefix;
	String projectLink;
	int publishTime;
	int realSuperChapterId;
	int selfVisible;
	int shareDate;
	String shareUser;
	int superChapterId;
	String superChapterName;
	List<dynamic> tags;
	String title;
	int type;
	int userId;
	int visible;
	int zan;
}

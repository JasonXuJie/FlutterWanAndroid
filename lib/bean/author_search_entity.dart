import 'package:Inke/generated/json/base/json_convert_content.dart';

class AuthorSearchEntity with JsonConvert<AuthorSearchEntity> {
	AuthorSearchData data;
}

class AuthorSearchData with JsonConvert<AuthorSearchData> {
	int curPage;
	List<AuthorSearchDataDatas> datas;
	int offset;
	bool over;
	int pageCount;
	int size;
	int total;
}

class AuthorSearchDataDatas with JsonConvert<AuthorSearchDataDatas> {
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
	List<AuthorSearchDataDatasTags> tags;
	String title;
	int type;
	int userId;
	int visible;
	int zan;
}

class AuthorSearchDataDatasTags with JsonConvert<AuthorSearchDataDatasTags> {
	String name;
	String url;
}

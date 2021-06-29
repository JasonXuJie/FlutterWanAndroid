import 'package:Inke/generated/json/base/json_convert_content.dart';

class QaEntity with JsonConvert<QaEntity> {
	QaData data;
}

class QaData with JsonConvert<QaData> {
	int curPage;
	List<QaDataDatas> datas;
	int offset;
	bool over;
	int pageCount;
	int size;
	int total;
}

class QaDataDatas with JsonConvert<QaDataDatas> {
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
	List<QaDataDatasTags> tags;
	String title;
	int type;
	int userId;
	int visible;
	int zan;
}

class QaDataDatasTags with JsonConvert<QaDataDatasTags> {
	String name;
	String url;
}

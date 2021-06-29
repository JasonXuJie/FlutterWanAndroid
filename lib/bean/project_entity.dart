import 'package:Inke/generated/json/base/json_convert_content.dart';

class ProjectEntity with JsonConvert<ProjectEntity> {
	ProjectData data;
}

class ProjectData with JsonConvert<ProjectData> {
	int curPage;
	List<ProjectDataDatas> datas;
	int offset;
	bool over;
	int pageCount;
	int size;
	int total;
}

class ProjectDataDatas with JsonConvert<ProjectDataDatas> {
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
	List<ProjectDataDatasTags> tags;
	String title;
	int type;
	int userId;
	int visible;
	int zan;
}

class ProjectDataDatasTags with JsonConvert<ProjectDataDatasTags> {
	String name;
	String url;
}

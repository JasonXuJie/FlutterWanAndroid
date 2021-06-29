
class Api {
   static const String baseUrl = 'https://www.wanandroid.com/';

   ///项目分类
   static const String projectClassify = 'project/tree/json';

   ///项目列表数据
   static String projectList(String page,String cid)=>  'project/list/$page/json?cid=$cid';


   ///问答
   static String qaList(String page)=>'https://wanandroid.com/wenda/list/$page/json';

   ///首页banner
   static const String banner = 'https://www.wanandroid.com/banner/json';

   /// 首页文章列表
   static String homeList(String page)=> 'https://www.wanandroid.com/article/list/$page/json';

   ///首页置顶文章
   static const String homeTopList ='https://www.wanandroid.com/article/top/json';

   ///常用网站
   static const String usedWeb = 'https://www.wanandroid.com/friend/json';

   ///搜索热词
   static const String hotKey = 'https://www.wanandroid.com//hotkey/json';


   ///体系数据
   static const String systemData  = 'https://www.wanandroid.com/tree/json';

   ///体系文章
   static  String systemArticle(int page,String cid) => 'https://www.wanandroid.com/article/list/$page/json?cid=$cid';

   ///按照作者昵称搜索文章
   static String systemAuthorSearch(int page,String author) => 'https://wanandroid.com/article/list/$page/json?author=$author';

   ///导航数据
   static const String navData = 'https://www.wanandroid.com/navi/json';

   ///登陆
   ///参数：
   // 	username，password
   static const String login = 'https://www.wanandroid.com/user/login';

   ///注册
   ///参数
   // 	username,password,repassword
   static const String register = 'https://www.wanandroid.com/user/register';

   ///登出
   static const String logout = 'https://www.wanandroid.com/user/logout/json';

   ///搜索
   static String search(int page)  => 'https://www.wanandroid.com/article/query/$page/json';

   ///收藏相关
   ///收藏文章列表

   ///广场
   ///广场列表数据
   static String squareDataList(int page) => 'https://wanandroid.com/user_article/list/$page/json';

   /// 分享人对应列表数据
   static String shareArticlesList(String id,int page)=>'https://www.wanandroid.com/user/$id/share_articles/$page/json';

   ///自己的分享的文章列表
   static String privateArticlesList(int page)=>'https://wanandroid.com/user/lg/private_articles/$page/json';

   ///删除自己分享的文章
   static String deletePrivate(String id)=>'https://wanandroid.com/lg/user_article/delete/$id/json';

   ///分享文章
   static const String shareAtricles = 'https://www.wanandroid.com/lg/user_article/add/json';

}

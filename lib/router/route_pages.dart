import 'package:Inke/modules/home/home_binding.dart';
import 'package:Inke/modules/my/collect/collect_binding.dart';
import 'package:Inke/modules/my/my_binding.dart';
import 'package:Inke/modules/my/collect/page_collect.dart';
import 'package:Inke/modules/my/feedback/page_feedback.dart';
import 'package:Inke/modules/my/setting/page_setting.dart';
import 'package:Inke/modules/my/setting/setting_binding.dart';
import 'package:Inke/modules/project/project_binding.dart';
import 'package:Inke/modules/qa/qa_binding.dart';
import 'package:Inke/modules/qa/qa_controller.dart';
import 'package:Inke/modules/search/page_search.dart';
import 'package:Inke/modules/search/search_binding.dart';
import 'package:Inke/modules/square/square_list_binding.dart';
import 'package:Inke/modules/system/navigation/nav_binding.dart';
import 'package:Inke/modules/system/article/page_system_article.dart';
import 'package:Inke/modules/system/article/system_article_binding.dart';
import 'package:Inke/modules/system/system/system_binding.dart';
import 'package:Inke/modules/web/page_web.dart';
import 'package:Inke/modules/web/web_binding.dart';
import 'package:get/get.dart';
import 'package:Inke/router/routes.dart';
import 'package:Inke/modules/splash/page_splash.dart';
import 'package:Inke/modules/splash/splash_binding.dart';
import 'package:Inke/modules/guide/page_guide.dart';
import 'package:Inke/modules/guide/guide_binding.dart';
import 'package:Inke/modules/login/page_login.dart';
import 'package:Inke/modules/login/login_binding.dart';
import 'package:Inke/modules/main/page_main.dart';
import 'package:Inke/modules/main/main_binding.dart';
import 'package:Inke/modules/register/page_register.dart';
import 'package:Inke/modules/register/register_binding.dart';
import 'package:Inke/modules/my/feedback/feedback_binding.dart';
import 'package:Inke/modules/my/usedweb/page_used_web.dart';
import 'package:Inke/modules/my/usedweb/usedweb_binding.dart';

class AppPages{
  static final routes = [
    GetPage(
        name: Routes.splash,
        page: ()=>SplashPage(),
        binding: SplashBinding()
    ),
    GetPage(
        name: Routes.guide,
        page: ()=>GuidePage(),
        binding: GuideBinding()
    ),
    GetPage(
        name: Routes.login,
        page: ()=>LoginPage(),
        binding: LoginBinding()
    ),
    GetPage(
        name: Routes.register,
        page: ()=>RegisterPage(),
        binding: RegisterBinding()
    ),
    GetPage(
        name: Routes.main,
        page: ()=>MainPage(),
        bindings: [
          HomeBinding(),
          QaBinding(),
          SystemBinding(),
          Navbinding(),
          ProjectBinding(),
          MyBinding(),
          SquareListBinding()
        ]
    ),
    GetPage(
        name: Routes.search,
        page: ()=>SearchPage(),
        binding: SearchBinding()
    ),
    GetPage(
        name: Routes.web,
        page: ()=>WebPage(),
        binding: WebBinding()
    ),
    GetPage(
        name: Routes.collect,
        page: ()=>CollectPage(),
        binding: CollectBinding()
    ),
    GetPage(
        name: Routes.feedBack,
        page: ()=>FeedBackPage(),
        binding: FeedbackBinding()
    ),
    GetPage(
        name: Routes.setting,
        page: ()=>SettingPage(),
        binding: SettingBinding()
    ),
    GetPage(
        name: Routes.usedWeb,
        page: ()=>UsedWebPage(),
        binding: UsedWebBinding()
    ),
    GetPage(
        name: Routes.systemArticle,
        page: ()=>SystemArticlePage(),
        binding: SystemArticleBinding()
    )
  ];
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Inke/config/colors.dart';
import 'package:oktoast/oktoast.dart';
import 'package:Inke/util/fluwx_util.dart';
import 'package:Inke/widgets/refresh_helper.dart';
import 'package:get/get.dart';
import 'package:Inke/router/routes.dart';
import 'package:Inke/router/route_pages.dart';
import 'package:Inke/app_binding.dart';
import 'package:Inke/util/error_report.dart';


void main(){
  ///由于在main方法上添加了async需要添加此行代码进行绑定初始化，没有future则不需要添加次行代码
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  ///初始化微信分享Sdk
  //FluWxUtil.initFluwx();
  ErrorReport.init();
  runZonedGuarded(()=>runApp(InkeApp()), (Object obj, StackTrace stack){
    ErrorReport.reportException(obj, stack);
  });
}

class InkeApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return OKToast(
        dismissOtherOnShow: true,
        backgroundColor: Colors.black54,
        position: ToastPosition.bottom,
        radius: 20.0,
        textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: RefreshConfig(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            enableLog: true,
            title: 'MyWanAndroid',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                primaryColor: AppColors.colorPrimary,
                scaffoldBackgroundColor: AppColors.white, //默认全局背景色
                appBarTheme: AppBarTheme(color: Colors.blue)
            ),
            getPages: AppPages.routes,
            initialRoute: Routes.splash,
            initialBinding: AppBinding(),
            //home: ProviderPage(),
          ),
        )
    );
  }
}

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/error_page.dart';
import 'package:flutter_app/pages/main_page.dart';
import 'package:flutter_app/routers/router_init.dart';

class Routes {
  static String main = '/main';
  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(FluroRouter router) {
    //找不到页面
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        return ErrorPage();
      });

    //默认界面
    router.define(main, handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) => MainPage()
    ));

    //初始化路由器
    _listRouter.forEach((routerProvider){
      routerProvider.initRouter(router);
    });
  }
}
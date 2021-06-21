import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:oktoast/oktoast.dart';

import 'pages/Home/basicWidget/basic_animation_page.dart';
import 'pages/Home/basicWidget/basic_button_page.dart';
import 'pages/Home/basicWidget/basic_container.dart';
import 'pages/Home/basicWidget/basic_form_page.dart';
import 'pages/Home/basicWidget/basic_image_page.dart';
import 'pages/Home/basicWidget/basic_progress_page.dart';
import 'pages/Home/basicWidget/basic_switch_page.dart';
import 'pages/Home/basicWidget/basic_text_page.dart';
import 'pages/Home/basicWidget/basic_textform_page.dart';
import 'pages/Home/eventAndNotification/event_bus_page.dart';
import 'pages/Home/eventAndNotification/event_notification_page.dart';
import 'pages/Home/eventAndNotification/gesture_dispose_page.dart';
import 'pages/Home/eventAndNotification/notification_page.dart';
import 'pages/Home/eventAndNotification/original_event_page.dart';
import 'pages/Home/functionWidget/async_ui_page.dart';
import 'pages/Home/functionWidget/dialog_widget_page.dart';
import 'pages/Home/functionWidget/function_widget_page.dart';
import 'pages/Home/functionWidget/inherited_widget_page.dart';
import 'pages/Home/functionWidget/navigation_back_hold_page.dart';
import 'pages/Home/functionWidget/normal_state_manager_page.dart';
import 'pages/Home/functionWidget/provider_test2_page.dart';
import 'pages/Home/functionWidget/provider_test_page.dart';
import 'pages/Home/functionWidget/provider_widget_page.dart';
import 'pages/Home/functionWidget/state_manager_page.dart';
import 'pages/Home/layoutWidget/aligning_layout_page.dart';
import 'pages/Home/layoutWidget/layout_widget_page.dart';
import 'pages/Home/layoutWidget/line_layout_page.dart';
import 'pages/Home/layoutWidget/space_layout_page.dart';
import 'pages/Home/layoutWidget/stack_layout_page.dart';
import 'pages/Home/layoutWidget/water_layout_page.dart';
import 'pages/Home/other/dart_basic_page.dart';
import 'pages/Home/other/error_detail_page.dart';
import 'pages/Home/other/more_thead_page.dart';
import 'pages/Home/other/life_circle_page.dart';
import 'pages/Home/scrollWidget/customscrollview_widget_page.dart';
import 'pages/Home/scrollWidget/gridviewlist_widget_page.dart';
import 'pages/Home/scrollWidget/listview_widget_page.dart';
import 'pages/Home/scrollWidget/scroll_controller_page.dart';
import 'pages/Home/scrollWidget/scroll_listener_page.dart';
import 'pages/Home/scrollWidget/scroll_widget_page.dart';
import 'pages/Home/scrollWidget/singchild_widget_page.dart';
import 'pages/Home/vesselWidget/limit_size_widget_page.dart';
import 'pages/Home/vesselWidget/nav_widget_page.dart';
import 'pages/Home/vesselWidget/padding_widget_page.dart';
import 'pages/Home/vesselWidget/transform_widget_page.dart';
import 'pages/Home/vesselWidget/vessel_widget_page.dart';
import 'pages/Login/login_page.dart';
import 'pages/Mine/my_pagee.dart';
import 'pages/main_page.dart';

//处理Framework异常(弹出红色界面的异常)？
//只能收到本界面的异常?
Future<void> _reportError(dynamic error, dynamic stackTrace) async {
  print('catch error=');
  print(error);
}

Future<void> test(ZoneDelegate parent, Zone zone,String line) async {
  parent.print(zone,'打印日志收集$line');
}

Future<void> test2(String line) async {
  print('打印日志收集2:$line');
}

void main() {

  EasyLoading.instance
    ..maskType = EasyLoadingMaskType.clear;

  FlutterError.onError = (FlutterErrorDetails details) async {
//    FlutterError.dumpErrorToConsole(details);
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };

  runZonedGuarded<Future<void>>(() async {
    runApp(MyApp());
  },(dynamic error, StackTrace stackTrace) async {
    //异常处理
    await _reportError(error, stackTrace);
  }, zoneSpecification: ZoneSpecification(
    //输出打印日志
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
//        test2(line);
        test(parent, zone, line);
//        parent.print(zone, "打印收集: $line");
      },
  ));

  //监听设备的旋转方向
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  if (Platform.isAndroid) {
    //设置状态栏顶部和底部样式
    //很辣鸡，基本用不到
    const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: FlutterEasyLoading(
            child: MaterialApp(
              title: 'Flutter Demo',
              //使用系统控件的风格数据
              theme: ThemeData(
                //导航栏背景色
                primarySwatch: Colors.blue,
                //背景色
                scaffoldBackgroundColor: Colors.white,
                //输入框的占位文字颜色
                hintColor: Colors.red,
                dividerColor: Colors.grey
              ),
              darkTheme: ThemeData(
                //主题颜色
                //如果某些颜色属性没有设置，会使用主题颜色
                primarySwatch: Colors.teal,
                //主色，决定导航栏颜色
                primaryColor: Colors.orange,
                //次级色，决定大多数Widget的颜色，如进度条、开关等
                accentColor: Colors.black54,
                //卡片颜色
                cardColor: Colors.cyan,
                //分割线颜色
                dividerColor: Colors.blueGrey,
                scaffoldBackgroundColor: Colors.orange,
                hintColor: Colors.blue,
              ),
              home: const MyHomePage(title: '测试'),
              //路由表
              //此处为静态路由,及界面的入参在创建时就固定了
              routes: <String, WidgetBuilder>{
                '/Login': (BuildContext context) =>  LoginPage(),
                '/Home': (BuildContext context) =>  MainPage(),
                '/PageA': (BuildContext context) =>  const MyPage(title: 'page A'),
                '/PageB': (BuildContext context) =>  const MyPage(title: 'page B'),
                '/BasicContainer': (BuildContext context) => BasicContainerPage(),
                '/BasicAnimationPage': (BuildContext context) => BasicAnimationPage(),
                '/DartBasicPage': (BuildContext context) => DartBasicPage(),
                '/MoreThreadPage': (BuildContext context) => MoreThreadPage(),
                '/BasicTextPage': (BuildContext context) => BasicTextPage(),
                '/BasicImagePage': (BuildContext context) => BasicImagePage(),
                '/ErrorDetailPage': (BuildContext context) => ErrorDetailPage(),
                '/BasicButtonPage': (BuildContext context) => BasicButtonPage(),
                '/BasicSwitchPage': (BuildContext context) => BasicSwitchPage(),
                '/BasicTextFormPage': (BuildContext context) => BasicTextFormPage(),
                '/BasicFormPage': (BuildContext context) => BasicFormPage(),
                '/BasicProgressPage': (BuildContext context) => BasicProgressPage(),
                '/LayoutWidgetPage': (BuildContext context) => LayoutWidgetPage(),
                '/LineLayoutPage': (BuildContext context) => LineLayoutPage(),
                '/SpaceLayoutPage': (BuildContext context) => SpaceLayoutPage(),
                '/WaterLayoutPage': (BuildContext context) => WaterLayoutPage(),
                '/StackLayoutPage': (BuildContext context) => StackLayoutPage(),
                '/AligningLayoutPage': (BuildContext context) => AligningLayoutPage(),
                '/VesselWidgetPage': (BuildContext context) => VesselWidgetPage(),
                '/PaddingWidgetPage': (BuildContext context) => PaddingWidgetPage(),
                '/LimitSizeWidgetPage': (BuildContext context) => LimitSizeWidgetPage(),
                '/TransformWidgetPage': (BuildContext context) => TransformWidgetPage(),
                '/NavWidgetPage': (BuildContext context) => NavWidgetPage(),
                '/ScrollWidgetPage': (BuildContext context) => ScrollWidgetPage(),
                '/SingleChildScrollPage': (BuildContext context) => SingleChildScrollPage(),
                '/ListViewWidgetPage': (BuildContext context) => ListViewWidgetPage(),
                '/GridViewListWidgetPage': (BuildContext context) => GridViewListWidgetPage(),
                '/CustomScrollViewWidgetPage': (BuildContext context) => CustomScrollViewWidgetPage(),
                '/ScrollControllerPage': (BuildContext context) => ScrollControllerPage(),
                '/ScrollListenerPage': (BuildContext context) => ScrollListenerPage(),
                '/FunctionWidgetPage': (BuildContext context) => FunctionWidgetPage(),
                '/NavigationBackHoldPage': (BuildContext context) => NavigationBackHoldPage(),
                '/InheritedWidgetPage': (BuildContext context) => InheritedWidgetPage(),
                '/ProviderWidgetPage': (BuildContext context) => ProviderWidgetPage(),
                '/ProviderTestPage': (BuildContext context) => ProviderTestPage(),
                '/AsyncUIPage': (BuildContext context) =>  AsyncUIPage(),
                '/DialogWidgetPage': (BuildContext context) => DialogWidgetPage(),
                '/EventNotificationPage': (BuildContext context) => EventNotificationPage(),
                '/OriginalEventPage': (BuildContext context) => OriginalEventPage(),
                '/GestureDisposePage': (BuildContext context) => GestureDisposePage(),
                '/EventBusPage': (BuildContext context) => EventBusPage(),
                '/NotificationPage': (BuildContext context) => NotificationPage(),
                '/StateManagerPage': (BuildContext context) => StateManagerPage(),
                '/NormalStateManagerPage': (BuildContext context) => NormalStateManagerPage(),
                '/ProviderTest2Page': (BuildContext context) => ProviderTest2Page(),
                '/LifeCirclePage': (BuildContext context) => LifeCirclePage(),
              },
              //在路由中做一些动态权限，如某些界面需要登录才能访问
              //使用onGenerateRoute时不能使用路由表
//              onGenerateRoute: Application.router.generator,
            )
        ),
        textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom
    );
  }
}

class MyHomePage extends StatefulWidget {
 const  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> startTime() async{
    const Duration duration = Duration(seconds: 1);
    return  Timer(duration, navigationPage);
  }

  Future<void> navigationPage() async {
    //参考链接 https://www.jianshu.com/p/a68e0f55622a
    //跳转到某个界面
    //通过创建的方式
//    Navigator.push(
//        context,
//        MaterialPageRoute(builder: (_) => LoginPage()));
    //跳转到某个界面
    //通过静态路由名字的方式
    Navigator.pushNamed(context, '/Login');
    //跳转到某个界面
    //用跳转的界面替换当前界面
    //通过创建的方式
//    Navigator.pushReplacement(
//        context,
//        MaterialPageRoute(builder: (_) => LoginPage()));
    //跳转到某个界面
    //用跳转的界面替换当前界面
    //通过静态路由名字的方式
//    Navigator.pushReplacementNamed(context, '/Login');
    //跳转到某个页面并移除
    //通过创建的方式
    //移除当前界面
//    Navigator.pushAndRemoveUntil(
//        context,
//        MaterialPageRoute(
//            builder: (_) => LoginPage()),
//            (Route route) => route == null);
    //移除所有界面
//    Navigator.pushAndRemoveUntil(
//        context,
//        MaterialPageRoute(
//            builder: (_) => LoginPage()),
//            (Route route) => false);
    //跳转到某个页面并移除
    //通过静态路由名字的方式
    //移除当前界面
//    Navigator.pushNamedAndRemoveUntil(
//        context, '/Login',
//            (Route route) => route == null);
    //移除所有界面
//    Navigator.pushNamedAndRemoveUntil(
//        context, '/Login',
//            (Route route) =>  false);
  }

  @override
  void initState() {
    // TODO(initState): implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
          color: Colors.white,
          child: const Center(
            child: Text('测试首页'),
          )),
    );
  }

  @override
  void dispose() {
    print('主界面销毁了');
    super.dispose();
  }
}

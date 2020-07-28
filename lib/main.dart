import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pages/basicWidget/basci_container.dart';
import 'package:flutter_app/pages/basicWidget/basic_animation_page.dart';
import 'package:flutter_app/pages/basicWidget/basic_image_page.dart';
import 'package:flutter_app/pages/basicWidget/basic_text_page.dart';
import 'package:flutter_app/pages/login/login_page.dart';
import 'package:flutter_app/pages/main_page.dart';
import 'package:flutter_app/pages/myPagee.dart';
import 'package:flutter_app/pages/other/dart_basic_page.dart';
import 'package:flutter_app/pages/other/error_detail_page.dart';
import 'package:flutter_app/pages/other/more_thead_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:oktoast/oktoast.dart';

//处理Framework异常(弹出红色界面的异常)？
//只能收到本界面的异常?
Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
  print('catch error=');
  print(error);
}

void test(ZoneDelegate parent, Zone zone,String line) async {
  parent.print(zone,'打印日志收集$line');
}

void test2(String line) async {
  print('打印日志收集2:$line');
}

void main() async{

  FlutterError.onError = (FlutterErrorDetails details) async {
//    FlutterError.dumpErrorToConsole(details);
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };

  runZonedGuarded<Future<Null>>(() async {
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
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  if (Platform.isAndroid) {
    //设置状态栏顶部和底部样式
    //很辣鸡，基本用不到
    const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
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
              ),
              darkTheme: ThemeData(
                //暗黑模式
                primarySwatch: Colors.red,
                scaffoldBackgroundColor: Colors.orange,
                hintColor: Colors.blue,
              ),
              home: MyHomePage(title: '测试'),
              //路由表
              //此处为静态路由,及界面的入参在创建时就固定了
              routes: <String, WidgetBuilder>{
                '/Login': (BuildContext context) =>  LoginPage(),
                '/Home': (BuildContext context) =>  MainPage(),
                '/PageA': (BuildContext context) =>  MyPage(title: 'page A'),
                '/PageB': (BuildContext context) =>  MyPage(title: 'page B'),
                '/BasicContainer': (BuildContext context) => BasicContainerPage(),
                '/BasicAnimationPage': (BuildContext context) => BasicAnimationPage(),
                '/DartBasicPage': (BuildContext context) => DartBasicPage(),
                '/MoreThreadPage': (BuildContext context) => MoreThreadPage(),
                '/BasicTextPage': (BuildContext context) => BasicTextPage(),
                '/BasicImagePage': (BuildContext context) => BasicImagePage(),
                '/ErrorDetailPage': (BuildContext context) => ErrorDetailPage(),
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
    Duration  duration = const Duration(seconds: 1);
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
    // TODO: implement dispose
    print('主界面销毁了');
    super.dispose();
  }
}

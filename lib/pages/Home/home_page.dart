import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/common/toast.dart';

import '../data_oper_page.dart';
import 'basicWidget/basic_widget_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage>{
  var  listData = [
    'Dart基础',
    '常用组件',
    '布局类组件',
    '测试chanel',
    '向原生ios弹框传值',
    '数据库操作',
    '多线程',
    '异常处理'
  ];
  static const MethodChannel platform =  MethodChannel('samples.flutter.io/battery');
  static const EventChannel eventChannel =  EventChannel('com.meetyou.flutter/event');
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = '当前电量 $result %';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    Toast.show(batteryLevel);
  }

  Future <void> _showIosAlert() async {
    try {
      final String result = await platform.invokeMethod('showIosAlert',{'tipTitle':'提示','message':'按一下','cancelTitle':'取消','ensureTitle':'确定'});
      print(result);
    } on PlatformException {
      Toast.show('调用出错了');
    }
  }

  //接收activity传递来的参数obj
  void _onEvent(Object event){
    print(event);
  }

  void _onError(Object error){
    print(error);
  }

  @override
  void initState() {
    // TODO(initState): implement initState
    super.initState();
    eventChannel
        .receiveBroadcastStream().listen((Object event) {
          _onEvent(event);
          },
        onError: (Object error) {
          _onError(error);
          },
        cancelOnError: true);
  }

  @override
  void dispose() {
    // TODO(dispose): implement dispose
    print('首页被销毁');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO(build): implement build
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title:const Text(
            '首页',
          ),
          actions: <Widget>[
            IconButton(
                icon:const Icon(Icons.add),
                onPressed: () {
                  Navigator.pushNamed(context, '/PageA');
                })
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              child: ListView.builder(
                  itemCount: listData.length,
                  itemBuilder: (BuildContext context,int index) {
                    final String title = listData[index].toString();
                    return InkWell(
                      onTap: (){
                       if(title == '常用组件') {
                         Navigator.push<void>(
                             context,
                             MaterialPageRoute<BasicWidgetPage>(builder: (BuildContext context)=>
                                 BasicWidgetPage()
                             )
                         );
                       } else if (title == '测试chanel') {
                         _getBatteryLevel();
                       } else if (title == '向原生ios弹框传值') {
                         _showIosAlert();
                       } else if (title == '数据库操作') {
                         Navigator.push<void>(
                             context,
                             MaterialPageRoute<DateOperatePage>(builder: (BuildContext context)=>
                                 DateOperatePage()
                             )
                         );
                       } else if (title == 'Dart基础') {
                         Navigator.pushNamed(context, '/DartBasicPage');
                       } else if (title == '多线程') {
                         Navigator.pushNamed(context, '/MoreThreadPage');
                       } else if (title == '异常处理') {
                         Navigator.pushNamed(context, '/ErrorDetailPage');
                       } else if(title == '布局类组件') {
                         Navigator.pushNamed(context, '/LayoutWidgetPage');
                       }
                      },
                      child: Container(
                        height: 53,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 52,
                              width: double.infinity,
                              alignment: Alignment(-1, 0),
                              child: Text(
                                listData[index].toString(),
                              ),
                            ),
                            const Divider(
                              height: 1,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

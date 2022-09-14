import 'package:flutter/material.dart';

class MoreThreadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MoreThreadPageState();
  }
}

class MoreThreadPageState extends State<MoreThreadPage> {
  Future<String> testWidgetTwo(String title) async {
    Future.delayed(Duration(seconds: 3),(){
//      var dataList = ['1','2','3'];
//      print(dataList[3]);
      print('第二个函数$title');
    }).then((value){
      ///then用于在future处理完异步操作后进行后续操作
      ///因为then主要目的是在future完成异步操作的时候再来处理value从而避免阻塞
      ///而await直接暴力的阻塞当前线程来等待future的完成
      ///可见使用await的方法并不适合添加then方法
      ///多个then操作顺序执行
      ///then会在异步操作执行完毕之后执行
      print('>>>>>>$value');
    }).then((value) {
      print('测试多个then操作');
    }).catchError((value){
      ///处理失败的请求
      print('错误');
    });
    return title;
  }

  Future<String> testWidgetThere(String title) async{
    await Future.delayed(Duration(seconds: 3),(){
//      var dataList = ['1','2','3'];
//      print(dataList[3]);
      print('第三个函数$title');
    });
    return title;
  }

  Future<String> testWidgetFour(String title) async{
    Future.delayed(Duration(seconds: 3),(){
//      var dataList = ['1','2','3'];
//      print(dataList[3]);
      print('第四个函数$title');
    });
    return title;
  }

  //调用该方法时会进入方法内部同步(顺序)执行代码
  Future<void> testWidget([int type]) async {
    type = type ?? 0;
    //这里使用了await会停止async内部的代码执行,但不会影响该方法外部的代码执行
   if (type == 0) {
     final title = await testWidgetTwo('123');
     print('这是第一个函数$title');
   }else if (type == 1){
     final title = await testWidgetThere('321');
     print('这是第一个函数$title');
   }else {
     final title = await testWidgetFour('231');
     print('这是第一个函数$title');
   }
   print('999');
  }

  Future<String> testAsync(String title) async {
    return title;
  }

  Future<Null> testAsync2() async {
    print('kkkk');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('多线程操作'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 44,
                child: TextButton(
                    onPressed: () {
                      testWidget(0);
                      print('888');
                }, child: Text('点击1')),
              ),
              Divider(),
              Container(
                width: double.infinity,
                height: 44,
                child: TextButton(
                    onPressed: (){
                      testWidget(2);
                    },
                    child: Text('点击2')),
              ),
              Divider(),
              Container(
                width: double.infinity,
                height: 44,
                child: TextButton(
                    onPressed: (){
                      testWidget(1);
                    },
                    child: Text('点击3')),
              ),
              Divider(),
              Container(
                width: double.infinity,
                height: 44,
                child: TextButton(
                    onPressed: (){
                      testAsync('测试异步').then((value){
                        print('对异步请求结果的回调内容:$value');
                      });
                    },
                    child: Text('点击4')),
              ),
              Divider(),
              Container(
                width: double.infinity,
                height: 44,
                child: TextButton(
                    onPressed: (){
                      testAsync2().then((value){
                        print('测试无返回值的异步操作结果:$value');
                      });
                    },
                    child: Text('点击5')),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('界面卸载');
  }
}
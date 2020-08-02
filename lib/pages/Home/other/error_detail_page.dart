import 'package:flutter/material.dart';

class ErrorDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ErrorDetailPageState();
  }
}

class ErrorDetailPageState extends State<ErrorDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('异常处理'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  onPressed: (){
                    //使用try-catch捕获同步异常
                    try {
                      final List<String> dataList = <String>['1','2'];
                      print(dataList[2]);
                    }catch(e) {
                      print('出了错误');
                      print(e);
                    }
                  },
                  child: const Text('捕获同步异常')
              ),
              FlatButton(
                  onPressed: (){
                    // ignore: always_specify_types
                    Future.delayed(
                        const Duration(seconds: 1), (){
                          final List<String> dataList = <String>['1','2'];
                          print(dataList[2]);
                        })
                        .then((Object value){})
                        .catchError((dynamic e){
                          print('异步错误');
                          print(e);
                    });
                  },
                  child: const Text('捕获异步异常')
              ),
              FlatButton(
                  onPressed: (){
                    final List<String> dataList = <String>['1','2'];
                    print(dataList[2]);
                  },
                  child: const Text('测试全局异常')
              )
            ],
          ),
        ),
      ),
    );
  }
}
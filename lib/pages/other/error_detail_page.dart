import 'package:flutter/material.dart';

class ErrorDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ErrorDetailPageState();
  }
}

class ErrorDetailPageState extends State<ErrorDetailPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('异常处理'),
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
                      final List<String> dataList = ['1','2'];
                      print(dataList[2]);
                    }catch(e) {
                      print('出了错误');
                      print(e);
                    }
                  },
                  child: Text('捕获同步异常')
              ),
              FlatButton(
                  onPressed: (){
                    Future.delayed(
                        Duration(seconds: 1), (){
                          final List<String> dataList = ['1','2'];
                          print(dataList[2]);
                        })
                        .then((value){})
                        .catchError((e){
                          print('异步错误');
                          print(e);
                    });
                  },
                  child: Text('捕获异步异常')
              ),
              FlatButton(
                  onPressed: (){
                    final List<String> dataList = ['1','2'];
                    print(dataList[2]);
                  },
                  child: Text('测试全局异常')
              )
            ],
          ),
        ),
      ),
    );
  }
}
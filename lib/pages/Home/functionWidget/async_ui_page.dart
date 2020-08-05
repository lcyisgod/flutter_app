import 'package:flutter/material.dart';

class AsyncUIPage extends StatelessWidget {
  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 3),(){
      return '我是从互联网上获取的数据';
    });
  }

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder和StreamBuilder'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Wrap(
                    children: <Widget>[
                      Text('FutureBuilder、StreamBuilder都是异步请求的方式。使用这两者可以不通过StatefulWidget完成异步请求')
                    ],
                  ),
                  Divider(
                    height: 1,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 45),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment(0, 0),
                      child: Text('测试FutureBuidler'),
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  FutureBuilder(
                      //异步请求的操作
                      future: mockNetworkData(),
                      //初始数据
                      initialData: '999',
                      //请求完毕后的操作
                      builder: (BuildContext context,AsyncSnapshot snapshot){
                        if(snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return Text('Error:${snapshot.error}');
                          }else {
                            return Text('Connents:${snapshot.data}');
                          }
                        }else {
                          return CircularProgressIndicator();
                        }
                      }),
                  Divider(
                    height: 1,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 45),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment(0, 0),
                      child: Text('测试StreamBuidler,可以接收多个异步事件'),
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  StreamBuilder(
                      stream: counter(),
                      builder: (BuildContext context,AsyncSnapshot<int> snapshot){
                        if (snapshot.hasError) {
                          return Text('Error:${snapshot.error}');
                        }else {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return Text('没有Stream');
                            case ConnectionState.waiting:
                              return Text('等待数据');
                            case ConnectionState.active:
                              return Text('active: ${snapshot.data}');
                            case ConnectionState.done:
                              return Text('Stream已关闭');
                          }
                          return Text('这是一个测试');
                        }
                  })
                ],
              ),
            ),
          )
      ),
    );
  }

}

//class AsyncUIPageState extends State<AsyncUIPage> {
//  Future<String> mockNetworkData() async {
//    return Future.delayed(Duration(seconds: 3),(){
//      return '我是从互联网上获取的数据';
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('FutureBuilder和StreamBuilder'),
//        centerTitle: true,
//      ),
//      body: SafeArea(
//          child: Center(
//            child: Column(
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                Wrap(
//                  children: <Widget>[
//                    Text('FutureBuilder、StreamBuilder都是异步请求的方式。使用这两者可以不通过StatefulWidget完成异步请求')
//                  ],
//                ),
//                Divider(
//                  height: 1,
//                ),
//                FutureBuilder(
//                  //异步请求的操作
//                    future: mockNetworkData(),
//                    //请求完毕后的操作
//                    builder: (BuildContext context,AsyncSnapshot snapshot){
//                      if(snapshot.connectionState == ConnectionState.done) {
//                        if (snapshot.hasError) {
//                          return Text('Error:${snapshot.error}');
//                        }else {
//                          return Text('Connents:${snapshot.data}');
//                        }
//                      }else {
//                        return CircularProgressIndicator();
//                      }
//                    })
//              ],
//            ),
//          )
//      ),
//    );
//  }
//}
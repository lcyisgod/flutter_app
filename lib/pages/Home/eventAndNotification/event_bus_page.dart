import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Home/eventAndNotification/event_two_page.dart';

import 'event_page.dart';

class EventBusPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EventBusPageState();
  }
}

class EventBusPageState extends State<EventBusPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bus.on('login', (arg) {
      print('接受到登录事件');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('全局事物总线'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context){
                    return EventTwoPage();
                  })
              );
            },
            child: Text('下一个'),
          )
        ],
      ),
      body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                Text('跨界面传值的方式,类似与iOS的通知'),
                Text('不好意思,这又是一个有bug的例子')
              ],
            ),
          )
      ),
    );
  }
}
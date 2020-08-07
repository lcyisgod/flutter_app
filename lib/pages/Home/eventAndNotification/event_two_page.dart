import 'package:flutter/material.dart';

import 'event_page.dart';

class EventTwoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EventTwoPageState();
  }
}

class EventTwoPageState extends State<EventTwoPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('事物总线测试'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: FlatButton(
              onPressed: (){
                bus.emit('login');
              }, 
              child: Text('传递登录事件')
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class NavigationBackHoldPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NavigationBackHoldPageState();
  }
}

class NavigationBackHoldPageState extends State<NavigationBackHoldPage> {
  DateTime _lastPressedAt; //上次点击时间
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text('导航返回拦截'),
            centerTitle: true,
          ),
          body: SafeArea(
              child: Wrap(
                children: <Widget>[
                  Text('WillPopScope用于拦截用户点击返回按钮时的操作,在安卓上对物理返回按键也可以拦截。返回true时可以返回上一级,false禁止返回'),
                ],
              )
          ),
        ),
        onWillPop: () async {
          if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
            //两次点击超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        }
    );
  }
}
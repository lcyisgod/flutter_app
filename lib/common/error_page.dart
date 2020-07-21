import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
       title: Text("错误界面"),
      ),
      body: new Center(
        child: new Container(
          color: Colors.white,
          child: new Text("哎呀，出错了"),
        ),
      ),
    );
  }
}
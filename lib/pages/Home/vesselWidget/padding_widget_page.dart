import 'package:flutter/material.dart';

class PaddingWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Padding'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('左边留白8像素'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("上下各添加8像素补白"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,20.0),
                child: Container(
                  color: Colors.red,
                  child: Text("分别指定四个方向的补白"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
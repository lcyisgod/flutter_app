import 'package:flutter/material.dart';

class SingleChildScrollPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SingleChildScrollPageState();
  }
}

class SingleChildScrollPageState extends State<SingleChildScrollPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollPage'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Wrap(
                    children: <Widget>[
                      Text('SingleChildScrollView可以让它的子控件具有滚动效果;同时该组件不支持延迟加载,适用于内容不超出屏幕过多的情况下')
                    ],
                  ),
                  Container(
                    height: 800,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('请向下滑动'),
                        Text('请向上滑动')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
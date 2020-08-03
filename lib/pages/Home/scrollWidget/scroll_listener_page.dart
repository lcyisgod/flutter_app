import 'package:flutter/material.dart';

class ScrollListenerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScrollListenerPageState();
  }
}

class ScrollListenerPageState extends State<ScrollListenerPage> {
  String _progress = "0%"; //保存进度百分比
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动监听'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 45
                ),
                child: Container(
                  alignment: Alignment(0, 0),
                  child: Text('Scrollbar用于获取滚动通知'),
                ),
              ),
              Divider(
                height: 1,
              ),
              Expanded(
                  child: Scrollbar(//进度条
                      child: NotificationListener<ScrollNotification>(//监听滚动通知
                          onNotification: (ScrollNotification notification){
                            double progress = notification.metrics.pixels/notification.metrics.maxScrollExtent;
                            setState(() {
                              _progress = '${(progress * 100).toInt()}%';
                            });
                            return false;
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              ListView.builder(
                                itemCount: 100,
                                itemExtent: 50.0,
                                itemBuilder: (BuildContext context,int index) {
                                  return ListTile(title: Text('$index'));
                                },
                              ),
                              CircleAvatar(
                                radius: 30.0,
                                child: Text(_progress),
                                backgroundColor: Colors.black54,
                              )
                            ],
                          )
                      )
                  ))
            ],
          )
      ),
    );
  }
}

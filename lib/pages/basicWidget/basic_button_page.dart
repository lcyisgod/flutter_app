import 'package:flutter/material.dart';

class BasicButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('按钮'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 44,
                alignment: Alignment(0, 0),
                child: RaisedButton(
                    onPressed: (){
                      print('点击了RaisedButton');
                    },
                  child: Text('RaisedButton'),
                    ),
              ),
              Divider(),
              Container(
                width: double.infinity,
                height: 44,
                alignment: Alignment(0, 0),
                child: FlatButton(
                  onPressed: (){
                    print('点击了FlatButton');
                  },
                  child: Text('FlatButton'),
                ),
              ),
              Divider(),
              Container(
                width: double.infinity,
                height: 44,
                alignment: Alignment(0, 0),
                child: OutlineButton(
                  onPressed: (){
                    print('点击了OutlineButton');
                  },
                  child: Text('OutlineButton'),
                ),
              ),
              Divider(),
              Container(
                width: double.infinity,
                height: 44,
                alignment: Alignment(0, 0),
                //IconButton是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
                child: IconButton(
                  onPressed: (){
                    print('点击了IconButton');
                  },
                  icon: Icon(Icons.thumb_up),
                ),
              ),
              Divider(),
              Container(
                width: double.infinity,
                height: 44,
                alignment: Alignment(0, 0),
                //RaisedButton、FlatButton、OutlineButton都有一个icon 构造函数
                //通过它可以轻松创建带图标的按钮
                child: FlatButton.icon(
                    onPressed: (){
                      print('点击了警告');
                    },
                    icon: Icon(Icons.warning),
                    label: Text('警告')
                ),
              ),
              Divider(),
              Container(
                width: double.infinity,
                height: 44,
                alignment: Alignment(0, 0),
                //自定义按钮样式
                child: FlatButton(
                    textColor: Colors.white,
                    //背景色
                    //透明背景色Color(0x000000)
                    color: Colors.blue,
                    //按下时的背景色
                    highlightColor: Colors.blue[700],
                    //按钮主题
                    colorBrightness: Brightness.dark,
                    //水波纹颜色
                    //可以通过设置水波纹颜色透明来去除水波纹
                    splashColor: Colors.grey,
                    //外形
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    onPressed: (){
                      print('自定义按钮');
                    },
                    child: Text('自定义按钮')),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
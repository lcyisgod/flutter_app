import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/toast.dart';

import 'webview_page.dart';

class BasicTextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BasicTextPageState();
  }
}

class BasicTextPageState extends State<BasicTextPage> {
  final String richTextStr = '这是一段特俗的文字，其中有一段是链接，所以你知道该怎么处理嘛';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
    print('路由参数为$args');
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('文本'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                   width: double.infinity,
                   alignment: Alignment(0, 0),
                   child:  Text(
                     '这是一段普通文本',
                     textAlign: TextAlign.center,
                     //主要是用于系统字体大小设置改变时对Flutter应用字体进行全局调整
                     textScaleFactor: 1.0,
                     style: TextStyle(
                       color: Colors.red,
                       //该属性用于指定行高
                       //但它并不是一个绝对值，而是一个因子
                       //具体的行高等于fontSize*height。
                       height: 1.2,
                       //fontSize通常用于单个文本，字体大小不会跟随系统字体大小变化
                       fontSize: 12,
                     ),
                   ),
                  ),
                  Divider(),
                  Container(
                    width: double.infinity,
                    alignment: Alignment(0, 0),
                    height: 44,
                    child:  Text(
                      '下面是一段富文本',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(),
                  Container(
                    width: double.infinity,
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '登陆即同意',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                          children: [
                            TextSpan(
                              text: '服务条款',
                              style: TextStyle(fontSize: 14, color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                   var obj = Navigator.push<void>(
                                       context,
                                       MaterialPageRoute<WebViewPage>(
                                          builder: (context){
                                            return WebViewPage(
                                              title: '网页',
                                              baseUrl: 'https://www.baidu.com',
                                            );
                                          },
                                      )
                                   ).then((dynamic value){//界面在返回之后调用该方法
                                     print('界面返回了');
                                   });
                                   obj.then((value) {
                                     print('返回值是$value');
                                   });
                                },
                            ),
                            TextSpan(
                              text: '和',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            TextSpan(
                              text: '隐私政策',
                              style: TextStyle(fontSize: 14, color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Toast.show('点击了隐私政策');
                                },
                            )
                          ]
                        )
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
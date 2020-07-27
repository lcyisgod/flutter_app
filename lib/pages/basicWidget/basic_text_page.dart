import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/toast.dart';
import 'package:flutter_app/pages/basicWidget/webview_page.dart';

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
                   height: 44,
                   child:  Text(
                       '这是一段普通文本',
                     textAlign: TextAlign.center,
                   ),
                  ),
                  Divider(),
                  Container(
                    width: double.infinity,
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
import 'package:flutter/material.dart';
import 'package:flutter_app/common/toast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    Key key,
    this.baseUrl = '',
    this.title = '',
  }) :super(key: key);

  final String baseUrl;
  final String title;
  @override
  State<StatefulWidget> createState() {
    return WebViewPageState();
  }
}

class WebViewPageState extends State<WebViewPage> {
  WebViewController _controller;
  String centerTitle;
  List<JavascriptChannel> javaChannelList;

  void createJavaChannel() {
    javaChannelList = <JavascriptChannel>[];
    final JavascriptChannel shareChannel = JavascriptChannel(
      name: 'share',
      onMessageReceived: (JavascriptMessage message){
        print('参数为:${message.message}');
      }
    );

    javaChannelList.add(shareChannel);
  }

  @override
  void initState() {
    super.initState();
    centerTitle = widget.title;
    createJavaChannel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text(centerTitle??''),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
              onPressed: (){
                //会存储Widget树的状态,并在控制台打印输出
//                debugDumpApp();
                Navigator.pop(context);
              },
              child: const Text('返回'))
        ],
      ),
      body: WebView(
        initialUrl: widget.baseUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller){
          Toast.show('网页创建完成');
          //获取网页控制器
          _controller = controller;
        },
        onPageStarted: (String url){
          EasyLoading.show();
        },
        onPageFinished: (String url) {
          EasyLoading.dismiss();
          Toast.show('加载完成');
          _controller.runJavascript('document.title')
              .then((value) => {

          });
        },
        onWebResourceError: (dynamic error) {
          EasyLoading.dismiss();
          print('错误原因是$error');
        },
        //类似于往JS中注册方法，这些方法名要和web端约定好
        //Js向flutter传递参数
        javascriptChannels:javaChannelList.toSet(),
        //拦截js方法，实现调用flutter
        //类似于重定位？
        navigationDelegate: (NavigationRequest request){
          //对于需要拦截的操作，做判断
          if(request.url.contains('baidu')){
            print('即将打开 ${request.url}');
            return NavigationDecision.navigate;
//            return NavigationDecision.prevent;
          }
          //不需要拦截的操作
          return NavigationDecision.navigate;
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.clearCache();
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Widget/action_item_widget.dart';

class FunctionWidgetPage extends StatelessWidget {

  final List<String> dataList = <String>['导航返回拦截','数据共享','状态管理','异步更新UI','对话框'];

  void clickEvent(BuildContext context, String title) {
    if (title == '导航返回拦截') {
      Navigator.pushNamed(context, '/NavigationBackHoldPage');
    } else if (title == '数据共享') {
      Navigator.pushNamed(context, '/InheritedWidgetPage');
    } else if (title == '状态管理') {
      Navigator.pushNamed(context, '/StateManagerPage');
    } else if (title == '异步更新UI') {
      Navigator.pushNamed(context, '/AsyncUIPage');
    } else if (title == '对话框') {
      Navigator.pushNamed(context, '/DialogWidgetPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('功能型组件'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
              itemExtent: 53,
              itemCount: dataList.length,
              itemBuilder: (BuildContext context,int index) {
              final String title = dataList[index];
                return ActionItemWidget(
                  title: title,
                  onPressed: (String title) {
                    clickEvent(context, title);
                  },
                );
              }
          ),
        ),
      ),
    );
  }
}
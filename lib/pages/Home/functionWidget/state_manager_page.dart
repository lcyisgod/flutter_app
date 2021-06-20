import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Widget/action_item_widget.dart';

class StateManagerPage extends StatelessWidget {
  final List<String> dataList = <String>['简单状态管理','跨组件状态共享'];

  void clickEvent(BuildContext context, String title) {
    if (title == '简单状态管理') {
      Navigator.pushNamed(context, '/NormalStateManagerPage');
    } else if (title == '跨组件状态共享') {
      Navigator.pushNamed(context, '/ProviderWidgetPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('状态管理'),
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
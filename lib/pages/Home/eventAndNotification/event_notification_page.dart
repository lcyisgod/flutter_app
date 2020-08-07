import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Widget/action_item_widget.dart';

class EventNotificationPage extends StatelessWidget {
  final List<String> dataList = ['原始指针事件处理','手势识别','事件总线'];

  void clickEvent(BuildContext context,String title) {
    if (title == '原始指针事件处理') {
      Navigator.pushNamed(context, '/OriginalEventPage');
    } else if (title == '手势识别') {
      Navigator.pushNamed(context, '/GestureDisposePage');
    } else if (title == '事件总线') {
      Navigator.pushNamed(context, '/EventBusPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('事件处理与通知'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
            child: ListView.builder(
                itemExtent: 53,
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int index){
                  final String title = dataList[index];
                  return ActionItemWidget(
                    title: title,
                    onPressed: (String value) {
                      clickEvent(context, value);
                    },
                  );
                }),
          )
      ),
    );
  }
}
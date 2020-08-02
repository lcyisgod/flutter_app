import 'package:flutter/material.dart';

class BasicWidgetPage extends StatelessWidget{
  final List<String> dataList = <String>['Container','按钮','文本','图片','单选开关和复选框','输入框','表单','进度指示器','动画组件'];

  void clickEvent(BuildContext context, String title) {
    if (title == 'Container') {
      Navigator.pushNamed(context, '/BasicContainer');
    }else if (title == '动画组件') {
      Navigator.pushNamed(context, '/BasicAnimationPage');
    }else if (title == '文本') {
      //通过命名路由传递参数
      Navigator.pushNamed(context, '/BasicTextPage', arguments: 'hi');
    }else if (title == '图片') {
      Navigator.pushNamed(context, '/BasicImagePage');
    }else if (title == '按钮') {
      Navigator.pushNamed(context, '/BasicButtonPage');
    }else if (title == '单选开关和复选框') {
      Navigator.pushNamed(context, '/BasicSwitchPage');
    }else if (title == '输入框') {
      Navigator.pushNamed(context, '/BasicTextFormPage');
    }else if (title == '表单') {
      Navigator.pushNamed(context, '/BasicFormPage');
    }else if (title == '进度指示器') {
      Navigator.pushNamed(context, '/BasicProgressPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('基础组件'),
        centerTitle: true,
      ),
      body: Center(
        child: SafeArea(
          child: Container(
            child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (BuildContext context,int index){
                  final String title = dataList[index];
                  return InkWell(
                    onTap: (){
                      clickEvent(context, title);
                      },
                    child: Container(
                      height: 45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 44,
                            width: double.infinity,
                            alignment: const Alignment(-1, 0),
                            child: Text(title),
                          ),
                          const Divider(
                            height: 1,
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
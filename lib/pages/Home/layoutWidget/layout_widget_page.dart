import 'package:flutter/material.dart';

class LayoutWidgetPage extends StatelessWidget {
  final List<String> dataList = ['线性布局','弹性布局','流式布局','层叠布局','对齐与相对定位'];

  void clickEvent(BuildContext context, String title) {
    if (title == '线性布局') {
      Navigator.pushNamed(context, '/LineLayoutPage');
    } else if (title == '弹性布局') {
      Navigator.pushNamed(context, '/SpaceLayoutPage');
    } else if (title == '流式布局') {
      Navigator.pushNamed(context, '/WaterLayoutPage');
    } else if (title == '层叠布局') {
      Navigator.pushNamed(context, '/StackLayoutPage');
    } else if (title == '对齐与相对定位') {
      Navigator.pushNamed(context, '/AligningLayoutPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('布局组件'),
        centerTitle: true,
      ),
      body: Center(
        child: SafeArea(
            child: Container(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  final String title = dataList[index];
                  return InkWell(
                    splashColor: Color(0x00000000),
                    onTap: (){
                      clickEvent(context, title);
                    },
                    child: Container(
                      height: 45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            height: 44,
                            width: double.infinity,
                            alignment: Alignment(-1, 0),
                            child: Text(title),
                          ),
                          Divider(
                            height: 1,
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: dataList.length,),
            )
        ),
      ),
    );
  }
}
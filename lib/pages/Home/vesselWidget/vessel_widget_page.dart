import 'package:flutter/material.dart';


class VesselWidgetPage extends StatelessWidget {
  final List<String> dataList = ['Padding','尺寸限制类容器','变换','导航相关'];

  void jumpToPage(BuildContext context,String title) {
    if (title == 'Padding') {
      Navigator.pushNamed(context, '/PaddingWidgetPage');
    } else if (title == '尺寸限制类容器') {
      Navigator.pushNamed(context, '/LimitSizeWidgetPage');
    } else if (title == '变换') {
      Navigator.pushNamed(context, '/TransformWidgetPage');
    } else if (title == '导航相关') {
      Navigator.pushNamed(context, '/NavWidgetPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('容器类组件'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index){
                final String title = dataList[index];
                return InkWell(
                  onTap: (){
                    jumpToPage(context, title);
                  },
                  child: Container(
                    height: 53,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 52,
                          alignment: Alignment(-1, 0),
                          child: Text(title),
                        ),
                        const Divider(
                          height: 1,
                        )
                      ],
                    ),
                  ),
                );},
              itemCount: dataList.length,),
          )),
    );
  }
}
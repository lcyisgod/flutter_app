import 'package:flutter/material.dart';

class ListViewWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListViewWidgetPageState();
  }
}

class ListViewWidgetPageState extends State<ListViewWidgetPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          //ListView.separated可以在item下构造一个下划线
          //可参考ScrollWidgetPage构造代码
          child:  ListView.builder(
            //指定item数量
              itemCount: 10,
              //如果这个值不为空,则表示滚动方向上子组件(item)的长度
              //垂直方向上代表宽度
              itemExtent: 45,
              //是否根据子组件的长度来设置ListView的总长度
              //默认为false，让ListView尽可能的在滚动方向上占用占用空间
              //如果是在没有边界的容器中，必须为true
              shrinkWrap: false,
              //是否将子控件包裹在AutomaticKeepAlive组件中
              //如果选择是则子组件在滑出屏幕时不会被GC(回收)
              addAutomaticKeepAlives: true,
              //是否将子控件包裹在RepaintBoundary组件中
              //如果选择是则子组件在进入屏幕时会重绘
              //如果组件比较简单，可以选择false
              addRepaintBoundaries: true,
              //创建Item(iOS中的Cell)
              itemBuilder: (BuildContext context,int index){
                return Container(
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 44,
                        alignment: Alignment(0, 0),
                        child: Text('$index'),
                      ),
                      Divider(
                        height: 1,
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
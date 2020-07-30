import 'package:flutter/material.dart';

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    // TODO: implement paintChildren
    var x = margin.left;
    var y = margin.top;
    print('context的宽度');
    print(context.size.width);
    //计算每一个子Widget的位置
    for (int i = 0; i < context.childCount; i++) {
      print('子组件的宽度');
      print(context.getChildSize(i).width);
      var w = context.getChildSize(i).width + x + margin.right;
      print('子组件的最右侧坐标');
      print(w);
      if (w < context.size.width) {
        context.paintChild(
            i,
            transform: Matrix4.translationValues(x,y,0.0)
        );
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + y + margin.bottom;
        //绘制子Widget
        context.paintChild(
            i,
            transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定FLow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class WaterLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('流式布局'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  height: 44,
                  child: Text(
                      'Flutter中通过Wrap和Flow来支持流式布局,流式布局在超出范围后会自动折行'
                  ),
                ),
                Divider(),
                //可以理解为可以折行的的Row
                Container(
                  color: Colors.blueAccent,
                  width: double.infinity,
                  child: Wrap(
                    //主轴(水平)方向间距
                    spacing: 8.0,
                    //纵轴（垂直）方向间距
                    runSpacing: 4.0,
                    //沿主轴方向居中
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      Chip(
                        label: Text('Hamilton'),
                        avatar: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text('A'),
                        ),
                      ),
                      Chip(
                        label: Text('Lafayette'),
                        avatar: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text('M'),
                        ),
                      ),
                      Chip(
                        label: Text('Mulligan'),
                        avatar: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text('H'),
                        ),
                      ),
                      Chip(
                        label: Text('Laurens'),
                        avatar: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text('J'),
                        ),
                      ),
                    ],
                  ),
                ),
                //用Row做对比
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Chip(
//                      label: Text('Hamilton'),
//                      avatar: CircleAvatar(
//                        backgroundColor: Colors.blue,
//                        child: Text('A'),
//                      ),
//                    ),
//                    Chip(
//                      label: Text('Lafayette'),
//                      avatar: CircleAvatar(
//                        backgroundColor: Colors.blue,
//                        child: Text('M'),
//                      ),
//                    ),
//                    Chip(
//                      label: Text('Mulligan'),
//                      avatar: CircleAvatar(
//                        backgroundColor: Colors.blue,
//                        child: Text('H'),
//                      ),
//                    ),
//                    Chip(
//                      label: Text('Laurens'),
//                      avatar: CircleAvatar(
//                        backgroundColor: Colors.blue,
//                        child: Text('J'),
//                      ),
//                    ),
//                  ],
//                )
              //调整子组件的位置
                Container(
                  color: Colors.blueGrey,
                  child:  Flow(
                    delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
                    children: <Widget>[
                      Container(width: 80.0,height: 80.0,color: Colors.red,),
                      Container(width: 80.0,height: 80.0,color: Colors.green,),
                      Container(width: 80.0,height: 80.0,color: Colors.blue,),
                      Container(width: 80.0,height: 80.0,color: Colors.yellow,),
                      Container(width: 80.0,height: 80.0,color: Colors.blueAccent,),
                      Container(width: 80.0,height: 80.0,color: Colors.purple,),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
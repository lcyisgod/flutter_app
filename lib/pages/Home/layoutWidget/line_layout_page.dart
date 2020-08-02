import 'package:flutter/material.dart';

class LineLayoutPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('线性布局'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 45,
                child: Row(
                  //水平方向子组件的布局顺序
                  textDirection: TextDirection.ltr,
                  //在主轴方向上所占用的空间
                  //默认占满
                  mainAxisSize: MainAxisSize.max,
                  //主轴方向子组件的布局方式
                  //若果mainAxisSize为min则这个参数没有意义
                  //具体可参考Api
                  mainAxisAlignment: MainAxisAlignment.start,
                  //表示Row纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下
                  verticalDirection: VerticalDirection.down,
                  //表示子组件在纵轴方向的对齐方式
                  //该参数受verticalDirection参数影响
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const Text('第一行第一列'),
                    Container(
                      width: 10,
                    ),
                    const Text('第一行第二列')
                  ],
                  //
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
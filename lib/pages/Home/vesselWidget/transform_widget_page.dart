import 'dart:math' as math;

import 'package:flutter/material.dart';

class TransformWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('变换组件部分用法'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 5.0,right: 5.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Wrap(
                      children: <Widget>[
                        Text('Transform可以在其子组件绘制时对其应用一些矩阵变换来实现一些特效。Matrix4是一个4D矩阵，通过它我们可以实现各种矩阵操作'),
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    Container(
                      color: Colors.black,
                      child: Transform(
                        //沿Y轴倾斜0.1弧度
                        transform: Matrix4.skewY(0.1),
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.deepOrange,
                          child: const Text('沿Y轴倾斜0.1弧度'),
                        ),
                      ),
                    ),
                    Divider(
                      height: 30,
                    ),
                    Container(
                      color: Colors.black,
                      child: Transform(
                        //沿X轴倾斜0.1弧度
                        transform: Matrix4.skewX(0.1),
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.deepOrange,
                          child: const Text('沿X轴倾斜0.1弧度'),
                        ),
                      ),
                    ),
                    Divider(
                      height: 30,
                    ),
                    //平移
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.red
                      ),
                      //Transform.translate接收一个offset参数，可以在绘制时沿x、y轴对子组件平移指定的距离
                      child: Transform.translate(
                        offset: Offset(-20.0, -5.0),
                        child: Text('Hellow world'),
                      ),
                    ),
                    Divider(
                      height: 30,
                    ),
                    //旋转
                    DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Transform.rotate(
                        angle: math.pi/2 ,
                        child: Text('旋转90度'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
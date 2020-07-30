import 'package:flutter/material.dart';

class AligningLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('对齐和相对定位'),
      ),
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 44,
                  width: double.infinity,
                  //Alignment继承自AlignmentGeometry，
                  //表示矩形内的一个点，他有两个属性x、y，分别表示在水平和垂直方向的偏移
                  alignment: Alignment(0, 0),
                  child: Text('Align布局'),
                ),
                Divider(),
                Container(
                  height: 120,
                  width: 120,
                  color: Colors.blue[50],
                  child: Align(
                    //子组件在父组件中的起始位
                    alignment: Alignment.center,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Divider(),
                Container(
                  color: Colors.blue[50],
                  child: Align(
                    //用于确定Align本身的宽高属性
                    //是一个系数，需要乘子组件尺寸才是Align本身的尺寸
                    //如果要这个系数生效，则Align的父组件不能有尺寸
                    widthFactor: 1.5,
                    heightFactor: 1.5,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Divider(),
                Container(
                  height: 44,
                  width: double.infinity,
                  alignment: Alignment(0, 0),
                  child: Text('FractionalOffset'),
                ),
                Divider(),
                Container(
                  height: 120,
                  width: 120,
                  color: Colors.blue[50],
                  child: Align(
                    //FractionalOffset起始点为(0,0)
                    //实际偏移 = (FractionalOffset.x * childWidth, FractionalOffset.y * childHeight)
                    alignment: FractionalOffset(0.2, 0.6),
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
import 'package:flutter/material.dart';

class StackLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('层叠布局'),
        centerTitle: true,
      ),
      body: SafeArea(
        //Stack允许子组件堆叠
        //而Positioned用于根据Stack的四个角来确定子组件的位置。
        //两者结合实现绝对定位
        //通过ConstrainedBox来确保Stack占满屏幕
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            //指定未定位(没有使用Positioned)或部分定位widget的对齐方式
            //所谓部分定位，在这里特指没有在某一个轴上定位
            alignment: Alignment.center,
            //不知道什么效果，觉得没用
//            textDirection: TextDirection.ltr,
            //此参数用于确定没有定位的子组件如何去适应Stack的大小。
            //StackFit.loose表示使用子组件的大小
            //StackFit.expand表示扩伸到Stack的大小
            fit: StackFit.loose,
            //此属性决定如何显示超出Stack显示空间的子组件；
            //值为Overflow.clip时，超出部分会被剪裁（隐藏）
            //值为Overflow.visible 时则不会
            //尝试了一下 没有看出两者有什么区别
            overflow: Overflow.clip,
            children: <Widget>[
              Container(
                child: Text(
                  'Hello world',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                color: Colors.red,
              ),
              Positioned(
                child: Text('I am Jack'),
                left: 18.0,
                top: 10.0,
              ),
              Positioned(
                child: Text('Your friend'),
                top: 18.0,
              ),
              Positioned(
                child: Text('I am Lcy'),
                right: -20,
                top: 20,
              )
            ],
          ),
        )
      ),
    );
  }
}
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OriginalEventPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OriginalEventPageState();
  }
}

class OriginalEventPageState extends State<OriginalEventPage> {
  //定义一个事件状态
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('原始指针事件'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 5.0,right: 5.0),
                  child: Column(
                    children: <Widget>[
                      Wrap(
                        children: <Widget>[
                          Text('在移动端，各个平台或UI系统的原始指针事件模型基本都是一致，即：一次完整的事件分为三个阶段：手指按下、手指移动、和手指抬起，而更高级别的手势（如点击、双击、拖动等）都是基于这些原始事件的')
                        ],
                      ),
                      Divider(
                        height: 1,
                      ),
                      Wrap(
                        children: <Widget>[
                          Text('Flutter中可以使用Listener来监听原始触摸事件，Listener也是一个功能性组件')
                        ],
                      ),
                      Divider(
                        height: 1,
                      ),
                    ],
                  ),
                ),
                Listener(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    width: 300.0,
                    height: 150.0,
                    child: Text(
                      _event?.toString()??'',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  //按下
                  onPointerDown: (PointerDownEvent event) {
                    print('按下');
                    setState(() {
                      _event = event;
                    });
                  },
                  //移动
                  onPointerMove: (PointerMoveEvent event) {
                    setState(() {
                      _event  =event;
                    });
                  },
                  //抬起
                  onPointerUp: (PointerUpEvent event) {
                    print('抬起');
                    setState(() {
                      _event = event;
                    });
                  },
                  //取消
                  onPointerCancel: (PointerCancelEvent event) {
                    print('事件被取消，如进入电话，进入其他app等');
                  },
                  onPointerSignal: (PointerSignalEvent event) {
                    print('指针在该对象上');
                  },
                ),
                Divider(
                  height: 1,
                ),
                Listener(
                  //ConstrainedBox本身是透明的，透明组件不响应指针事件
                  //ConstrainedBox只是不响应点击事件吗？透明和Opacity的透明有什么区别
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(300.0, 150.0)),
                    child: Center(
                      child: Opacity(
                        opacity: 1.0,
                        child: Text('Down A'),
                      ),
                    ),
                  ),
                  //deferToChild:会对该组件的子组件检测命中事件，如果子组件有一个命中，那么就等于该组件命中
//                  behavior: HitTestBehavior.deferToChild,
                  //opaque:将当前的组件当成不透明组件(本例中当前组件ConstrainedBox是透明的)处理命中事件
//                  behavior: HitTestBehavior.opaque,
                 //translucent:即使该组件和其子组件都是透明的，依然会响应命中事件。
                 behavior: HitTestBehavior.translucent,
                  onPointerDown: (PointerDownEvent event) {
                    print('Down A');
                  },
                ),
                Divider(
                  height: 1,
                ),
                Listener(
                  //阻断子树响应点击事件
                  //AbsorbPointer本身可以响应，子组件不行
                  //IgnorePointer本身就不可以响应
                  child: AbsorbPointer(
                    child: Listener(
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.red,
                      ),
                      onPointerDown: (PointerDownEvent event) {
                        print('1');
                      },
                    ),
                  ),
                  onPointerDown: (PointerDownEvent event) {
                    print('2');
                  },
                ),
                Divider(
                  height: 1,
                ),
                Listener(
                  //阻断子树响应点击事件
                  //IgnorePointer本身就不可以响应
                  child: IgnorePointer(
                    child: Listener(
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue,
                      ),
                      onPointerDown: (PointerDownEvent event) {
                        print('1');
                      },
                    ),
                  ),
                  onPointerDown: (PointerDownEvent event) {
                    print('2');
                  },
                )
              ],
            ),
          )
      ),
    );
  }
}
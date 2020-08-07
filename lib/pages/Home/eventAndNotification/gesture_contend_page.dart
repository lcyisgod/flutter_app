import 'package:flutter/material.dart';

class GestureContendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GestureContendPageState();
  }
}

class GestureContendPageState extends State<GestureContendPage> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('手势竞争'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              left: _left,
              top: _top,
              //Listener直接识别原始指针事件
              //比GestureDetector更接近底层
              child: Listener(
                onPointerDown: (details) {
                  print('down');
                },
                onPointerUp: (details) {
                  print('up');
                },
                child: GestureDetector(
                  child: CircleAvatar(
                    child: Text('A'),
                  ),
                  //垂直方向拖动事件
                  onVerticalDragUpdate: (DragUpdateDetails details) {
                    setState(() {
                      _top += details.delta.dy;
                    });
                  },
                  //水平方向拖动事件
                  onHorizontalDragUpdate: (DragUpdateDetails details) {
                    setState(() {
                      _left += details.delta.dx;
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
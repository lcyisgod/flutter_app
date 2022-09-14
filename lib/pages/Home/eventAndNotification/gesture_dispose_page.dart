import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Home/eventAndNotification/gesture_contend_page.dart';

class GestureDisposePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GestureDisposePageState();
  }
}

class GestureDisposePageState extends State<GestureDisposePage> {
  String _operation = "No Gesture detected!"; //保存事件名
  String _operation2 = '';

  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false; //颜色开关

  @override
  void dispose() {
    // TODO: implement dispose
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('手势处理'),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context){
                      return GestureContendPage();
                    })
                );
              },
              child: Text('手势竞争'))
        ],
      ),
      body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    width: 100.0,
                    height: 100.0,
                    child: Text(
                      _operation,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                  onTap: (){
                    setState(() {
                      _operation = '单击';
                    });
                  },
                  onDoubleTap: (){
                    setState(() {
                      _operation = '双击';
                    });
                  },
                  onLongPress: (){
                    setState(() {
                      _operation = '长按';
                    });
                  },
                  onPanDown: (DragDownDetails e){
                    setState(() {
                      _operation = '按下';
                    });
                  },
                  onPanUpdate: (DragUpdateDetails e) {
                    setState(() {
                      _operation = '滑动';
                    });
                  },
                  onPanEnd: (DragEndDetails e) {
                    setState(() {
                      _operation = '滑动结束';
                    });
                  },
                  //识别单一方向移动
                  //监听单方向滑动一次只能监听一种
                  onVerticalDragUpdate: (DragUpdateDetails e) {
                    setState(() {
                      _operation = '垂直方向拖动';
                    });
                  },
                ),
                Divider(),
                GestureDetector(
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: Text(_operation2),
                  ),
                  onScaleUpdate: (ScaleUpdateDetails details) {
                    setState(() {
                      _operation2 = '缩放';
                    });
                  },
                ),
                Divider(),
                //GestureDetector内部是使用一个或多个GestureRecognizer来识别各种手势的，
                //而GestureRecognizer的作用就是通过Listener来将原始指针事件转换为语义手势
                //GestureDetector直接可以接收一个子widget
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: '你好世界'),
                        TextSpan(
                          text: '点我变色',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: _toggle ? Colors.blue:Colors.red,
                          ),
                          recognizer: _tapGestureRecognizer
                            ..onTap = () {
                              setState(() {
                                _toggle = !_toggle;
                              });
                            }
                            ..onTapDown = (TapDownDetails details) {
                              print('按下');
                            }
                        ),
                        TextSpan(text: '你好世界')
                      ]
                    )
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
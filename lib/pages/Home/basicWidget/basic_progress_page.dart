import 'package:flutter/material.dart';

class BasicProgressPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BasicProgressPageState();
  }
}

class BasicProgressPageState extends State<BasicProgressPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('进度指示器'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 44,
                width: double.infinity,
                alignment: Alignment(0, 0),
                child: Text('两种风格的进度指示器'),
              ),
              Divider(),
              //模糊进度条
              LinearProgressIndicator(
                //当前进度
                //取值范围[0,1]
                //如果value为null时则指示器会执行一个循环动画（模糊进度）
                // 当value不为null时，指示器为一个具体进度的进度条
//                value: 0.5,
                //进度条背景色
                backgroundColor: Colors.blue,
                //进度条颜色
                //该值类型是Animation<Color>，这允许我们对进度条的颜色也可以指定动画。
                //如果我们不需要对进度条颜色执行动画
                //换言之，我们想对进度条应用一种固定的颜色，此时我们可以通过AlwaysStoppedAnimation来指定。
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ),
              Container(
                height: 30,
                width: double.infinity,
              ),
              //进度条显示50%
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
              Container(
                height: 30,
                width: double.infinity,
              ),
              //圆形进度条
              CircularProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
              Container(
                height: 30,
                width: double.infinity,
              ),
              CircularProgressIndicator(
                backgroundColor: Colors.grey,
                value: 0.5,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
              Container(
                height: 30,
                width: double.infinity,
              ),
              Divider(),
              Container(
                height: 30,
                width: double.infinity,
                alignment: Alignment(0, 0),
                child: Text(
                  '自定义进度条'
                ),
              ),
              // 线性进度条高度指定为3
              SizedBox(
                height: 3,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .5,
                ),
              ),
              Container(
                height: 30,
                width: double.infinity,
              ),
              // 圆形进度条直径指定为100
              SizedBox(
                height: 100,
                width: 100,
                child:CircularProgressIndicator(
                backgroundColor: Colors.grey,
                value: 0.5,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
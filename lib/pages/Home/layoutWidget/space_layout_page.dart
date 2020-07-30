import 'package:flutter/material.dart';

class SpaceLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('弹性布局'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 44,
                width: double.infinity,
                alignment: Alignment(-1, 0),
                child: Text('弹性布局允许子组件按照一定比例来分配父容器空间'),
              ),
              Divider(),
              //Flex组件可以沿着水平或垂直方向排列子组件
              //Row或者Column继承Flex，是已经知道主轴方向的Flex
              Flex(
                //对齐方向
                direction: Axis.horizontal,
                children: <Widget>[
                  //可以按比例“扩伸” Row、Column和Flex子组件所占用的空间
                  //flex参数为弹性系数，如果为0或null，则child是没有弹性的
                  //即不会被扩伸占用的空间。
                  //如果大于0，所有的Expanded按照其flex的比例来分割主轴的全部空闲空间
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.red,
                        child: Text('Row'),
                      )
                  ),
                  //Spacer的功能是占用指定比例的空间
                  //是Expanded的一个包装类
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.blue,
                      child:  Text('水平方向'),
                    ),
                  )
                ],
              ),
              Divider(),
              Container(
                height: 100,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.yellow,
                          child: Text('Column'),
                        )
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.green,
                          child: Text('垂直方向'),
                        )
                    )
                  ],
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
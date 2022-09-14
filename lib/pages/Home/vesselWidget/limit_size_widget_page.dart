import 'package:flutter/material.dart';
import 'package:flutter_app/common/toast.dart';

Widget readeBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

class LimitSizeWidgetPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('尺寸限制类容器'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:  Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Wrap(
                    children: <Widget>[
                      Text('尺寸限制类容器用于限制容器大小，Flutter中提供了多种这样的容器，如ConstrainedBox、SizedBox、AspectRatio、UnconstrainedBox等')
                    ],
                  ),
                ),
                Divider(),
                Wrap(
                  children: <Widget>[
                    Text('ConstrainedBox用于对子组件添加额外的约束。例如，如果你想让子组件的最小高度是80像素，你可以使用const BoxConstraints(minHeight: 80.0)作为子组件的约束')
                  ],
                ),
                Divider(),
                ConstrainedBox(
                  constraints: BoxConstraints(//设置尺寸限制条件，具体参数查询Api即可
                      minHeight: 80.0,
                      minWidth: double.infinity
                  ),
                  child: Container(
                    height: 10.0,
                    child: readeBox,
                  ),
                ),
                Divider(),
                Wrap(
                  children: <Widget>[
                    Text('SizedBox用于给子元素指定固定的宽高')
                  ],
                ),
                Divider(),
                SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: readeBox,
                ),
                Divider(),
                Wrap(
                  children: <Widget>[
                    Text('对于有多个ConstrainedBox限制的，最小值取决于最大的那个;最大值取决去最小的那个，并且对于最大值的对象必须有一个确认的')
                  ],
                ),
                Divider(),
                ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
                      child: readeBox,
                    )
                ),
                Divider(),
                ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 90.0, maxHeight: 50.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 60.0, maxHeight: 60.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        child: readeBox,
                      ),
                    )
                ),
                Divider(),
                Wrap(
                  children: <Widget>[
                    Text('装饰容器很简单，就在这里直接写一个吧')
                  ],
                ),
                Divider(),
                Container(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      //背景渐变色
                      gradient: LinearGradient(colors: [Colors.red,Colors.orange[700]]),
                      borderRadius: BorderRadius.circular(3.0),
                      //阴影
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0
                        )
                      ]
                    ),
                    child: TextButton(
                        onPressed: (){
                          Toast.show('装饰按钮');
                        },
                        child: Text('装饰按钮')
                    ),
                  ),
                ),
                Divider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
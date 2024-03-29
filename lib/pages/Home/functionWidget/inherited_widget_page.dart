import 'package:flutter/material.dart';

//一个继承InheritedWidget的共享组件
//这里用于保存所有的状态数据
class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({
    this.testData,
    this.data,
    this.data2,
    Widget child
  }) :super(child: child);

  //需要在子树中共享的数据
  final int data;
  final int data2;
  final bool testData;

  //定义一个快捷方法,方便子树中的Widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    //调用这个方法时会注册依赖关系，所以子组件才会在共享数据发生变化时调用回调
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
   //不注册依赖关系
//  return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>().widget;
  }


  //该回调决定当组件中的数据发生变化时,是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    //如果返回true,则子树中依赖(build函数中有调用)本Widget
    //的子widget的`state.didChangeDependencies`会被调用
    return oldWidget.data == data;
  }


  void increment(){
    print(data.toString());
  }
}

//这是引用ShareDataWidget的一个子组件
//该子组件依赖了父组件的共享数据
class _TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestWidgetState();
  }
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //使用InheritedWidget的状态
          Text(ShareDataWidget.of(context).data.toString()),
          TextButton(
              onPressed: (){
                ShareDataWidget.of(context).increment();
              },
              child: Text('获取计数'))
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change1");
  }
}


class _TestWidget2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestWidgetState2();
  }
}

class _TestWidgetState2 extends State<_TestWidget2> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //使用InheritedWidget的状态
          Text(ShareDataWidget.of(context).data2.toString()),
          TextButton(
              onPressed: (){
                ShareDataWidget.of(context).increment();
              },
              child: Text('获取计数'))
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change2");
  }
}

class _TestWidget3 extends StatefulWidget {
  final int data;

  const  _TestWidget3({Key key, this.data}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestWidget3State();
  }
}

class _TestWidget3State extends State<_TestWidget3> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TestWidget4(
      data: widget.data,
    );
  }
}

class TestWidget4 extends StatefulWidget {
  final int data;

  const TestWidget4({Key key, this.data}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestWidget4State();
  }
}

class _TestWidget4State extends State<TestWidget4> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.red,
      child: Text(
       widget.data.toString()
      )
    );
  }
}


//这是根组件
class InheritedWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InheritedWidgetPageState();
  }
}

class InheritedWidgetPageState extends State<InheritedWidgetPage> {
  int count = 0;
  int count2 = 0;
  bool testData = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            // testData = !testData;
            ++count;
            ++count2;
          });
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Wrap(
                children: <Widget>[
                  Text('InheritedWidget是Flutter中非常重要的一个功能型组件，它提供了一种数据在widget树中从上到下传递、共享的方式，比如我们在应用的根widget中通过InheritedWidget共享了一个数据，那么我们便可以在任意子widget中来获取该共享的数据')
                ],
              ),
              Divider(
                height: 1,
              ),
              ShareDataWidget(
                data: count,
                data2: count2,
                child: Column(
                  children: [
                    _TestWidget(),
                    _TestWidget2()
                  ],
                ),
              ),
              //如果不用ShareDataWidget，对于多层级组件需要一层层传递，增加了大量无用代码
              _TestWidget3(
                data: count,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

//一个继承InheritedWidget的共享组件
class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({
    @required this.data,
    Widget child
  }) :super(child: child);

  final int data; //需要在子树中共享的数据，保存点击次数

  //定义一个快捷方法,方便子树中的Widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    //调用这个方法时会注册依赖关系，所以子组件才会在共享数据发生变化时调用回调
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
   //不注册依赖关系
//  return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>().widget;
  }

  void increment(){
    print(data.toString());
  }

  //该回调决定当data发生变化时,是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    //如果返回true,则子树中依赖(build函数中有调用)本Widget
    //的子widget的`state.didChangeDependencies`会被调用
    return oldWidget.data != data;
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
          Text(ShareDataWidget.of(context).data.toString()),
          FlatButton(
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
    print("Dependencies change");
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
            ++count;
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
              Expanded(
                  child: ShareDataWidget(
                    data: count,
                    child:_TestWidget(),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
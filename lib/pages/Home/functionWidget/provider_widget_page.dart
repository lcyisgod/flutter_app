import 'dart:collection';

import 'package:flutter/material.dart';

//一个通用的InheritedWidget，保存任需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({
    @required this.data,
    Widget child
  }) : super(child: child);


  //共享状态使用泛型
  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> old) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }
}

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  const ChangeNotifierProvider({
    Key key,
    this.data,
    this.child
  }) : super(key: key);

  final Widget child;
  final T data;

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static T of<T>(BuildContext context) {
    final provider =  context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
    if (provider == null) {
      final T data = '123' as T;
      return data;
    }
    return provider.data;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChangeNotifierProviderState();
  }
}

class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>> {
  void update() {
    //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
    setState(() {

    });
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(() {
       update();
      });

      widget.data.addListener(() {
        update();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // TODO: implement initState
    widget.data.addListener(() {
      update();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.data.removeListener(() {
      update();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}

///定义一个显示购物车的Item
class Item {
  double price;
  int count;

  Item(this.price,this.count);
}

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }
}

class ProviderWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProviderWidgetPageState();
  }
}

class ProviderWidgetPageState extends State<ProviderWidgetPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('实现一个简单的状态共享'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, '/ProviderTestPage');
              },
              child: Text('Provider')
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ChangeNotifierProvider<CartModel>(
            data: CartModel(),
            child: Builder(builder: (context) {
              return Column(
                children: <Widget>[
                  Container(
                    height: 45,
                    alignment: Alignment(0, 0),
                    child: Text('这是一个有bug的demo'),
                  ),
                  Divider(
                    height: 1,
                  ),
                  Builder(builder: (context){
                    var cart = ChangeNotifierProvider.of<dynamic>(context);
                    if (cart.runtimeType == String) {
                      return Text("总价: ${cart.toString()}");
                    }else {
                      final CartModel  model = cart as CartModel;
                      return Text("总价: ${model.totalPrice}");
                    }
                  }),
                  Builder(builder: (context){
                    print("RaisedButton build"); //在后面优化部分会用到
                    return RaisedButton(
                      child: Text("添加商品"),
                      onPressed: () {
                        //给购物车中添加商品，添加后总价会更新
                        var cart = ChangeNotifierProvider.of<dynamic>(context);
                        if (cart.runtimeType == String) {
                          print('不存在');
                        }else {
                          final CartModel  model = cart as CartModel;
                          model.add(Item(20.0, 1));
                        }
                      },
                    );
                  }),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
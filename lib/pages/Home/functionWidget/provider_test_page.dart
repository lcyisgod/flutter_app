import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        //可以添加多个不同的ChangeNotifier
        //每个ChangeNotifier负责更新自己所绑定的那些组件
        //避免setState时重新build所有组件的问题
        ChangeNotifierProvider(create: (_)=>Counter()),
        ChangeNotifierProvider(create: (_)=>Counter2()),
      ],
      child: AppPage(),
    );
  }
}

class Counter with ChangeNotifier,DiagnosticableMixin {
  int _count = 0;
  int _count2 = 0;
  int get count => _count;
  int get count2 => _count2;

  void increment() {
    _count++;
    notifyListeners();
  }

  void increment2() {
    _count2++;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    // TODO: implement debugFillProperties
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
    properties.add(IntProperty('count2',count2));
  }
}

class Counter2 with ChangeNotifier,DiagnosticableMixin {
  int _count3 = 0;
  int get count3 => _count3;

  void increment3() {
    _count3++;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    // TODO: implement debugFillProperties
    super.debugFillProperties(properties);
    properties.add(IntProperty('count3', count3));
  }
}

class Count extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('第一个重新构建');
    return Text(
        '${context.watch<Counter>().count}',
        style: Theme.of(context).textTheme.headline4
    );
  }
}

class Count2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('第二个重新构建');
    return Text(
        '${context.watch<Counter>().count2}',
        style: Theme.of(context).textTheme.headline4
    );
  }
}

class Count3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('第三个重新构建');
    return Text(
        '${context.watch<Counter2>().count3}',
        style: Theme.of(context).textTheme.headline4
    );
  }
}

class AppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppPageState();
  }
}

class AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('测试Provier插件'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                context.read<Counter>().increment2();
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Counter>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  onPressed: (){
                    //通过这个setState发现三个组件的都被重新buil
                    setState(() {

                    });
                  },
                  child: Text('测试更新全局')
              ),
              Count(),
              Count2(),
              FlatButton(
                  onPressed: (){
                    context.read<Counter2>().increment3();
                  },
                  child: Text('第三个按钮')
              ),
              Count3()
            ],
          ),
        ),
      ),
    );
  }
}
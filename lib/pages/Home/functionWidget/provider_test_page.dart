import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//页面入口
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


class Counter with ChangeNotifier {
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
}

class Counter2 with ChangeNotifier {
  int _count3 = 0;
  int _count4 = 0;
  int get count3 => _count3;
  int get count4 => _count4;

  void increment3() {
    _count3++;
    notifyListeners();
  }

  void increment4() {
    _count4++;
    notifyListeners();
  }
}

class Count extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('第一个重新构建');
    return Container(
      child: Column(
        children: [
          Text(
              '${context.watch<Counter>().count}',
              style: Theme.of(context).textTheme.headline4
          ),
          Count2(),
          TextButton(
              onPressed: (){
                context.read<Counter>().increment2();
              },
              child: Text('测试内部影响外部')
          )
        ],
      ),
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
    print('AppPage被重建');
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('测试Provider插件'),
        centerTitle: true,
        actions: <Widget>[
          //更新了第二个子组件
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                context.read<Counter>().increment2();
              }),
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: (){
              Navigator.pushNamed(context, '/ProviderTest2Page');
            })
        ],
      ),
      //更新了第一个子组件
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Counter>().increment(),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                  onPressed: (){
                    //调用setState方法导致整个组件都被更新
                    setState(() {

                    });
                  },
                  child: Text('测试更新全局')
              ),
              Count(),
              Count2(),
              //更新第三个子组件
              TextButton(
                  onPressed: (){
                    context.read<Counter2>().increment3();
                  },
                  child: Text('第三个按钮')
              ),
              Count3(),
              TextButton(
                  onPressed: (){
                    context.read<Counter2>().increment4();
                  },
                  child: Text('第四个按钮')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
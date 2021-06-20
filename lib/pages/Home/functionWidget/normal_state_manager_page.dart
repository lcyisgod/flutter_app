import 'package:flutter/material.dart';

class ChildWidgetA extends StatefulWidget {
  final bool activityA;

  const ChildWidgetA({Key key, this.activityA}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChildWidgetAState();
  }
}

class ChildWidgetAState extends State<ChildWidgetA> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('A被初始化');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('A被重新build');
    return Container(
      height: 200,
      width: 200,
      color: widget.activityA?Colors.red:Colors.black,
      child: Center(
        child: ChildWidgetB(),
      ),
    );
  }
}

class ChildWidgetB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChildWidgetBState();
  }
}

class ChildWidgetBState extends State<ChildWidgetB> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('A被初始化');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('B被重新build');
    return Container(
      height: 100,
      width: 100,
      color: Colors.blue,
    );
  }
}

class NormalStateManagerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NormalStateManagerPageState();
  }
}

class NormalStateManagerPageState extends State<NormalStateManagerPage> {

  bool activityA = false;
  bool activityB = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('简单状态管理'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.add), 
              onPressed: (){
                setState(() {
                  print('调用了父类的set方法');
                  activityA = !activityA;
                });
              })
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ChildWidgetA(
                activityA: activityA,
              ),
              ChildWidgetB(),
            ],
          ),
        ),
      ),
    );
  }
}
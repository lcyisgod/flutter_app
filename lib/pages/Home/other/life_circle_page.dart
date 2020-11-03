import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  final String textStr;

  const TestWidget({Key key, this.textStr}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestWidgetState();
  }
}

class TestWidgetState extends State<TestWidget> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies-----子Function');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.red,
      child: Text(widget.textStr??'')
    );
  }

  @override
  void didUpdateWidget(TestWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget-----子Function');
  }
}

class LifeCirclePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LifeCirclePageState();
  }
}

class LifeCirclePageState extends State<LifeCirclePage> {
  String testStr = '测试';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState-----Function');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies-----Function');
  }

  @override
  Widget build(BuildContext context) {
    print('build-----Function');
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('生命周期'),
      ),
      body: SafeArea(
        child:Center(
          child: Column(
            children: [
              FlatButton(
                  onPressed: (){
                    setState(() {
                      testStr = '按下按下按下按下按下按下按下';
                    });
                  },
                  child: Text('改变')),
              TestWidget(
                textStr: testStr,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(LifeCirclePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget-----Function');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('deactivate-----Function');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose-----Function');
  }
}
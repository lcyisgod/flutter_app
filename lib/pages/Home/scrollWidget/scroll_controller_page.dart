import 'package:flutter/material.dart';

class ScrollControllerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScrollControllerPageState();
  }
}

class ScrollControllerPageState extends State<ScrollControllerPage> {
  ScrollController _scrollController = ScrollController(
    //初始滚动位置
    initialScrollOffset: 0.0,
    //是否存储滚动的位置信息，暂时没有理解在什么情况下使用
    keepScrollOffset: true
  );
  bool showToTopBtn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //监听滚动事件，打印滚动位置
    _scrollController.addListener(() {
      print(_scrollController.offset);
      if (_scrollController.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      }else if (_scrollController.offset >= 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //避免内存泄漏
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollController'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.print), onPressed: (){
            Navigator.pushNamed(context, '/ScrollListenerPage');
          })
        ],
      ),
      floatingActionButton: Offstage(
        offstage: !showToTopBtn,
        child: FloatingActionButton(
          //返回到顶部时执行动画
          onPressed: (){
            _scrollController.animateTo(
                .0,
                duration: Duration(milliseconds: 200),
                curve: Curves.ease);
          },
          child: Icon(Icons.arrow_upward),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 5.0,right: 5.0),
                child: Wrap(
                  children: <Widget>[
                    Text('ScrollController来控制可滚动组件的滚动位置,监控滚动组件的事件等')
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 100,
                      itemExtent: 50.0,
                      controller: _scrollController,
                      itemBuilder: (BuildContext context,int index){
                        return ListTile(
                          title: Text('$index'),
                        );
                      })
              )
            ],
          ),
        ),
      ),
    );
  }
}
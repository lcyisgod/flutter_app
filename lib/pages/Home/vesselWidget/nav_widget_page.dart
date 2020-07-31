import 'package:flutter/material.dart';
import 'package:flutter_app/common/toast.dart';

class NavWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NavWidgetPageState();
  }
}

class NavWidgetPageState extends State<NavWidgetPage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  List<String> tabs = ['新闻','历史','图片'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    //监听tabView滑动
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 0:{
          Toast.show('第0个');
          break;
        }
        case 1:
          Toast.show('第1个');
          break;
        case 2:{
          Toast.show('第2个');
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('导航相关'),
        centerTitle: true,
        //右侧组件
        actions: <Widget>[
          FlatButton(
              onPressed: (){
                Toast.show('点击了右侧按钮');
              },
              child: Text('右侧按钮'))
        ],
        //左侧的组件
        leading: IconButton(
            icon: Icon(Icons.dashboard),
            onPressed: (){
              Navigator.pop(context);
            }),
        //在appbar底部展示
        //只有实现了[PreferredSizeWidget]的小部件才能在应用程序栏的底部使用
        bottom: TabBar(//生成Tap菜单
            controller: _tabController,
            tabs: [
              Tab(
                text: tabs[0],
                icon: Icon(Icons.add),
              ),
              Tab(
                //自定义Tab的子控件
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.redeem),
                      Text(tabs[1]),
                    ],
                  ),
                ),
              ),
              //自己实现一个Table
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.title),
                    Text(tabs[2]),
                  ],
                ),
              )
            ]
        ),
      ),
      //悬浮组件
      floatingActionButton: ClipOval(//将组件强制变圆
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue
          ),
          child: Icon(Icons.add),
        ),
      ),
      //实现打洞效果
      //打的洞在iOS上居中，安卓居上一点
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        //底部导航栏打一个洞
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home), onPressed: (){}),
            SizedBox(
                child: ClipOval(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.blue
                    ),
                    child: Icon(Icons.add),
                  ),
                ),
            ),
            IconButton(icon: Icon(Icons.business), onPressed: null)
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: tabs.map((e) { //创建3个Tab页
            return Container(
              alignment: Alignment.center,
              child: Text(e, textScaleFactor: 5),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
   _tabController.dispose();
    super.dispose();
  }
}
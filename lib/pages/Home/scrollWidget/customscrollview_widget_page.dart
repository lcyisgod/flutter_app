import 'package:flutter/material.dart';

class CustomScrollViewWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomScrollViewWidgetPageState();
  }
}

class CustomScrollViewWidgetPageState extends State<CustomScrollViewWidgetPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: CustomScrollView(
        //Sliver系列Widget比较多
        //以Sliver开头可以看到，具体效果可以查看API
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            actions: [
              IconButton(icon: Icon(Icons.add), onPressed: null)
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('CustomScrollView'),
              background: Image.network(
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=7428308,2994758752&fm=26&gp=0.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context,int index){
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100*(index % 9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          //List
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                      (BuildContext context,int index){
                    //创建列表项
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.lightBlue[100 * (index % 9)],
                      child: Text('list item $index'),
                    );
                  },
                  childCount: 50
              ),
              itemExtent: 50.0
          )
        ],
      ),
    );
  }
}
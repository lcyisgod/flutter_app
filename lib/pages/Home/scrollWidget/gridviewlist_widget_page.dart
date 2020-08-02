import 'package:flutter/material.dart';

import 'gridview_build_page.dart';


class GridViewListWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('GridViewList'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.present_to_all),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context){
                          return GridViewBuildPage(

                          );
                        })
                );
              })
        ],
      ),
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 45),
                  child: Container(
                    alignment: Alignment(0, 0),
                    child: Text('GridView可以构建一个二维网格列表'),
                  ),
                ),
                Divider(
                  height: 1,
                ),
                Expanded(
                    flex: 1,
                    //可以使用GridView.count快读达到这个效果
                    child: GridView(
                      //SliverGridDelegateWithFixedCrossAxisCount
                      //该子类实现了一个横轴为固定数量子元素的layout算法
                      //SliverGridDelegateWithMaxCrossAxisExten
                      //该子类实现了一个纵轴子元素为固定最大长度的layout算法
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //横轴子元素的数量
                          crossAxisCount: 3,
                          //主轴方向的间距
                          mainAxisSpacing: 0.0,
                          //横轴方向子元素的间距
                          crossAxisSpacing: 0.0,
                          //子元素在横轴长度和主轴长度的比例
                          //由于crossAxisCount指定后，子元素横轴长度就确定了
                          //然后通过此参数值就可以确定子元素在主轴的长度
                          childAspectRatio: 1.0
                      ),
                      children: <Widget>[
                        Icon(Icons.ac_unit),
                        Icon(Icons.airport_shuttle),
                        Icon(Icons.all_inclusive),
                        Icon(Icons.beach_access),
                        Icon(Icons.cake),
                        Icon(Icons.free_breakfast)
                      ],
                    )
                ),
                Divider(
                  height: 1,
                ),
                Expanded(
                  flex: 1,
                  //使用GridView.extent可以快速达到效果
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      //子元素在纵轴上的最大长度，
                      //之所以是“最大”长度，是因为纵轴方向每个子元素的长度仍然是等分的
                        maxCrossAxisExtent: 120.0,
                        childAspectRatio: 2.0 //宽高比为2
                    ),
                    children: <Widget>[
                      Icon(Icons.ac_unit),
                      Icon(Icons.airport_shuttle),
                      Icon(Icons.all_inclusive),
                      Icon(Icons.beach_access),
                      Icon(Icons.cake),
                      Icon(Icons.free_breakfast),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                ),
              ],
            ),
          )),
    );
  }
}

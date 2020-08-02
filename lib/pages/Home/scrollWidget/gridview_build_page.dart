import 'package:flutter/material.dart';

class GridViewBuildPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GridViewBuildPageState();
  }
}

class GridViewBuildPageState extends State<GridViewBuildPage> {
  List<IconData> _icons = []; //保存Icon数据

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access, Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _retrieveIcons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('创建GridView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, //每行三列
                  childAspectRatio: 1.0 //显示区域宽高相等
              ),
              itemCount: _icons.length,
              itemBuilder: (BuildContext context, int index){
                //如果显示到最后一个并且Icon总数小于200时继续获取数据
                if (index == _icons.length - 1 && _icons.length < 200) {
                  _retrieveIcons();
                }
                return Icon(_icons[index]);
              }),
            )
        ),
      );
  }
}
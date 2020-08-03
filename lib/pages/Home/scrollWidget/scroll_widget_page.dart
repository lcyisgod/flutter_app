import 'package:flutter/material.dart';

class ScrollWidgetPage extends StatelessWidget {
  final List<String> dataList = ['SingleChildScrollView','ListView','GridViewList','CustomScrollView','ScrollController'];
  void jumpToPage(BuildContext context,String title) {
    if (title == 'SingleChildScrollView') {
      Navigator.pushNamed(context, '/SingleChildScrollPage');
    } else if (title == 'ListView') {
      Navigator.pushNamed(context, '/ListViewWidgetPage');
    } else if (title == 'GridViewList') {
      Navigator.pushNamed(context, '/GridViewListWidgetPage');
    } else if (title == 'CustomScrollView') {
      Navigator.pushNamed(context, '/CustomScrollViewWidgetPage');
    } else if (title == 'ScrollController') {
      Navigator.pushNamed(context, '/ScrollControllerPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('可滚动组件'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
            child: ListView.separated(
                itemCount: dataList.length,
                separatorBuilder: (BuildContext context, int indext){
                  return Divider(
                    height: 1,
                  );
                },
                itemBuilder: (BuildContext context,int index){
                  final String title = dataList[index];
                  return InkWell(
                    onTap: (){
                      jumpToPage(context, title);
                    },
                    child: Container(
                      height: 52,
                      width: double.infinity,
                      alignment: Alignment(-1, 0),
                      child: Text(title),
                    ),
                  );
                }),
          )
      ),
    );
  }
}
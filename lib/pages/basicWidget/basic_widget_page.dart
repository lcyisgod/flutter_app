import 'package:flutter/material.dart';

class BasicWidgetPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var dataList = ['Container','动画组件','文本'];

    Future<void> clickEvent(String title) async {
      if (title == 'Container') {
        Navigator.pushNamed(context, '/BasicContainer');
      }else if (title == '动画组件') {
        Navigator.pushNamed(context, '/BasicAnimationPage');
      }else if (title == '文本') {
        Navigator.pushNamed(context, '/BasicTextPage');
      }
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("基础组件"),
        centerTitle: true,
      ),
      body: Center(
        child: SafeArea(
          child: Container(
            child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context,index){
                  final String title = dataList[index];
                 return InkWell(
                   onTap: (){
                     clickEvent(title);
                   },
                   child: Container(
                     height: 45,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: <Widget>[
                         Text(title),
                         Divider(
                           height: 1,
                         )
                       ],
                     ),
                   ),
                 );
                }),
          ),
        ),
      ),
    );
  }
}
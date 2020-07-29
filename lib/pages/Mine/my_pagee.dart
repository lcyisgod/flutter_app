import 'package:flutter/material.dart';
import 'package:flutter_app/common/theme_custome_data.dart';

class MyPage extends StatefulWidget {
  final String title;
  MyPage({Key key, this.title}) : super(key: key);
  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin<MyPage>{
  // 先创建一个 controller
  var controller = new ScrollController();
  var list = ["1","2","3","4","5","6","7","8","9","10","1","2","3","4","5","6","7","8","9","10"];
  //点击时跳转到某个位置
  //跳转的具体偏移量
  pressedOnClick(BuildContext context) async{
    this.controller.animateTo(
        60*5.0,
        duration: Duration(microseconds: 300),
        curve: Curves.bounceIn
    );
  }

  deleteData(int index) async {
    setState(() {
      list.removeAt(index);
    });
  }

  changeData(int index) async {
    setState(() {
      list[index] = "修改测试数据";
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/Login'));
              })
        ],
      ),
      body: SafeArea(
          child: Container(
              child: ListView.builder(
                  itemCount: list.length,
                  controller: this.controller,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: (){
//                        deleteData(index);
                      changeData(index);
                      },
                      child: Container(
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 59,
                              alignment: Alignment(0,0),
                              child: Text(
                                  list[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: MyThemData().colorStyle(context, true, "textColor")
                                  )
                              ),
                            ),
                            Expanded(
                                child: Container(
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ),
                    );
                  }))),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('销毁邮件界面');
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

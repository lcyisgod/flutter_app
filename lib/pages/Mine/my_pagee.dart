import 'package:flutter/material.dart';
import 'package:flutter_app/common/theme_custome_data.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin<MyPage>{
  // 先创建一个 controller
  ScrollController controller = ScrollController();
  final List<String> list = <String>['1','2','3','4','5','6','7','8','9','10','1','2','3','4','5','6','7','8','9','10'];
  //点击时跳转到某个位置
  //跳转的具体偏移量
  Future<void> pressedOnClick(BuildContext context) async{
    controller.animateTo(
        60*5.0,
        duration: const Duration(microseconds: 300),
        curve: Curves.bounceIn
    );
  }

  Future<void> deleteData(int index) async {
    setState(() {
      list.removeAt(index);
    });
  }

  Future<void> changeData(int index) async {
    setState(() {
      list[index] = '修改测试数据';
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {

              })
        ],
      ),
      body: SafeArea(
          child: Container(
              child: ListView.builder(
                  itemCount: list.length,
                  controller: controller,
                  itemBuilder: (_, int index) {
                    return InkWell(
                      onTap: (){
//                       deleteData(index);
                      changeData(index);
                      },
                      child: Container(
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 59,
                              alignment: const Alignment(0,0),
                              child: Text(
                                  list[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: MyThemData().colorStyle(context, true, 'textColor')
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
    print('销毁新闻界面');
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

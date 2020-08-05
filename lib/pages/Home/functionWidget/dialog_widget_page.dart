import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Widget/action_item_widget.dart';

class CustomerDialog extends Dialog {
  CustomerDialog(this.title, this.content, this.cancelTitle, this.ensureTitle,
      this.cancelTap, this.ensureTap);

  final String title;
  final String content;
  final String cancelTitle;
  final String ensureTitle;
  final GestureTapCallback cancelTap;
  final GestureTapCallback ensureTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return Container(
      alignment: Alignment(0, 0),
      child: Container(
        width: 300,
        height: 200,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.circular(2),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 40,
              width: double.infinity,
              alignment: Alignment(0, 0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF6F7C8E),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 110,
              padding: EdgeInsets.only(
                left: 10.0,
                right: 10.0
              ),
              child: Wrap(
                children: <Widget>[
                  Text(
                    content,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                        decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 0.5,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: FlatButton(
                          onPressed: cancelTap,
                          child: Text(
                            cancelTitle,
                            textAlign: TextAlign.center,
                          )
                      )
                  ),
                  Container(
                    width: 1.0,
                    height: double.infinity,
                    color: Colors.grey,
                  ),
                  Expanded(
                      flex: 1,
                      child: FlatButton(
                          onPressed: ensureTap,
                          child: Text(
                            ensureTitle,
                            textAlign: TextAlign.center,
                          )
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DialogWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DialogWidgetPageState();
  }
}

class DialogWidgetPageState extends State<DialogWidgetPage> {
  Future<bool> showSystemAlertDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('这是一个确认文本'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('取消')),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text('确定'))
            ],
          );
        });
  }

  Future<void> showSimpleDialog() async {
    int i = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('简单对话框'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      print('选择了${i == 1 ? '中文简体' : '美国英语'}');
    }
  }

  Future<void> showCustomerDialog() async {
    int i = await showDialog(
        context: context,
        barrierDismissible: false,
        child: CustomerDialog('提示', '这是一个自定义的对话框，一段对话框的内容是什么，需要经过测试', '取消', '确定', () {
          Navigator.pop(context, 1);
        }, () {
          Navigator.pop(context, 2);
        })
    );

    if (i != null) {
      print('选择了${i == 1 ? '取消' : '确定'}');
    }
  }

  Future<void> showCustomerDialog2() async {
    int i = await showDialog(
        context: context,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 100),
          child: Dialog(
            child: ListView.builder(
                itemExtent: 45,
                itemCount: 10,
                itemBuilder: (BuildContext context,int index){
                  return ActionItemWidget(
                    title: '$index',
                    onPressed: (title) {
                      Navigator.pop(context, index);
                    },
                  );
                }),
          ),
        )
    );

    if (i != null) {
      print('选择了${i}');
    }
  }

  Future<void> showIOSDialog() async{
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context){
          return CupertinoAlertDialog(
            title: Text('提示'),
            content: Text('这是一个确认文本'),
            actions: <Widget>[
              FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('取消')
              ),
              FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('确定')
              )
            ],
          );
        });
  }

  Future<void> showGeneraDialog() async {
    showGeneralDialog(
      context: context,
      //点击遮罩知否关闭对话框
      barrierDismissible: true,
      //遮罩颜色
      barrierColor: Colors.black.withOpacity(0.5),
      //文字？不知道用在哪里，待测试
      barrierLabel: '',
      //动画持续时间
      transitionDuration: Duration(seconds: 1),
      //展示的对话框内容
      pageBuilder: (
          //参数为context,
          //显示时的动画
          //结束时的动画
          BuildContext context,
          Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Material(
            child: Container(
              color: Colors.black.withOpacity(animation.value),
              child: Text("我是一个可变的"),
            ),
          ),
        );
      },
      transitionBuilder: (ctx, animation, _, child){
        return FractionalTranslation(
          translation: Offset(1-animation.value, 0),
          child: child,
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('对话框'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              RaisedButton(
                  onPressed: () {
                    showSystemAlertDialog();
                  },
                  child: Text('AlertDialog')),
              RaisedButton(
                  onPressed: () {
                    showSimpleDialog();
                  },
                  child: Text('SimpleDialog')),
              RaisedButton(
                onPressed: () {
                  showCustomerDialog();
                },
                child: Text('自定义对话框'),
              ),
              RaisedButton(
                onPressed: () {
                  showCustomerDialog2();
                },
                child: Text('自定义对话框2'),
              ),
              Text('iOS风格对话框'),
              RaisedButton(
                onPressed: () {
                  showIOSDialog();
                },
                child: Text('iOS对话框'),
              ),
              Text('定义对话框动画弹出'),
              RaisedButton(
                  onPressed: (){
                    showGeneraDialog();
                  },
                child: Text('弹框动画测试'),
              )
            ],
          ),
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicTextFormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BasicTextFormPageState();
  }
}

class BasicTextFormPageState extends State<BasicTextFormPage> {
  TextEditingController _controller;
  //键盘焦点事件
  FocusNode focusNode;
  FocusNode focusNode2;
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    _controller = TextEditingController(text: '');
    //可以通过controller监听键盘事件
    //通过这种方式无法确定键盘事件，但是所有的键盘事件都会响应这里
    _controller.addListener(() {

    });

    focusNode = FocusNode();
    focusNode2 = FocusNode();

    //监听焦点变化事件
    focusNode.addListener(() {
      print('焦点发生了变化');
      print(focusNode.hasFocus);
    });
    super.initState();
  }

  @override
  void dispose() {
    print('测试界面');
    focusNode.removeListener(() {
      print('移除监听');
    });
    focusNode.dispose();
    focusNode2.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('输入框'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                //自动获取焦点
                autofocus: true,
                //编辑框的控制器
                //通过它可以设置/获取编辑框的内容、选择编辑内容、监听编辑文本改变事件
                controller: _controller,
                //用于控制TextField是否占有当前键盘的输入焦点
                //点击屏幕让键盘收起等事件
                focusNode: focusNode,
                //键盘格式
                keyboardType: TextInputType.text,
                //最大行数
                maxLines: 2,
                //最大长度
                //通过这种方式设置最大长度会在输入框右下角显示一个提示
                //如果不想这么做可以在下一个属性中限制长度
               // maxLength: 11,
                //和maxLength结合使用，在达到最大长度时是否禁止操作
//              maxLengthEnforced: true,
                //输入框的一些样式，是一个数组
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(11),
                ],
                //是否是密码格式
                obscureText: false,
                //用于控制TextField的外观显示，如提示文本、背景颜色、边框等
                decoration: InputDecoration(
                    hintText: '提示文字',
                    hintStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                    //位于提示文字上方的文字
                    //在键盘收起时会遮盖提示文字
                    labelText: '初始文字',
                    labelStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                    ),
                    //位于左侧的一个图标
                    prefixIcon: Icon(Icons.person),
                    //输入框的底部风格线
                    //去除下滑线在这里做
                    border: InputBorder.none,
                    //外边框的颜色
                    //非获取焦点时
                    enabledBorder: OutlineInputBorder(
                        //外边框的弧度
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0)),
                        //外边框的颜色和宽度
                        borderSide: BorderSide(
                                color: Colors.yellow,
                                width: 2
                        )
                    ),
                    //获取焦点时
                    focusedBorder: OutlineInputBorder(
                      //外边框的弧度
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0)),
                        //外边框的颜色和宽度
                        borderSide: BorderSide(
                            color: Colors.green,
                            width: 2
                        )
                    )
                ),
                //监听文本变化
                onChanged: (String value) {
                  print('文本变化了:$value');
                },
                //键盘提交事件
                onSubmitted: (String value) {
                  print('提交事件:$value');
                },
                //键盘事件提交
                //如果实现了该方法，则键盘可能无法收回
                onEditingComplete: () {
                  print('开始编辑');
                },
              ),
              TextField(
                focusNode: focusNode2,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add),
                  hintText: '第二个输入框',
                  hintStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                  labelText: '顶部提示',
                  labelStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  focusScopeNode ??= FocusScope.of(context);
                  if(focusNode.hasFocus){
                    focusScopeNode.requestFocus(focusNode2);
                  }
                  if(focusNode2.hasFocus){
                    focusScopeNode.requestFocus(focusNode);
                  }
                },
                child: const Text('移动焦点'),
              ),
              FlatButton(
                onPressed: () {
                  //失去焦点
                  focusNode.unfocus();
                  focusNode2.unfocus();
                },
                child: const Text('隐藏键盘'),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

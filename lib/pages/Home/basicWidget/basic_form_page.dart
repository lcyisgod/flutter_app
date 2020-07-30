import 'package:flutter/material.dart';

class BasicFormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BasicFormPageState();
  }
}

class BasicFormPageState extends State<BasicFormPage> {
  TextEditingController _controller;
  TextEditingController _controller2;
  GlobalKey _globalKey;

  @override
  void initState() {
    // TODO: implement initState
    _controller = TextEditingController();
    _controller2 = TextEditingController();
    _globalKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('表单'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 24.0),
              child: Form(
                key: _globalKey,
                //开启自动校验
                autovalidate: true,
                //表单内容发生变化时调用
                onChanged: (){
                  print('表单内容发生了变化');
                },
                child: Column(
                  children: <Widget>[
                    Text('表单是可以加入验证条件的输入框'),
                    TextFormField(
                      autofocus: true,
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: '用户名',
                        hintText: '用户名或邮箱',
                        prefixIcon: Icon(Icons.person),
                      ),
                      //初始值
                      //初始值和编辑控制器不能同时存在
//                    initialValue: '000',
                      //验证回调
                      validator: (String value) {
                        return value
                            .trim()
                            .length > 0 ? null:'用户名不能为空';
                      },
                      //保存回调
                      onSaved: (String value) {

                      },
                    ),
                    TextFormField(
                      controller: _controller2,
                      decoration: InputDecoration(
                          labelText: '密码',
                          hintText: '您的登录密码',
                          prefixIcon: Icon(Icons.lock)
                      ),
                      obscureText: true,
                      //校验密码
                      validator: (String value) {
                        if (value.length > 5) {
                          return null;
                        }
                        return '密码不能少于6位';
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              onPressed: (){
                                // 通过_formKey.currentState 获取FormState后，
                                // 调用validate()方法校验用户名密码是否合法，校验
                                // 通过后再提交数据。
                                if ((_globalKey.currentState as FormState).validate()) {
                                  print('验证通过');
                                }else {
                                  print('验证没有通过');
                                }
                              },
                              child: Text('登录'),
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("登录"),
        //去除左边的返回按钮
        leading: Text(""),
      ),
      body: new Center(
        child: new Container(
          color: Colors.white,
          child: new FlatButton(
              onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, '/Home', (route) => route == null);
              }, 
              child: new Text("点击登录")),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class DateOperatePage extends StatefulWidget {
  @override
  DateOperatePageState createState()  => DateOperatePageState();
}

class DateOperatePageState extends State<DateOperatePage> {
  String dateBasePath;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('数据库操作'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.white,
            child: FlatButton(
                onPressed: (){},
                child: Text('操作数据库')
            ),
          ),
        ),
      ),
    );
  }
}
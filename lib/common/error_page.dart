import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: const Text('错误界面'),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: const Text('哎呀，出错了'),
        ),
      ),
    );
  }
}
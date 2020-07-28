import 'package:flutter/material.dart';

class BasicImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('图片'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 44,
                child: Text(
                  '加载本地图片',
                  textAlign: TextAlign.center,
                ),
              ),
              Image.asset(
                'assets/images/other/allList.png',
                width: 44,
                height: 44,
              )
            ],
          ),
        ),
      ),
    );
  }
}
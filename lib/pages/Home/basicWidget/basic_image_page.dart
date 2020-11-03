import 'package:flutter/material.dart';

class BasicImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('图片'),
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
                child: const Text(
                  '加载本地图片',
                  textAlign: TextAlign.center,
                ),
              ),
              Image.asset(
                'assets/images/other/allList.png',
                width: 44,
                height: 44,
              ),
              const Divider(),
              Container(
                width: double.infinity,
                height: 44,
                child: const Text(
                  '加载网络图片',
                  textAlign: TextAlign.center,
                ),
              ),
              Image.network(
                'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=152797763,3165515443&fm=26&gp=0.jpg',
//                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=7428308,2994758752&fm=26&gp=0.jpg',
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
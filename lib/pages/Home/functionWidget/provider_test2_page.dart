
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderTest2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
        providers: [
          Provider(
            create: (context) => (){
              int data = 1;
            },
            dispose: (context,value){
              print('结束');
              print(value);
            }),
        ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '测试基础Provider'
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              color: Colors.red,
              child: Text(
                ''
              ),
            ),
          ),
        ),
      ),
    );
  }
}
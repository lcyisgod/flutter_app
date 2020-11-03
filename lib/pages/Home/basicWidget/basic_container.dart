import 'package:flutter/material.dart';

class BasicContainerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BasicContainerPageState();
  }
}

class BasicContainerPageState extends State<BasicContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container'),
        centerTitle: true,
      ),
      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text('Container类似于iOS的UIView'),
            Container(
              //背景色
//        color: Colors.red,
              //高度
              height: 100,
              //宽度
              width: double.infinity,
              //设置一些指定制定属性
              //设置制定属性时背景色在这路设置
              decoration: const BoxDecoration(
                //边框角度
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.red,
                //背景图片
                image: DecorationImage(
                  image: NetworkImage('https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=152797763,3165515443&fm=26&gp=0.jpg'),
//                    image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1589451972365&di=5b22e70622b25257069b9a6e1273711a&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201701%2F29%2F20170129094700_vHETL.jpeg')
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
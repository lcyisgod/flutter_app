import 'package:flutter/material.dart';

class BasicAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BasicAnimationPageState();
  }
}

class BasicAnimationPageState extends State<BasicAnimationPage> {
  bool click = false;
  bool first = true;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('简单动画'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Text(
                  'AnimatedContainer,我们可以通俗的理解AnimatedContainer是带动画功能的Container',
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    click = !click;
                  });
                },
                child: AnimatedContainer(
                  height: click? 200:100,
                  width: click? 200:100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:  NetworkImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1589451972365&di=5b22e70622b25257069b9a6e1273711a&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201701%2F29%2F20170129094700_vHETL.jpeg"),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(
                      click ? 200:0,
                    ))
                  ),
                  //动画时长
                  duration: Duration(seconds: 3),
                  //动画切入曲线
                  curve: Curves.bounceIn,
                  //动画执行结束
                  onEnd: (){
                    print('动画执行结束');
                    setState(() {
                      click = !click;
                    });
                  },
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'AnimatedCrossFade,一个widget，在两个孩子之间交叉淡入，并同时调整他们的尺寸, firstChild 在一定时间逐渐变成 secondChild',
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: (){
                 setState(() {
                   first = !first;
                 });
                },
                child: AnimatedCrossFade(
                    firstChild: Container(
                      width: 100.0,
                      height: 100.0,
                      color: Colors.green,
                      child: Text('123'),
                    ),
                    secondChild: Container(
                      width: 200.0,
                      height: 100.0,
                      color: Colors.red,
                      child: Text('456'),
                    ),
                    crossFadeState: first? CrossFadeState.showFirst:CrossFadeState.showSecond,
                    duration: Duration(seconds: 3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
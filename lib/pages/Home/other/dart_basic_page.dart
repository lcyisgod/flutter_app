import 'package:flutter/material.dart';

//dart 类
//飞船类
class Spacecraft {
  String name;
  DateTime launchDate;

  //构造函数，带有可以直接为成员变量赋值的语法糖
  Spacecraft(this.name, this.launchDate);

  //命名构造函数，转发到默认构造函数
  Spacecraft.unlaunched(String name):this(name,null);

  int get launchYear => launchDate?.year; //只读的非final属性

  //方法
  void describe() {
    print('宇宙飞船:$name');
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('发射时间：$launchYear ($years years ago)');
    }else {
      print('尚未发射');
    }
  }
}

//扩展类(继承)
//单继承
class Orbiter extends Spacecraft {
  double altitude;
  Orbiter(String name,DateTime launchDate, this.altitude):super(name,launchDate);
}

class DartBasicPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DartBasicPageState();
  }
}

class DartBasicPageState extends State<DartBasicPage> {
  @override
  void initState() {
    super.initState();
//    // ignore: unnecessary_parenthesis
//    final Set<String> setTest = Set();
//    setTest.addAll(['1','2','3','2']);
//    print(setTest);
//
//    //数组
//    final List<Object> dataList = <Object>['2',3,'5','9','7',10];
//    print(dataList.whereType<int>());
//    // ignore: avoid_function_literals_in_foreach_calls
//    dataList.forEach((Object element) {
//      print(element);
//    });
//
//    // for循环
//    for(var object in dataList) {
//      print(object);
//    }
//
//    //字典
//    final Map<String, String> mapTest = <String, String>{
//      'name':'GGG',
//      'age':'22',
//      'sex':'M',
//    };
//
//    mapTest.forEach((String key, String value) {
//      print('键是$key,值是$value');
//    });
  }

  //斐波那契函数
  //同步函数形式
  int fibonacci(int n) {
    if (n == 0 || n == 1)  return n;
    return fibonacci(n-1)+fibonacci(n-2);
  }


  //异步函数形式
  Future<int> fibonacci2(int n) async {
    return 20*n;
  }

  //测试空安全
  void checkVoidSafe() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart基础'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: (){
                  var num = fibonacci(20);
                  print(num);
                },
                child: Text('同步函数调用'),
              ),
              InkWell(
                onTap: () async{
                 var num = await fibonacci2(20);
                 print(num);
                },
                child: Text('异步函数调用'),
              ),
              InkWell(
                onTap: () {
                 var voyager = Spacecraft('旅行者一号', DateTime(1997,9,5));
                 voyager.describe();

                 var voyager3 = Spacecraft.unlaunched('旅行者三号');
                 voyager3.describe();
                },
                child: Text('测试类'),
              )
            ],
          ),
        ),
      ),
    );
  }
}


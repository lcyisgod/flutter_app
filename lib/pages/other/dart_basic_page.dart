import 'package:flutter/material.dart';

class DartBasicPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DartBasicPageState();
  }
}

class DartBasicPageState extends State<DartBasicPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var setTest = Set<String>();
    setTest.addAll(['1','2','3','2']);
    print(setTest);

    //数组
    var dataList = ['2',3,'5','9','7',10];
    print(dataList.whereType<int>());
    dataList.forEach((element) {
      print(element);
    });

    //字典
    var mapTest = {
      'name':'SMT',
      'age':'22',
      'sex':'M',
    };

    mapTest.forEach((key, value) {
      print('键是$key,值是$value');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Dart基础'),
        centerTitle: true,
      ),
    );
  }
}


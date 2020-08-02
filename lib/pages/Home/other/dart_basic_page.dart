import 'package:flutter/material.dart';

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
    // ignore: unnecessary_parenthesis
    final Set<String> setTest = Set();
    setTest.addAll(['1','2','3','2']);
    print(setTest);

    //数组
    final List<Object> dataList = <Object>['2',3,'5','9','7',10];
    print(dataList.whereType<int>());
    // ignore: avoid_function_literals_in_foreach_calls
    dataList.forEach((Object element) {
      print(element);
    });

    //字典
    final Map<String, String> mapTest = <String, String>{
      'name':'SMT',
      'age':'22',
      'sex':'M',
    };

    mapTest.forEach((String key, String value) {
      print('键是$key,值是$value');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart基础'),
        centerTitle: true,
      ),
    );
  }
}


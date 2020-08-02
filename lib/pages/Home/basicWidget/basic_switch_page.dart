import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicSwitchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BasicSwitchPageState();
  }
}

class BasicSwitchPageState extends State<BasicSwitchPage> {
  bool _switchSelected;
  bool _checkboxSelected;

  @override
  void initState() {
    super.initState();
    _switchSelected = true;
    _checkboxSelected = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('选择开关和复选框'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 44,
                width: double.infinity,
                color: Colors.blue,
                alignment: const Alignment(0, 0),
                child: const Text(
                  '不同风格的Switch',
                  textAlign: TextAlign.center,
                ),
              ),
              const Divider(),
              Switch(
                  value: _switchSelected,
                  //选中的颜色
                  activeColor: Colors.red,
                //滑杆的颜色
                activeTrackColor: Colors.green,
                  onChanged: (bool value){
                    setState(() {
                      _switchSelected = value;
                    });
                  },
              ),
              CupertinoSwitch(
                  value: _switchSelected,
                  onChanged: (bool value){
                    setState(() {
                      _switchSelected = value;
                    });
                  },
              ),
              Container(
                height: 44,
                width: double.infinity,
                color: Colors.blue,
                alignment: const Alignment(0, 0),
                child: const Text(
                  '复选框',
                  textAlign: TextAlign.center,
                ),
              ),
              const Divider(),
              Checkbox(
                  value: _checkboxSelected,
                  onChanged: (bool value){
                    setState(() {
                      _checkboxSelected = value;
                    });
                  },
              )
            ],
          ),
        ),
      ),
    );
  }
}
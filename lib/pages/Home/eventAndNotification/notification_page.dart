import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NotificationPageState();
  }
}

class NotificationPageState extends State<NotificationPage> {
  String _msg = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: NotificationListener<MyNotification>(
          onNotification: (notification){
            print(notification.msg);
            return false;
          },
            child: NotificationListener<MyNotification>(
              onNotification: (notification){
                setState(() {
                  _msg += notification.msg;
                });
                //false 不阻止冒泡
                return true;
              },
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Builder(builder: (context){
                      return RaisedButton(
                        onPressed: ()=>MyNotification('Hi').dispatch(context),
                        child: Text("Send Notification"),
                      );
                    }),
                    Text(_msg)
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}
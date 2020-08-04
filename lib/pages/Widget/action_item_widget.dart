import 'package:flutter/material.dart';

class ActionItemWidget extends StatelessWidget {

  const ActionItemWidget(
      {
        Key key,
        this.title,
        this.onPressed
      }) : super(key: key);

  final String title;
  final Function(String title) onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
        onPressed(title);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              child: Container(
                alignment: Alignment(-1, 0),
                child: Text(title),
              )
          ),
          Divider(
            height: 1,
          )
        ],
      ),
    );
  }
}
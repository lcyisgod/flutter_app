import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          //移除抽屉菜单顶部默认留白
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 38.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                        child: Image.network(
                          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farticle%2Fdb0787e62730176883cbd1c03557d4f3f13905b7.jpg&refer=http%3A%2F%2Fi0.hdslb.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1665732801&t=e998e43670eba59f4aef2a6cb72e6516',
                          width: 80,
                          height: 80,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      "Wendux",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text('add'),
                    ),
                    Divider(
                      height: 1,
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('set'),
                    ),
                    Divider(
                      height: 1,
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
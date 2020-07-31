import 'package:flutter/material.dart';

import 'Home/home_page.dart';
import 'Mine/my_pagee.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {

  int _currentIndex = 0;
  var _pageList;
  var _tabImages;
  var _appBarTitles = ["Home", "Email"];
  final _pageController = PageController();

  Widget _buildTabText(int curIndex) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Text(_appBarTitles[curIndex]),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _getTabIcon(int curIndex) {
    if(curIndex == _currentIndex){
      return _tabImages[curIndex][1];
    }
    return _tabImages[curIndex][0];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageList = [
      HomePage(title: "首页",),
      MyPage(title: "邮件",)
    ];

    _tabImages = [
      [
        Image.asset("assets/images/iconBar/icon_home_n.png"),
        Image.asset("assets/images/iconBar/icon_home_s.png"),
      ],
      [
        Image.asset("assets/images/iconBar/icon_mine_n.png"),
        Image.asset("assets/images/iconBar/icon_mine_s.png"),
      ]
    ];

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //底部导航组件
      //用于展示有多个模块时
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(
            _appBarTitles.length,
                (i) => BottomNavigationBarItem(
              icon: _getTabIcon(i),
              title: _buildTabText(i),
            )),
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        onTap: (int index){
          _pageController.jumpToPage(index);
        },
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pageList,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
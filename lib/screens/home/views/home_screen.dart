import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_tracker/screens/add_expense/views/add_expense.dart';
import 'package:quick_tracker/screens/home/views/main_screen.dart';

import '../../states/states_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //影响有多少个item
  int index = 0;

  //当切换到不同的页面 在bar中切换颜色
  late Color selectedColor;
  Color unSelectedColor = Colors.grey;

  var widgetList = [
    MainScreen(),
    stateScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    selectedColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
      ),
      //ClipRRect是裁剪bar的，使之更像是playstation的风格
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
            // print(value);
          },
          //fixedColor: Colors.green,
          //被selectedColor取代了 selectedItemColor: Colors.green,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 3,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
                color: index == 0 ? selectedColor : unSelectedColor,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.graph_square_fill,
                  color: index == 0 ? unSelectedColor : selectedColor,
                ),
                label: "Stats"),
          ],
        ),
      ),
      //浮空栏 用于添加
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddExpense(),
            ),
          );
        },
        shape: CircleBorder(),
        child: Container(
            width: 60,
            height: 60,
            //添加渐变
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.tertiary,
                ], transform: GradientRotation(pi / 4))),
            child: Icon(
              CupertinoIcons.add,
              color: Colors.white,
            )),
      ),
      //如果为0则是 主页,不是则是状态页
      body: index == 0 ? MainScreen() : stateScreen(),
    );
    ;
  }
}

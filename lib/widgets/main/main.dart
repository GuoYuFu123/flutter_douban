import 'package:flutter/material.dart';
import 'package:flutter_douban/bloc/search/search_bloc.dart';
import 'package:flutter_douban/pages/home/home.dart';
import 'package:flutter_douban/pages/mine/mine.dart';
import 'package:flutter_douban/pages/search/search.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final _BottomNavigationColor = Colors.cyan;

  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    list..add(Home())..add(Mine());
    // list..add(Home())..add(Search());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('豆瓣'),
        // ),
        body: list[_currentIndex],
        floatingActionButton: FloatingActionButton(
          tooltip: 'search',
          child: Icon(Icons.search, color: Colors.white),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              print(context);
              // return BlocProvider(
              //   create: (BuildContext context) => SearchBloc(),
              //   child: Search()
              // );
              return Search();
            }));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar: BottomAppBar(
        //   color: Colors.blue,
        //   child: Row(
        //     mainAxisSize: MainAxisSize.max,
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: <Widget>[
        //       IconButton(
        //           icon: Icon(Icons.home, color: Colors.white),
        //           onPressed: () {
        //             setState(() {
        //               _currentIndex = 0;
        //             });
        //           }),
        //       IconButton(
        //           icon: Icon(
        //             Icons.account_circle,
        //             color: Colors.white,
        //           ),
        //           onPressed: () {
        //             setState(() {
        //               _currentIndex = 1;
        //             });
        //           })
        //     ],
        //   ),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: '主页'),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.account_circle,
              ),
              label: '我的',
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          // backgroundColor: Colors.blue,
        ));
  }
}

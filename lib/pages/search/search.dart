import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../bloc/blocs.dart';

import '../../widgets/webview/webview.dart';

import './search_bar.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('搜索'), actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // print('search');
                showSearch(context: context, delegate: SearchBar());
              })
        ]),
        body: Center(child: WebViewWiget()));
  }
}

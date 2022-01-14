import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_douban/models/suggest.dart';
import 'asset.dart';

import "../../api/movie.dart";

// import '../../utils/index.dart';

MovieApi _movieApi = MovieApi();

class SearchBar extends SearchDelegate<String> {
  // Timer _timer;
  // //设置节流周期为390毫秒
  // Duration durationTime = Duration(milliseconds: 2000);

  Future<List<Suggest>> getSuggestList(String query) async {
    // _timer?.cancel();
    // _timer = Timer(durationTime, () async {
      print('getSuggestList');
      print('query');
      //事件执行处
      List<Suggest> list = await _movieApi.getMovieSuggest(query);
      return list;
    // });
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print(context);
    print(query);

    List<Suggest> list = new List<Suggest>();
    return FutureBuilder<List<Suggest>>(
      future: getSuggestList(query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        list = (snapshot.hasData && snapshot.data?.length > 0)
            ? snapshot.data
            : recentSuggest;
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(list[index].title),
              subtitle: Text(list[index].sub_title),
              leading: Image.network(
                list[index].img,
                fit: BoxFit.contain,
              )),
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // return container();
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      )
    ];
  }

  @override
  String get searchFieldLabel => '电影、电视剧、综艺、影人';
}

import 'package:flutter/material.dart';
import 'package:flutter_douban/api/tag.dart';
import 'package:flutter_douban/api/movie.dart';
import 'package:flutter_douban/models/subject.dart';
import 'package:flutter_douban/widgets/rate/rate.dart';

final TagApi _tagApi = TagApi();
final MovieApi _movieApi = MovieApi();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> tags;
  List<Subject> list;
  final List radioList = [
    {'value': 'recommend', 'key': '按热度更新'},
    {'value': 'time', 'key': '按时间更新'},
    {'value': 'rank', 'key': '按评价更新'}
  ];
  String _tagName;
  String _radioValue;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _radioValue = radioList[0]['value'];
    list = new List<Subject>();
    // tags
    tags = new List<String>();
    _tagApi.getMovieTags().then((tagInstance) {
      setState(() {
        // print(map['tags']);
        tags = tagInstance.tags;
        _tagName = tags[0];
        // tags = map['tags'].cast<String>();

        this.getList();
      });
    });
  }

  // 获取数据
  getList() async {
    final res = await _movieApi.getMovieList(this._tagName, this._radioValue);
    setState(() {
      list = res;
      _scrollController.animateTo(_scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(' 主页'),
        ),
        body: Container(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: tags
                      .map(
                        (
                          String tag,
                        ) =>
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _tagName = tag;
                                    this.getList();
                                  });
                                },
                                child: new Container(
                                  child: new Text(
                                    tag,
                                    style: TextStyle(
                                        color: (tag == _tagName
                                            ? Colors.orange
                                            : Colors.black),
                                        fontSize:
                                            (tag == _tagName ? 20.0 : 18.0),
                                        fontWeight: (tag == _tagName
                                            ? FontWeight.bold
                                            : FontWeight.normal)),
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                )),
                      )
                      .toList()),
            ),

            // 分割线
            Divider(
              height: 1.0,
              color: Colors.grey,
            ),

            // 单选
            Column(
              children: radioList
                  .map((radio) => RadioListTile(
                        title: Text(radio['key']),
                        value: radio['value'],
                        groupValue: _radioValue,
                        onChanged: (value) {
                          setState(() {
                            _radioValue = value;
                            this.getList();
                          });
                        },
                      ))
                  .toList(),
            ),

            // list
            Expanded(
                flex: 2,
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: this.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child:
                            Flex(direction: Axis.horizontal, children: <Widget>[
                          Container(
                              height: 100.0,
                              // color: Colors.red,
                              width: 80.0,
                              child: Image.network(
                                this.list[index].cover,
                                fit: BoxFit.contain,
                              )),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        this.list[index].title,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Rate(
                                            value: double.parse(
                                                this.list[index].rate)),
                                      ),
                                    ]),
                                this.list[index].is_new
                                    ? Container(
                                        color: Colors.lightGreen,
                                        padding: EdgeInsets.all(6.0),
                                        margin: EdgeInsets.only(right: 20.0),
                                        child: Text(
                                          '新',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : Text('')
                              ],
                            ),
                          ),
                        ]),
                      );
                    }))
          ],
        )));
  }
}

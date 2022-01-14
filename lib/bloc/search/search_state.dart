import 'package:flutter/foundation.dart';
import 'package:flutter_douban/models/suggest.dart';

@immutable
class SearchState {
  final List<Suggest> suggestList;
  final String text;

  SearchState({this.suggestList = const [], this.text = ''});
}

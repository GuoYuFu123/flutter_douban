import 'package:meta/meta.dart';

@immutable
abstract class SearchEvent {
  SearchEvent([List props = const <dynamic>[]]) : super();
}

class SearchSuggest extends SearchEvent {
  final String q;

  SearchSuggest({@required this.q}) : super([q]);
}

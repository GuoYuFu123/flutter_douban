import 'package:flutter_douban/models/suggest.dart';

import 'base.dart';
import '../models/subject.dart';

class MovieApi {
  //  电影列表
  static const String MOVIE_LIST =
      '/j/search_subjects?type=movie&page_limit=20&page_start=0';
  // 电影推荐
  static const String MOVIE_SUGGEST = '/j/subject_suggest';

  // 获取电影列表
  getMovieList(String tag, String sort) async {
    String MOVIE_LIST_URL = '$MOVIE_LIST&tag=$tag&sort=$sort';
    Map<String, dynamic> res = await httpService.get(MOVIE_LIST_URL);
    List<Subject> list = (res['subjects'] as List<dynamic>)
        .map((it) => Subject.fromJson(it))
        .toList();
    return list;
  }

  // 获取电影推荐
  getMovieSuggest(String q) async {
    String MOVIE_SUGGEST_URL = '$MOVIE_SUGGEST?q=$q';
    List<dynamic> res = await httpService.get(MOVIE_SUGGEST_URL);
    List<Suggest> list = res.map((item) => Suggest.fromJson(item)).toList();
    print(list is List<Suggest>);
    return list;
  }
}

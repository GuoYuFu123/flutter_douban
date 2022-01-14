import 'base.dart';
import '../models/tag.dart';

class TagApi {
  //  电影标签
  static const String MOVIE_TAG = '/j/search_tags?type=movie';

  getMovieTags() async {
    Map<String, dynamic> res = await httpService.get(MOVIE_TAG);
    return Tag.fromJson(res);
  }
}

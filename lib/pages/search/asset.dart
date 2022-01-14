import '../../models/suggest.dart';

final List<Suggest> recentSuggest = [
  {
    'episode': "25",
    'id': "2156663",
    'img':
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2265959269.jpg",
    'sub_title': "西游记",
    'title': "西游记",
    'type': "movie",
    'url':
        "https://movie.douban.com/subject/2156663/?suggest=%E8%A5%BF%E6%B8%B8%E8%AE%B0",
    'year': "1986",
  },
  {
    'episode': "84",
    'id': "1830528",
    'img':
        "https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2558480666.jpg",
    'sub_title': "三国演义",
    'title': "三国演义",
    'type': "movie",
    'url':
        "https://movie.douban.com/subject/1830528/?suggest=%E4%B8%89%E5%9B%BD%E6%BC%94%E4%B9%89",
    'year': "1994",
  },
  {
    'episode': "43",
    'id': "3904560",
    'img':
        "https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2558579542.jpg",
    'sub_title': "水浒传",
    'title': "水浒传",
    'type': "movie",
    'url':
        "https://movie.douban.com/subject/3904560/?suggest=%E6%B0%B4%E6%B5%92%E4%BC%A0",
    'year': "1998",
  },
  {
    'episode': "36",
    'id': "1864810",
    'img':
        "https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2554030915.jpg",
    'sub_title': "红楼梦",
    'title': "红楼梦",
    'type': "movie",
    'url': "https://movie.douban.com/subject/1864810/?suggest=hongloumeng",
    'year': "1987",
  }
].map((item) => Suggest.fromJson(item)).toList();

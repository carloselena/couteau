import 'package:couteau/infrastructure/models/wordpress/news_model.dart';
import 'package:dio/dio.dart';

class GetWordPressAnswer {
  final _dio = Dio();

  GetWordPressAnswer();

  Future<List<NewsModel>> getAnswer() async {
    final Response<dynamic> response;
    final List<NewsModel> newsModelList;

    try {
      response = await _dio.get(
        'https://hermandaddelased.org/wp-json/wp/v2/posts?per_page=3',
      );
      List<dynamic> news = response.data;
      newsModelList =
          news.take(3).map((json) => NewsModel.fromJsonMap(json)).toList();

      return newsModelList;
    } on DioException {
      return [];
    }
  }
}

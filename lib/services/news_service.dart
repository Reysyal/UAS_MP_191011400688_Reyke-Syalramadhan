import 'package:dio/dio.dart';
import 'package:news_app/models/news_detail_model.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/static/static_values.dart';

class NewsService {
  late Dio _dio;

  NewsService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://$kApiURLDomain/',
      ),
    );
  }

  Future<List<Data>> getNews() async {
    final response = await _dio.get(kApiEndPoint);

    return NewsModel.fromJson(response.data).data!;
  }

  Future<DetailData> getNewsDetail(int idNews) async {
    final response = await _dio.get('$kApiEndPoint/$idNews');

    return NewsDetailModel.fromJson(response.data).data!;
  }
}

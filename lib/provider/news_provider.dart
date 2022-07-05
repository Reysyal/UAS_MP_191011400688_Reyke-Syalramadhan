import 'package:flutter/material.dart';
import 'package:news_app/models/news_detail_model.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_service.dart';

class NewsProvider extends ChangeNotifier {
  final NewsService _newsService = NewsService();
  late List<Data> _newsModel;
  late DetailData _newsDetailModel;
  late bool _loading = true;

  bool get loading => _loading;
  List<Data> get newsModel => _newsModel;
  DetailData get newsDetailModel => _newsDetailModel;

  NewsProvider() {
    _fetchNews();
    notifyListeners();
  }

  _fetchNews() async {
    _newsModel = await _newsService.getNews();
    toggleLoading();
    notifyListeners();
  }

  fetchNewsDetail(int idNews) async {
    _newsDetailModel = await _newsService.getNewsDetail(idNews);
    toggleLoading();
    notifyListeners();
  }

  toggleLoading() {
    _loading = !_loading;
    notifyListeners();
  }

  getNewsCount() {
    return _newsModel.length;
  }
}

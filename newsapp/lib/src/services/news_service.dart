import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:newsapp/src/models/news_models.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'eec42355683a43da88a2225b35c00e8e';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=gb';
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}

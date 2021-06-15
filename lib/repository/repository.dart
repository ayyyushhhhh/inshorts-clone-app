import 'dart:async';
import 'package:inshorts_clone/models/news_model.dart';
import 'package:inshorts_clone/services/API/api_provider.dart';

enum NewsType {
  BreakingNews,
  TechNews,
  BuisnessNews,
  SportsNews,
}

class Repository {
  APIProvider _apiProvider = APIProvider();
  Stream<List<Article>> fetchBreakingNews() {
    return Stream.periodic(Duration(seconds: 5)).asyncMap((_) {
      return _apiProvider.fetchBreakingNews();
    });
  }

  Stream<List<Article>> fetchTechNews() {
    return Stream.periodic(Duration(seconds: 5)).asyncMap((_) {
      return _apiProvider.fetchTechNews();
    });
  }

  Stream<List<Article>> businessNews() {
    return Stream.periodic(Duration(seconds: 5)).asyncMap((_) {
      return _apiProvider.fecthBusinessNews();
    });
  }

  Stream<List<Article>> sportsNews() {
    return Stream.periodic(Duration(seconds: 5)).asyncMap((_) {
      return _apiProvider.fecthSportsNews();
    });
  }

  Stream<List<Article>> searchNews({required String search}) {
    return Stream.periodic(Duration(seconds: 5)).asyncMap((_) {
      return _apiProvider.fetchSearchNews(search: search);
    });
  }
}

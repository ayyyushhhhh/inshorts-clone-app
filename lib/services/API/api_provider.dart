import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inshorts_clone/models/news_model.dart';
import 'package:inshorts_clone/services/API/api_key.dart';

class APIProvider {
  List<Article> _newsArticles = [];
  final String _apiKey = APIkey.key;
  Future<List<Article>> fetchBreakingNews() async {
    final _url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=$_apiKey";
    http.Response response = await http.get(
      Uri.parse(_url),
    );
    return _checkResponse(response);
  }

  Future<List<Article>> fetchTechNews() async {
    final _url =
        "https://newsapi.org/v2/everything?q=technology&apiKey=$_apiKey";
    http.Response response = await http.get(
      Uri.parse(_url),
    );
    return _checkResponse(response);
  }

  Future<List<Article>> fecthBusinessNews() async {
    final _url = "https://newsapi.org/v2/everything?q=business&apiKey=$_apiKey";
    http.Response response = await http.get(
      Uri.parse(_url),
    );
    return _checkResponse(response);
  }

  Future<List<Article>> fecthSportsNews() async {
    final _url = "https://newsapi.org/v2/everything?q=sports&apiKey=$_apiKey";
    http.Response response = await http.get(
      Uri.parse(_url),
    );
    return _checkResponse(response);
  }

  Future<List<Article>> fetchSearchNews({required String search}) async {
    final _url = "https://newsapi.org/v2/everything?q=$search&apiKey=$_apiKey";
    http.Response response = await http.get(
      Uri.parse(_url),
    );
    return _checkResponse(response);
  }

  List<Article> _checkResponse(http.Response response) {
    if (response.statusCode == 200) {
      //_newsArticles.removeRange(0, _newsArticles.length - 1);
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      jsonData["articles"].forEach((article) {
        Article newsModel = Article.fromJson(article);
        _newsArticles.add(newsModel);
      });
      return _newsArticles;
    } else {
      throw response;
    }
  }
}

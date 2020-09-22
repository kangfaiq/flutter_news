import 'dart:convert';

import 'package:flutter_news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url ="http://newsapi.org/v2/top-headlines?country=id&apiKey=57d33599d36f4bd194a0ef0ada8e3c35";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["context"]
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class NewsCategory{
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{
    String url ="http://newsapi.org/v2/top-headlines?country=id&category=$category&apiKey=57d33599d36f4bd194a0ef0ada8e3c35";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["context"]
          );
          news.add(articleModel);
        }
      });
    }
  }
}
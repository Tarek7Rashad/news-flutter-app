import 'package:dio/dio.dart';
import 'package:news_app/Models/LNews_Article_Model.dart';

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);
  Future<List<LNewsArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=49353fed127543af8f569076942438f0&category=$category');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<LNewsArticleModel> lnewArticlesList = [];
      for (var article in articles) {
        LNewsArticleModel lNewsArticleModel =
            LNewsArticleModel.fromJson(article);
        lnewArticlesList.add(lNewsArticleModel);
      }
      return lnewArticlesList;
    } catch (e) {
      return [];
    }
  }
}

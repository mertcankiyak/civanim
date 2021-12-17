import 'package:civanim/view/main/article/model/article_model.dart';

abstract class ArticleBASE{

  Future<List<ArticleModel>> getArticleList();
}
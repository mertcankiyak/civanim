import 'package:civanim/locator.dart';
import 'package:civanim/view/main/article/base/article_base.dart';
import 'package:civanim/view/main/article/model/article_model.dart';
import 'package:civanim/view/main/article/service/article_service.dart';
import 'package:flutter/material.dart';

class ArticleViewModel with ChangeNotifier implements ArticleBASE{

  ArticleService _articleService = locator<ArticleService>();


  @override
  Future<List<ArticleModel>> getArticleList() async {
    try{
      return await _articleService.getArticleList();
    }catch(e){
      throw "getArticleList Hata: "+ e.toString();
    }
  }

}
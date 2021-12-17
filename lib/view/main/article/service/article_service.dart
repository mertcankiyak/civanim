import 'package:civanim/view/main/article/base/article_base.dart';
import 'package:civanim/view/main/article/model/article_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleService implements ArticleBASE{

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<ArticleModel>> getArticleList() async{
    List<ArticleModel> _articleList = [];
    QuerySnapshot<Map<String,dynamic>> makaleSorgula = await  _firebaseFirestore.collection("makaleler").get();
    makaleSorgula.docs.forEach((element) {
      _articleList.add(ArticleModel.fromMap(element.data()));
    });
    return _articleList;
  }

}
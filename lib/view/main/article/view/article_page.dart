import 'package:civanim/core/constants/colors.dart';
import 'package:civanim/core/constants/size.dart';
import 'package:civanim/core/init/theme/theme_notifier.dart';
import 'package:civanim/view/main/article/model/article_model.dart';
import 'package:civanim/view/main/article/view/article_detay_page.dart';
import 'package:civanim/view/main/article/viewmodel/article_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:civanim/core/extensions/size_extension.dart';

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _articleViewModel = Provider.of<ArticleViewModel>(context);
    final _theme = Provider.of<ThemeNotifier>(context).customTheme;
    return FutureBuilder(
        future: _articleViewModel.getArticleList(),
        builder: (BuildContext context, AsyncSnapshot<List<ArticleModel>> snapshots){
      return ListView.builder(itemCount: snapshots.data!.length,itemBuilder: (context, index){
        return Card(
          margin: context.spesificPadding(10, 10, 10, 10),
          elevation: 2,
          child: ListTile(
            contentPadding: context.minimumPadding,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleDetayPage(articleModel: snapshots.data![index])));
            },
            title: Text(snapshots.data![index].makaleBaslik!,style: _theme!.themeData!.textTheme.bodyText2,),
            subtitle: Text(snapshots.data![index].makaleIcerik!, maxLines: 2,overflow: TextOverflow.ellipsis, style: _theme.themeData!.textTheme.headline2),
            leading: CircleAvatar(backgroundImage: NetworkImage(snapshots.data![index].makaleFoto!), radius: SizeConstants.maximumSize,),
            trailing: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConstants.maximumSize),
                color: ConstantColors.softOrangeColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(snapshots.data![index].makaleKategori!, style: _theme.themeData!.textTheme.headline4,),
              ),
            ),
          ),
        );
      });
    });
  }
}

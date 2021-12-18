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
        builder: (BuildContext context,
            AsyncSnapshot<List<ArticleModel>> snapshots) {
          return ListView.builder(
              itemCount: snapshots.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SizeConstants.mediumSize),
                  ),
                  margin: context.spesificPadding(
                      SizeConstants.minimumSize,
                      SizeConstants.minimumSize,
                      SizeConstants.minimumSize,
                      SizeConstants.minimumSize),
                  elevation: 3,
                  child: ListTile(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArticleDetayPage(
                                  articleModel: snapshots.data![index])));
                    },
                    contentPadding: context.minimumPadding,
                    title: Text(
                      snapshots.data![index].makaleBaslik!,
                      style: _theme!.themeData!.textTheme.bodyText2,
                    ),
                    subtitle: Text(snapshots.data![index].makaleIcerik!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: _theme.themeData!.textTheme.headline2),
                    leading: ClipRRect(borderRadius: BorderRadius.all(
                      Radius.circular(
                        SizeConstants.minimumSize,
                      ),
                    ),child: Image.network(snapshots.data![index].makaleFoto!, fit: BoxFit.cover,)),
                    trailing: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(SizeConstants.maximumSize),
                        color: ConstantColors.softOrangeColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshots.data![index].makaleKategori!,
                          style: _theme.themeData!.textTheme.headline4,
                        ),
                      ),
                    ),
                  ),
                );
              });
        });
  }
}

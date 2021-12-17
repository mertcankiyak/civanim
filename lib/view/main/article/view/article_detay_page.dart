import 'package:civanim/core/constants/colors.dart';
import 'package:civanim/core/constants/size.dart';
import 'package:civanim/core/init/theme/theme_notifier.dart';
import 'package:civanim/view/main/article/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:civanim/core/extensions/timestamp_extension.dart';
import 'package:civanim/core/extensions/size_extension.dart';

class ArticleDetayPage extends StatelessWidget {
  final ArticleModel? articleModel;
  ArticleDetayPage({@required this.articleModel});
  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeNotifier>(context).customTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          SliverAppBar(
            forceElevated: true,
            backgroundColor: ConstantColors.softOrangeColor,
            shadowColor: Colors.black87,
            elevation: 15,
            pinned: true,
            floating: false,
            expandedHeight: 250.0,
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(SizeConstants.maximumSize))), //like this
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(SizeConstants.maximumSize)),
              child: FlexibleSpaceBar(
                  background: Image.network(articleModel!.makaleFoto!, fit: BoxFit.cover,), //changed it because I dont have the image asset
                  title: Text(articleModel!.makaleBaslik!, maxLines: 2, style: _theme!.themeData!.textTheme.headline3,)),
            ),
          ),
          //3
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Material(child: Padding(
                    padding: context.mediumPadding,
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.access_time),
                                Text(articleModel!.makaleTarih.dateTimeaCevir, style: _theme.themeData!.textTheme.bodyText2,),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.list_alt),
                                Text(articleModel!.makaleKategori!, style: _theme.themeData!.textTheme.bodyText2,),
                              ],
                            ),
                          ],
                        ),
                        Divider(),
                        Text(articleModel!.makaleIcerik!, style: _theme.themeData!.textTheme.headline2,),
                      ],
                    ),
                  )),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

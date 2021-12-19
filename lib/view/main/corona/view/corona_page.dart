import 'package:civanim/core/constants/colors.dart';
import 'package:civanim/core/init/theme/theme_notifier.dart';
import 'package:civanim/view/main/corona/model/corona_model.dart';
import 'package:civanim/view/main/corona/service/corona_service.dart';
import 'package:civanim/view/main/corona/viewmodel/corona_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:civanim/core/extensions/size_extension.dart';
import 'package:civanim/core/extensions/datetime_extension.dart';

class CoronaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _coronaViewModel = Provider.of<CoronaViewModel>(context);
    final _theme = Provider.of<ThemeNotifier>(context).customTheme;
    return ListView(
      padding: context.minimumPadding,
      children: [
        Text("COVID19 Türkiye Tablosu", textAlign: TextAlign.center,style: _theme!.themeData!.textTheme.headline6,),
        Text("Son 30 günlük veriyi içerir", textAlign: TextAlign.center,style: _theme.themeData!.textTheme.headline2,),
        Divider(),
        FutureBuilder(future: _coronaViewModel.getData(),
            builder: (BuildContext context, AsyncSnapshot<List<CoronaModel>?> snapshots){
              if(snapshots.hasData){
                return ListView.builder(physics: ScrollPhysics(),shrinkWrap: true,itemCount: 30,itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      contentPadding: context.minimumPadding,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: Text("Vefat", maxLines: 2,style: _theme.themeData!.textTheme.bodyText2,)),
                          Flexible(child: Text((snapshots.data![index].deaths!-snapshots.data![index+1].deaths!).toString(), maxLines: 2,style:_theme.themeData!.textTheme.headline2)),
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: Text("Toplam Vaka: "+snapshots.data![index].confirmed.toString(), maxLines: 2)),
                          Flexible(child: Text("Toplam Vefat: "+snapshots.data![index].deaths.toString(), maxLines: 2,)),

                        ],
                      ),
                      leading: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            color: ConstantColors.softOrangeColor,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Expanded(child: Text(snapshots.data![index].date!.dateTimeFormat.split("-")[2]+"."+snapshots.data![index].date!.dateTimeFormat.split("-")[1], style: _theme.themeData!.textTheme.headline3,)),
                              Expanded(child: Text(snapshots.data![index].date!.dateTimeFormat.split("-")[0], style: _theme.themeData!.textTheme.headline3,)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
              }else{
                return Center(child: CircularProgressIndicator());
              }
            }),
      ],
    );
  }
}

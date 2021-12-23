import 'package:civanim/core/constants/colors.dart';
import 'package:civanim/core/constants/size.dart';
import 'package:civanim/core/init/theme/theme_notifier.dart';
import 'package:civanim/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:civanim/view/main/article/model/article_model.dart';
import 'package:civanim/view/main/article/view/article_detay_page.dart';
import 'package:civanim/view/main/doctors/view/doctors_view.dart';
import 'package:civanim/view/main/home/model/doctors_model.dart';
import 'package:civanim/view/main/home/model/service_model.dart';
import 'package:civanim/view/main/home/viewmodel/doctors_viewmodel.dart';
import 'package:civanim/view/main/home/viewmodel/services_viewmodel.dart';
import 'package:civanim/view/main/services/view/services_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:civanim/core/extensions/size_extension.dart';
import 'package:civanim/core/extensions/timestamp_extension.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context).customTheme;
    final _servicesViewModel = Provider.of<ServicesViewModel>(context);
    final _doctorsViewModel = Provider.of<DoctorsViewModel>(context);
    final _loginViewModel = Provider.of<LoginViewModel>(context);
    return GlowingOverscrollIndicator(
      axisDirection: AxisDirection.down,
      color: ConstantColors.softOrangeColor,
      child: ListView(
        padding: context.mediumPadding,
        children: [
          Text(
            "Merhaba, "+(_loginViewModel.registerFirestoreModel.name ?? "") ,
            style: theme!.themeData!.textTheme.headline1,
          ),
          SizedBox(
            height: context.getWidth * 0.03,
          ),
          Text(
            "Bugün kendini nasıl hissediyorsun?",
            style: theme.themeData!.textTheme.headline2,
          ),
          SizedBox(
            height: context.getWidth * 0.06,
          ),
          GestureDetector(
            onTap: (){
              ArticleModel article = ArticleModel(
                makaleId: "1",
                makaleBaslik: "Psikolojinizi yönetin",
                makaleIcerik: "Virüsler kendi kendini çoğaltabilen, en basit organizmalar olarak bilinmektedir. Sadece genetik yapısını taşıyan DNA veya RNA denilen molekülleri çevreleyen bir protein tabakasından ibarettir.\nBazı virüslerde örneğin yeni koronavirüste olduğu gibi zarf adı verilen, onu çevreleyen bir yağ tabakası bulunmaktadır. Bu kadar basit bir organizmanın kendi kendine dışarda çoğalma yeteneği yoktur.\nVirüsler zorunlu hücre içi parazitidirler; konak adı verilen, kendilerinin özgün bir şekilde seçtiği hücrenin içerisine girdikleri zaman çoğalma yetenekleri olan mikroorganizmalardır. Bu durumu bilgisayar virüslerine benzetebiliriz.\nBilgisayar virüsleri de çok küçük bir programdır; tek başına bir bilgisayarı işletip, çalıştıramaz. Mutlaka kendini çoğaltabilmek için bilgisayar programı içerisine girip oradaki işletim sistemini kullanarak, kendisinin kopyalarını başka bilgisayarlara göndermeyi hedefler.",
                makaleTarih: Timestamp.now(),
                makaleFoto: "https://ichef.bbci.co.uk/news/976/cpsprodpb/166C8/production/_116084819_smallergettyimages-1204224469-1.jpg",
                makaleKategori: "Corona",
              );
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleDetayPage(articleModel: article,)));
            },
            child: Container(
              width: context.getWidth,
              height: context.getWidth * 0.35,
              decoration: BoxDecoration(
                color: ConstantColors.softBlackColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    20,
                  ),
                ),
              ),
              child: Padding(
                padding: context.mediumSymetricPadding,
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              flex: 2,
                              child: Text(
                                "Pandemi sırasında ruh sağlınıza dikkat edin",
                                style: theme.themeData!.textTheme.headline3,
                                maxLines: 3,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              )),
                          SizedBox(
                            height: context.getWidth * 0.05,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: ConstantColors.softOrangeColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: context.minimumPadding,
                              child: Text(
                                "Hemen oku",
                                style: theme.themeData!.textTheme.headline4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            left: 0,
                            top: 0,
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Image.asset("assets/images/doctor.png")),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
         /* SizedBox(
            height: context.getWidth * 0.06,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
            ),
            child: Padding(
              padding: context.spesificPadding(5, 5, 20, 0),
              child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    hintText: 'Ara',
                    hintStyle: theme.themeData!.textTheme.headline5,
                    border: InputBorder.none,
                    fillColor: Colors.grey,
                    focusColor: Colors.grey),
              ),
            ),
          ),*/
          SizedBox(
            height: context.getWidth * 0.06,
          ),
          Text(
            "Tüm Servisler",
            style: theme.themeData!.textTheme.headline6,
          ),
          SizedBox(
            height: context.getWidth * 0.06,
          ),
          Container(
            height: context.getHeight * 0.2,
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.right,
              color: ConstantColors.softOrangeColor,
              child: FutureBuilder(
                future: _servicesViewModel.getServiceList(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<ServiceModel>> snapshots) {
                  if (snapshots.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshots.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesPage(servisID: snapshots.data![index].serviceId, servisAdi: snapshots.data![index].serviceName,)));
                            },
                            child: Padding(
                              padding: context.minimumPadding,
                              child: Column(
                                children: [
                                  Container(
                                      height: context.getHeight * 0.12,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 10,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                          color: ConstantColors.whiteColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: FadeInImage(
                                          placeholder: NetworkImage(
                                              "https://i.hizliresim.com/9248mhs.gif"),
                                          image: NetworkImage(
                                              snapshots.data![index].serviceIcon!,
                                              scale: 4))),
                                  SizedBox(
                                    height: context.getWidth * 0.03,
                                  ),
                                  Text(
                                    snapshots.data![index].serviceName!,
                                    style: theme.themeData!.textTheme.headline2,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });

                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: context.getWidth * 0.06,
          ),
          Text(
            "Doktorlarımız",
            style: theme.themeData!.textTheme.headline6,
          ),
          Container(
            height: context.getHeight * 0.23,
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.right,
              color: ConstantColors.softOrangeColor,
              child: FutureBuilder(
                future: _doctorsViewModel.getDoctorsList(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<DoctorsModel>> snapshots) {
                  if (snapshots.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshots.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorsPage(doktorBilgileri: snapshots.data![index],)));
                            },
                            child: Padding(
                              padding: context.spesificPadding(
                                  SizeConstants.mediumSize,
                                  SizeConstants.minimumSize,
                                  SizeConstants.minimumSize,
                                  SizeConstants.minimumSize),
                              child: Container(
                                width: context.getWidth * 0.8,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                    color: ConstantColors.whiteColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: context.mediumSymetricPadding,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                snapshots.data![index].doctorFoto!),
                                            backgroundColor:
                                                ConstantColors.greyColor,
                                            radius: 30,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshots.data![index].doctorName! +" "+ snapshots.data![index].doctorSoyadi!,
                                                  style: theme.themeData!
                                                      .textTheme.headline6,
                                                ),
                                                Text(
                                                  snapshots.data![index].doctorUzmanlik!,
                                                  style: theme.themeData!
                                                      .textTheme.headline5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: context.mediumSymetricPadding,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    spreadRadius: 1,
                                                    blurRadius: 10,
                                                    offset: Offset(0,
                                                        1), // changes position of shadow
                                                  ),
                                                ],
                                                color: ConstantColors.greyColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Padding(
                                              padding:
                                                  context.minimumSymetricPadding,
                                              child: Row(
                                                children: [
                                                  Icon(Icons.male),
                                                  Text(
                                                    snapshots.data![index].doctorCinsiyet!,
                                                    style: theme.themeData!
                                                        .textTheme.bodyText1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(),
                                          Container(
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    spreadRadius: 1,
                                                    blurRadius: 10,
                                                    offset: Offset(0,
                                                        1), // changes position of shadow
                                                  ),
                                                ],
                                                color: ConstantColors.greyColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Padding(
                                              padding:
                                                  context.minimumSymetricPadding,
                                              child: Row(
                                                children: [
                                                  Icon(Icons.date_range),
                                                  Text(
                                                    snapshots.data![index].doctorDate.yasHesapla,
                                                    style: theme.themeData!
                                                        .textTheme.bodyText1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 50,),
        ],
      ),
    );
  }
}

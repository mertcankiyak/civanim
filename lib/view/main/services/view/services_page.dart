import 'package:civanim/core/constants/colors.dart';
import 'package:civanim/core/constants/size.dart';
import 'package:civanim/core/init/theme/theme_notifier.dart';
import 'package:civanim/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:civanim/view/main/doctors/view/doctors_view.dart';
import 'package:civanim/view/main/home/model/doctors_model.dart';
import 'package:civanim/view/main/home/viewmodel/doctors_viewmodel.dart';
import 'package:civanim/view/main/home/viewmodel/services_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:civanim/core/extensions/size_extension.dart';
import 'package:civanim/core/extensions/timestamp_extension.dart';


class ServicesPage extends StatefulWidget {
  String? servisID;
  String? servisAdi;


  ServicesPage({required this.servisID, required this.servisAdi});

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context).customTheme;
    final _servicesViewModel = Provider.of<ServicesViewModel>(context);
    final _doctorsViewModel = Provider.of<DoctorsViewModel>(context);
    final _loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.servisAdi!),
        elevation: 0,
        centerTitle: true,
        backgroundColor: ConstantColors.bodyColor,
      ),
      body: FutureBuilder(
        future: _doctorsViewModel.servislerdekiDoktorlariGetir(servisID: widget.servisID!),
        builder: (BuildContext context, AsyncSnapshot<List<DoctorsModel>> snapshots){
          if(snapshots.hasData){
            return ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
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
                        height:context.getHeight * 0.18,
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
                                          style: theme!.themeData!
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
          }else{
            return Text("veri gelmedi");
          }
        },
      ),
    );
  }
}

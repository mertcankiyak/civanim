import 'package:civanim/core/constants/colors.dart';
import 'package:civanim/core/constants/size.dart';
import 'package:civanim/core/init/theme/theme_notifier.dart';
import 'package:civanim/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:civanim/view/main/chat/view/chat_page_detay.dart';
import 'package:civanim/view/main/chat/viewmodel/chat_viewmodel.dart';
import 'package:civanim/view/main/home/model/doctors_model.dart';
import 'package:civanim/view/main/profile/viewmodel/profile_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:civanim/core/extensions/size_extension.dart';
import 'package:civanim/core/extensions/timestamp_extension.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class DoctorsPage extends StatefulWidget {
  DoctorsModel? doktorBilgileri;
  DoctorsPage({required this.doktorBilgileri});
  @override
  _DoctorsPageState createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context).customTheme;
    final _loginViewModel = Provider.of<LoginViewModel>(context);
    final _chatViewModel = Provider.of<ChatViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.bodyColor,
        elevation: 0,
        title: Text("Doktor Bilgileri"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
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
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.doktorBilgileri!.doctorName!+ " " + widget.doktorBilgileri!.doctorSoyadi!,
                                  style: theme!.themeData!.textTheme.headline3,
                                  maxLines: 3,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: context.getWidth * 0.01,
                                ),
                                Text(
                                  widget.doktorBilgileri!.doctorUzmanlik!,
                                  style: theme.themeData!.textTheme.headline4,
                                  maxLines: 3,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: context.getWidth * 0.01,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: ConstantColors.whiteColor,
                                      size: 20,
                                    ),
                                    Text(
                                      widget.doktorBilgileri!.doctorTel!,
                                      style: theme.themeData!.textTheme.headline4,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            left: 0,
                            top: 0,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Image.network(widget.doktorBilgileri!.doctorFoto!)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: context.getWidth * 0.03,
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
                  color: ConstantColors.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: RichText(
                  text: TextSpan(
                    text: widget.doktorBilgileri!.doktorBilgi,
                    style: theme.themeData!.textTheme.headline2,
                  ),
                ),
              ),
            ),
            Padding(
              padding: context.spesificPadding(SizeConstants.minimumSize, 0, 0, 0),
              child: FlatButton(
                height: context.getWidth * 0.12,
                minWidth: context.getWidth,
                onPressed: () async {
                  //Burada bir chat odası oluştur Firebase'de
                  if (_loginViewModel.registerFirestoreModel.id == widget.doktorBilgileri!.doctorId) {
                    debugPrint("Kendinle mesajlaşamazsın");
                   /* Fluttertoast.showToast(
                        msg: "Kendinle mesajlaşamazsın şapşik :)",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);*/
                  } else {
                    var uuid = Uuid();
                    var chatOdaAdi = uuid.v4();
                    _chatViewModel
                        .sohbetOdasiOlustur(
                        chatOdaAdi,
                        [widget.doktorBilgileri!.doctorId!, _loginViewModel.registerFirestoreModel.id.toString()],
                        widget.doktorBilgileri!.doctorName! +" "+ Timestamp.now().dateTimeaCevir,
                        widget.doktorBilgileri!.doctorUzmanlik!,
                        widget.doktorBilgileri!.doctorFoto!, chatOdaAdi, _loginViewModel.registerFirestoreModel.id!)
                        .then(
                          (value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatDetay(chatIlanAdi: widget.doktorBilgileri!.doctorName! + " "+Timestamp.now().dateTimeaCevir, chatOdaAdi: chatOdaAdi, ilanAdresi: widget.doktorBilgileri!.doctorUzmanlik!, mesajiGonderen: _loginViewModel.registerFirestoreModel.id!, mesajGiden: widget.doktorBilgileri!.doctorId!, hizliMesaj: "hizliMesaj"),
                          ),
                        );
                      },
                    );
                  }

                  /*
                  ProfileModel guncellenecekProfil = ProfileModel(
                    name: _name.text,
                    surname: _surname.text,
                    email: _emailController.text,
                    birthday: Timestamp.fromDate(_secilenTarih!),
                    id: _loginViewModel.registerFirestoreModel.id,
                  );
                  await _profileViewModel.profileUpdate(guncellecekProfil: guncellenecekProfil).then((value){
                    debugPrint("Güncelleme işlemi: "+ value.toString());
                  });*/
                },
                color: ConstantColors.softOrangeColor,
                child: Padding(
                  padding: context.minimumPadding,
                  child: Text(
                    "Sohbeti Başlat",
                    style: theme.themeData!.textTheme.subtitle1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

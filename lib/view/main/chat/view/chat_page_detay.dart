import 'package:civanim/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:civanim/view/main/chat/model/mesaj_model.dart';
import 'package:civanim/view/main/chat/viewmodel/chat_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatDetay extends StatefulWidget {
  String? chatIlanAdi;
  String? chatOdaAdi;
  String? ilanAdresi;
  String? mesajiGonderen;
  String? mesajGiden;
  String? hizliMesaj;

  ChatDetay({
    @required this.chatIlanAdi,
    @required this.chatOdaAdi,
    @required this.ilanAdresi,
    @required this.mesajiGonderen,
    @required this.mesajGiden,
    @required this.hizliMesaj,
  });

  @override
  _ChatDetayState createState() => _ChatDetayState();
}

class _ChatDetayState extends State<ChatDetay> {
  var index = 0;
  var _mesaj = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mesaj.text = widget.hizliMesaj!;
  }

  @override
  Widget build(BuildContext context) {
    final _chatDetayViewModel = Provider.of<ChatViewModel>(context);
    final _loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.chatIlanAdi!,
              style:
              TextStyle(fontStyle: FontStyle.italic, color: Colors.black87),
            ),
            Text(
              widget.ilanAdresi!,
              style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: _chatDetayViewModel.mesajlariGetir(widget.chatOdaAdi!),
        builder: (BuildContext context, AsyncSnapshot<List<Mesaj>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemBuilder: (context, index) {
                      debugPrint(
                          "Mesajı alan baro: " + widget.mesajGiden.toString());
                      debugPrint(
                          "Mesajı gönderen baro: " + widget.mesajiGonderen.toString());

                      debugPrint("snapshot.data[index].gonderen: " +
                          snapshot.data![index].gonderen.toString() +
                          " _userViewModel.sharedUserID:" +
                       _loginViewModel.registerFirestoreModel.id!);
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        //color: Color(0xFFF6F6FC),
                        child: Row(
                          mainAxisAlignment: snapshot.data![index].gonderen ==
                              _loginViewModel.registerFirestoreModel.id!
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            //if benden==true ise sola hizala değilse sağa hizala
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8, top: 8, left: 8, right: 8),
                              child: Container(
                                width: snapshot.data![index].mesaj!.length >= 90
                                    ? (MediaQuery.of(context).size.width - 50)
                                    : (snapshot.data![index].mesaj!.length) +
                                    (MediaQuery.of(context).size.width *
                                        0.5),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  color: snapshot.data![index].gonderen ==
                                      _loginViewModel.registerFirestoreModel.id!
                                      ? Colors.pink.shade400
                                      : Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data![index].mesaj!,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color:
                                            snapshot.data![index].gonderen ==
                                                _loginViewModel.registerFirestoreModel.id!
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          snapshot.data![index].tarih!.day
                                              .toString() +
                                              "/" +
                                              snapshot.data![index].tarih!.month
                                                  .toString() +
                                              "/" +
                                              snapshot.data![index].tarih!.year
                                                  .toString() +
                                              " " +
                                              snapshot.data![index].tarih!.hour
                                                  .toString() +
                                              ":" +
                                              snapshot.data![index].tarih!.minute
                                                  .toString(),
                                          style: TextStyle(
                                              color: snapshot.data![index]
                                                  .gonderen ==
                                                  _loginViewModel.registerFirestoreModel.id!
                                                  ? Colors.white54
                                                  : Colors.grey,
                                              fontStyle: FontStyle.italic)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: snapshot.data!.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: TextField(
                      controller: _mesaj,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black38,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 14, top: 11, right: 15),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Bir mesaj yazın',
                        hintStyle: TextStyle(fontFamily: 'Ubuntu'),
                        labelStyle: TextStyle(fontFamily: 'Ubuntu'),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _chatDetayViewModel.mesajGonder(
                                _mesaj.text,
                                _loginViewModel.registerFirestoreModel.id!,
                                widget.chatOdaAdi!);
                            if(_loginViewModel.registerFirestoreModel.id! == widget.mesajGiden){
                             /* _chatDetayViewModel.FCMTokenSorgula(widget.mesajiGonderen).then((value) {
                                debugPrint("Gelen token değeri:"+ value.toString());
                                _chatDetayViewModel.bildirimGonder(value, "dataTitle", _mesaj.text, widget.mesajGiden);
                                _mesaj.clear();
                              });*/
                            }else{
                              /*_chatDetayViewModel.FCMTokenSorgula(widget.mesajGiden).then((value) {
                                debugPrint("Gelen token değeri:"+ value.toString());
                                _chatDetayViewModel.bildirimGonder(value, "dataTitle", _mesaj.text, widget.mesajiGonderen);
                                _mesaj.clear();
                              });*/
                            }


                          },
                          child: Icon(
                            Icons.send,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            );
          } else {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}

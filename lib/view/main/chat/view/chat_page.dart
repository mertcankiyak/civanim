
import 'package:civanim/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:civanim/view/main/chat/model/chat_model.dart';
import 'package:civanim/view/main/chat/view/chat_page_detay.dart';
import 'package:civanim/view/main/chat/viewmodel/chat_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
/*
const appID = "1fdcd9db51054dcd8ba9c7e7b168f309";
const token = "0061fdcd9db51054dcd8ba9c7e7b168f309IAB2h+mFy6jTIcEVy7+iwJ8sQPwp1cesChv/bz/cALr0i6axcrEAAAAAEADri2/Q8ObAYQEAAQDw5sBh";
*/


class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final _chatViewModel = Provider.of<ChatViewModel>(context);
    final _loginViewModel = Provider.of<LoginViewModel>(context);
    debugPrint("_userViewModel.sharedUserID: "+_loginViewModel.registerFirestoreModel.id.toString());
    return Scaffold(
      body: FutureBuilder(
          future: _chatViewModel.sohbetOdalariniListele(_loginViewModel.registerFirestoreModel.id!),
          builder: (BuildContext context, AsyncSnapshot<List<Chat>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Dismissible(
                    movementDuration: Duration(milliseconds: 500),
                    key: Key(snapshot.data![index].doktorAdi),
                    background: Container(
                      alignment: Alignment.centerRight,
                      color: Colors.orange.shade500,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.warning, color: Colors.white,),
                                Text("Bildir!", style: TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'Ubuntu', fontWeight: FontWeight.bold),),
                              ],
                            ),
                            SizedBox(height: 3,),
                            Text("Mesajlaşmayı bildirin", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic,),),
                          ],
                        ),
                      ),
                    ),
                    secondaryBackground: Container(
                      alignment: Alignment.centerRight,
                      color: Colors.red.shade500,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.delete, color: Colors.white,),
                                Text("Sil!", style: TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'Ubuntu', fontWeight: FontWeight.bold),),
                              ],
                            ),
                            SizedBox(height: 3,),
                            Text("Silmek için sola kaydırın", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic,),),
                          ],
                        ),
                      ),
                    ),
                    /* onDismissed: (deger){
                    if(deger == DismissDirection.endToStart){
                      setState(() {
                        _chatViewModel.sohbetOdasiniSil(snapshot.data[index].sohbetOdasiAdi);
                        snapshot.data.removeAt(index);
                      });

                    }else if(deger == DismissDirection.startToEnd){
                      debugPrint("Soldan sağa kaydırıldı");
                    }

                  },*/
                    // ignore: missing_return
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.endToStart) {
                        final bool res = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Uyarı"),
                                content: Text(
                                    "Mesajlaşmayı silmek istediğinizden emin misiniz?"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text(
                                      "Vazgeç",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text(
                                      "Evet Sil",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    onPressed: () {

                                      setState(() {
                                        _chatViewModel.sohbetOdasiniSil(snapshot.data![index].sohbetOdasiID);
                                        snapshot.data!.removeAt(index);
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                        return res;
                      } else if(direction == DismissDirection.startToEnd){
                        final bool res = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Uyarı"),
                                content: Text(
                                    "Mesajlaşmayı bildirmek istiyor musunuz? Gerekli incelemeler kısa bir süre içerisinde gerçekleştirilecektir."),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text(
                                      "Vazgeç",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text(
                                      "Evet. Bildir",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        //_chatViewModel.sohbetOdasiniSil(snapshot.data[index].sohbetOdasiAdi);
                                        //snapshot.data.removeAt(index);
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                        return res;
                      }
                    },
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatDetay(
                                chatIlanAdi: snapshot.data![index].doktorAdi,
                                chatOdaAdi: snapshot.data![index].sohbetOdasiID,
                                ilanAdresi: snapshot.data![index].doktorUzmanlik,
                                mesajGiden: snapshot.data![index].doktorID,
                                mesajiGonderen: snapshot.data![index].hastaID,
                                hizliMesaj: "",
                              ),
                            ),
                          );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white70,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    snapshot.data![index].doktorFoto,
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data![index].doktorAdi.length > 40 ? snapshot.data![index].doktorAdi.substring(0,30)+"...": snapshot.data![index].doktorAdi,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Ubuntu'),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(snapshot.data![index].doktorUzmanlik),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                  );
                },
                itemCount: snapshot.data!.length,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}


/*class CallPage extends StatefulWidget {
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  int? _remoteUid;
  late RtcEngine _engine;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAgora();
  }
  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = await RtcEngine.create(appID);
    await _engine.enableVideo();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user $uid joined");
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");
          setState(() {
            _remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );

    await _engine.joinChannel(token, "testapp", null, 0);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: _remoteVideo(),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: 100,
            height: 100,
            child: Center(
              child: RtcLocalView.SurfaceView(),
            ),
          ),
        ),
      ],
    );
  }

  // Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(uid: _remoteUid!);
    } else {
      return Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
}*/

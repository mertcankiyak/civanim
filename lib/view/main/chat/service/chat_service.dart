import 'dart:convert';

import 'package:civanim/view/main/chat/base/chat_base.dart';
import 'package:civanim/view/main/chat/model/chat_model.dart';
import 'package:civanim/view/main/chat/model/mesaj_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatServices implements ChatBase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<List<Chat>> sohbetOdalariniListele(String kullaniciAdi) async {
    List<Chat> _tumMesajOdalari = [];
    await firestore
        .collection("sohbet")
        .where("kisiler", arrayContains: kullaniciAdi)
        .get()
        .then((QuerySnapshot<Map<String,dynamic>> querySnapshot) {
      querySnapshot.docs.forEach((element) {
        debugPrint(element.data()["kisiler"][0]);
        debugPrint(element.data().toString());
        _tumMesajOdalari.add(Chat.fromMap(element.data()));
      });
    });
    return _tumMesajOdalari;
  }

  @override
  Stream<List<Mesaj>> mesajlariGetir(String chatOdasi) {
    var snapShot = firestore
        .collection('sohbet')
        .doc(chatOdasi)
        .collection("mesajlar")
        .orderBy("tarih", descending: true)
        .snapshots();
    return snapShot.map((mesajListesi) =>
        mesajListesi.docs.map((mesaj) => Mesaj.fromMap(mesaj.data())).toList());
  }

  @override
  Future<bool> mesajGonder(
      String mesaj, String gonderenKullaniciAdi, String chatOdasi) async {
    CollectionReference sohbet = FirebaseFirestore.instance
        .collection('sohbet')
        .doc(chatOdasi)
        .collection("mesajlar");

    Mesaj gonderilenMesajNesnesi = Mesaj();
    gonderilenMesajNesnesi.mesaj = mesaj;
    gonderilenMesajNesnesi.gonderen = gonderenKullaniciAdi;
    DateTime currentPhoneDate = DateTime.now();
    gonderilenMesajNesnesi.tarih = currentPhoneDate;
    await sohbet
        .add(gonderilenMesajNesnesi.toMap())
        .then((value) => print("Mesaj başarıyla gönderildi!"))
        .catchError((error) => print("Mesaj gönderilemedi! $error"));

    return true;
  }

  @override
  Future<String> sohbetOdasiOlustur(String chatOdasi, List<String> kisiler,
      String ilanAdi, String ilanAdres, String ilanFoto, int ilanID) async {
    try{
      var sohbetOdasiSorgula = await firestore
          .collection("sohbet")
          .where("ilanID", isEqualTo: ilanID)
          .where("kisiler", arrayContains: "bymuslera")
          .get();
      debugPrint("Firebase kişiler listesi 1: "+sohbetOdasiSorgula.docs[0].data()["kisiler"][0]);
      debugPrint("Firebase kişiler listesi 1: "+sohbetOdasiSorgula.docs[0].data()["kisiler"][1]);
      debugPrint("Firebase sohbetOdasiAdi: "+sohbetOdasiSorgula.docs[0].data()["sohbetOdasiAdi"]);

      var kisi1VarMi = kisiler.contains(sohbetOdasiSorgula.docs[0].data()["kisiler"][0]);
      var kisi2VarMi = kisiler.contains(sohbetOdasiSorgula.docs[0].data()["kisiler"][1]);

      if(kisi1VarMi == kisi2VarMi){
        debugPrint("Sohbet odası daha önce oluşturulmuştur.");

        var sohbetOdasiSorgula2 = await firestore
            .collection("sohbet")
            .where("sohbetOdasiAdi", isEqualTo: sohbetOdasiSorgula.docs[0].data()["sohbetOdasiAdi"])
            .get();

        return sohbetOdasiSorgula2.docs[0].data()["sohbetOdasiAdi"];
      }else{
        debugPrint("Sohbet odası yeni oluşturuldu.");
        await firestore.collection("sohbet").doc(chatOdasi).set({
          'ilanAdi': ilanAdi,
          'ilanAdres': ilanAdres,
          'ilanFoto': "http://192.168.1.5:1337" + ilanFoto,
          'kisiler': kisiler,
          'ilanID': ilanID,
          'sohbetOdasiAdi': chatOdasi,
        }).then((value) => debugPrint("Sohbet odası eklendi."));

        return chatOdasi;
      }
    }catch (e){
      debugPrint("Sohbet odası yeni oluşturuldu.");
      await firestore.collection("sohbet").doc(chatOdasi).set({
        'ilanAdi': ilanAdi,
        'ilanAdres': ilanAdres,
        'ilanFoto': "http://192.168.1.5:1337" + ilanFoto,
        'kisiler': kisiler,
        'ilanID': ilanID,
        'sohbetOdasiAdi': chatOdasi,
      }).then((value) => debugPrint("Sohbet odası eklendi."));

      return chatOdasi;
    }

  }

  @override
  Future<bool> sohbetOdasiniSil(String sohbetOdasiAdi) async {
    await firestore.collection("sohbet").doc(sohbetOdasiAdi).delete();
    return true;
  }

  @override
  Future<bool> bildirimGonder(String FCMToken, String dataTitle, String gonderilenMesaj, String kimden)  async {
    debugPrint("Bildirim giden kişinin FCMTokeni: "+ FCMToken);
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=AAAAKJNCvOg:APA91bGP5dfTlZu-1tLAr5Hof8rs_HcWfP_5YVQHAuK4--kQcV9Q9qBVpSxS-pKPs9fCUZrK11LmEcCL2OJ7RMuRwtsEZrGB0AkK7Alt_7Eo_DVKdVML549pVnHGCbfiLt-4lgUexdF6',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': '1 yeni mesaj aldınız',
            'title': "Shop'ar"
          },
          "data": <String, dynamic>{
            "kimden": "$kimden",
            "gelenMesaj": "$gonderilenMesaj"
          },
          "to": FCMToken,
        },
      ),
    ).then((value) {
      debugPrint("Bildirim İşlemi Chat Servisinden gönderildi: "+value.body.toString());
    });
    return true;
  }

  @override
  Future<String> FCMTokenSorgula(String kullaniciAdi) async {
    CollectionReference<Map<String,dynamic>> users = FirebaseFirestore.instance.collection('user');
    QuerySnapshot<Map<String,dynamic>> gelenVeri = await users.where("userName", isEqualTo: kullaniciAdi).get();
    if(gelenVeri.docs[0].data()["userFCMToken"] != null){
      debugPrint("FirebaseDe sorgulanan token: "+gelenVeri.docs[0].data()["userFCMToken"]);
      return gelenVeri.docs[0].data()["userFCMToken"];
    }else{
      debugPrint("FCMTokenSorgula da bir hata meydana geldi. ChatServices");
      return "null";
    }
  }
}
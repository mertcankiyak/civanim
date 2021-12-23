import 'package:civanim/locator.dart';
import 'package:civanim/view/main/chat/base/chat_base.dart';
import 'package:civanim/view/main/chat/model/chat_model.dart';
import 'package:civanim/view/main/chat/model/mesaj_model.dart';
import 'package:civanim/view/main/chat/service/chat_service.dart';
import 'package:flutter/material.dart';

class ChatViewModel with ChangeNotifier implements ChatBase{

  ChatServices _chatServices = locator<ChatServices>();



  @override
  Future<List<Chat>> sohbetOdalariniListele(String kullaniciAdi) async {
    return await _chatServices.sohbetOdalariniListele(kullaniciAdi);
  }

  @override
  Stream<List<Mesaj>> mesajlariGetir(String chatOdasi) {
    return  _chatServices.mesajlariGetir(chatOdasi);
  }

  @override
  Future<bool> mesajGonder(String mesaj, String gonderenKullaniciAdi, String chatOdasi) async {
    return await _chatServices.mesajGonder(mesaj, gonderenKullaniciAdi, chatOdasi);
  }

  @override
  Future<String> sohbetOdasiOlustur(String chatOdasi, List<String> kisiler, String ilanAdi, String ilanAdres, String ilanFoto, int ilanID) async {
    return await _chatServices.sohbetOdasiOlustur(chatOdasi, kisiler, ilanAdi, ilanAdres, ilanFoto, ilanID);
  }

  @override
  Future<bool> sohbetOdasiniSil(String sohbetOdasiAdi) async {
    return await _chatServices.sohbetOdasiniSil(sohbetOdasiAdi);
  }

  @override
  Future<bool> bildirimGonder(String FCMToken, String dataTitle, String gonderilenMesaj, String kimden) async {
    return await _chatServices.bildirimGonder(FCMToken, dataTitle, gonderilenMesaj, kimden);
  }

  @override
  Future<String> FCMTokenSorgula(String kullaniciAdi) async {
    //debugPrint("FCMTokenSorgula'ya gelen kullanıcıAdı: "+kullaniciAdi);
    return await _chatServices.FCMTokenSorgula(kullaniciAdi);

  }
}
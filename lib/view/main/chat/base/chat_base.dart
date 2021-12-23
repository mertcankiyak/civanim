import 'package:civanim/view/main/chat/model/chat_model.dart';
import 'package:civanim/view/main/chat/model/mesaj_model.dart';

abstract class ChatBase {

  Future<List<Chat>> sohbetOdalariniListele(String kullaniciAdi);
  Stream<List<Mesaj>> mesajlariGetir(String chatOdasi);
  Future<bool> mesajGonder(String mesaj, String gonderenKullaniciAdi, String chatOdasi);
  Future<String> sohbetOdasiOlustur(String chatOdasi, List<String> kisiler, String ilanAdi, String ilanAdres, String ilanFoto, int ilanID);
  Future<bool> sohbetOdasiniSil(String sohbetOdasiAdi);
  Future<bool> bildirimGonder(String FCMToken, String dataTitle, String gonderilenMesaj, String kimden);
  Future<String> FCMTokenSorgula(String kullaniciAdi);
}
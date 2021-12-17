import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleModel{

  String? makaleId;
  String? makaleBaslik;
  String? makaleIcerik;
  Timestamp? makaleTarih;
  String? makaleKategori;
  String? makaleFoto;


  ArticleModel.fromMap(Map<String, dynamic> map):
        makaleId = map['makale_id'],
        makaleBaslik = map['makale_baslik'],
        makaleIcerik = map['makale_icerik'],
        makaleTarih = map['makale_tarih'],
        makaleKategori = map['makale_kategori'],
        makaleFoto = map['makale_foto'];

}